#include <avr/io.h>
#include <avr/interrupt.h>
#include <avr/wdt.h>
#include <avr/pgmspace.h>

#include "pins.h"
#include "radio.h"
#include "../common/cc1101.h"

enum
{
    Mode_Manual     = 0,
    Mode_Base       = 1,
    Mode_Robot      = 2
};

uint8_t mode = Mode_Manual;

typedef struct
{
    uint8_t bmRequestType;
    uint8_t bRequest;
    uint16_t wValue;
    uint16_t wIndex;
    uint16_t wLength;
} USB_Setup_Request;

// Nonzero when we are transmitting.
// Used by GDO2 interrupt.
volatile uint8_t in_tx = 0;

volatile uint8_t use_freqest = 0;

// Used for putting words in descriptor byte arrays
#define WORD(x) ((x) & 0xff), (((x) >> 8) & 0xff)

const uint8_t device_desc[] PROGMEM =
{
    18,             // bLength
    1,              // bDescriptorType
    WORD(0x200),    // bcdUSB
    0xff,           // bDeviceClass
    0,              // bDeviceSubclass
    0,              // bDeviceProtocol
    32,             // bMaxPacketSize0
    WORD(0x3141),   // idVendor
    WORD(0x0003),   // idProduct
    WORD(0),        // bcdDevice
    0,              // iManufacturer
    0,              // iProduct
    0,              // iSerialNumber
    1               // bNumConfigurations
};

#define CONFIG_SIZE     9
#define INTF_SIZE       9
#define EP_SIZE         7
const uint8_t config_desc[] PROGMEM =
{
    // Configuration
    CONFIG_SIZE,    // bLength
    2,              // bDescriptorType
    WORD(           // wTotalLength
        CONFIG_SIZE +
        INTF_SIZE +
        EP_SIZE * 2),
    1,              // bNumInterfaces
    1,              // bConfigurationValue
    0,              // iConfiguration
    0xc0,           // bmAttributes
    0,              // MaxPower
    
    // Interface 0
    INTF_SIZE,      // bLength
    4,              // bDescriptorType
    0,              // bInterfaceNumber
    0,              // bAlternateSetting
    2,              // bNumEndpoints (not counting endpoint 0)
    0xff,           // bInterfaceClass
    0xff,           // bInterfaceSubclass
    0,              // bInterfaceProtocol
    0,              // iInterface
    
    // Endpoint 1: bulk OUT
    EP_SIZE,        // bLength
    5,              // bDescriptorType
    1,              // bEndpointAddress
    2,              // bmAttributes
    WORD(64),       // wMaxPacketSize
    0,              // bInterval
    
    // Endpoint 2: bulk IN
    EP_SIZE,        // bLength
    5,              // bDescriptorType
    0x82,           // bEndpointAddress
    2,              // bmAttributes
    WORD(64),       // wMaxPacketSize
    0               // bInterval
};

// Read n bytes from the current endpoint
void usb_read(void *buf, uint8_t n)
{
    while (n--)
    {
        *(uint8_t *)buf++ = UEDATX;
    }
}

// Sends the data currently in the FIFO (typically used to send a zero-length packet)
void usb_write_packet()
{
    clear(UEINTX, TXINI);
    loop_until_bit_is_set(UEINTX, TXINI);
}

// Send data from program memory
void usb_write_P(PGM_VOID_P buf, uint8_t len, uint16_t requested)
{
    // Only send up to the requested amount of data.
    // Otherwise we will be waiting forever for another IN token from the host.
    uint8_t n = len;
    if (n > requested)
    {
        n = requested;
    }
    
    uint8_t sent = 0;
    while (n--)
    {
        UEDATX = pgm_read_byte(buf++);
        ++sent;
        
        if (n == 0 || sent == 64)       //FIXME - Endpoint size
        {
            sent = 0;
            clear(UEINTX, TXINI);
            while (!(UEINTX & ((1 << TXINI) | (1 << RXOUTI))))
                ;
            if (bit_is_set(UEINTX, RXOUTI))
            {
                // Aborted by host
                return;
            }
        }
    }
    
    // Wait for status
    loop_until_bit_is_set(UEINTX, RXOUTI);
    clear(UEINTX, RXOUTI);
}

// Send data from RAM
void usb_write(void *buf, uint8_t len, uint16_t requested)
{
    // Only send up to the requested amount of data.
    // Otherwise we will be waiting forever for another IN token from the host.
    uint8_t n = len;
    if (n > requested)
    {
        n = requested;
    }
    
    uint8_t sent = 0;
    while (n--)
    {
        UEDATX = *(uint8_t *)buf++;
        ++sent;
        
        if (n == 0 || sent == 64)       //FIXME - Endpoint size
        {
            sent = 0;
            clear(UEINTX, TXINI);
            while (!(UEINTX & ((1 << TXINI) | (1 << RXOUTI))))
                ;
            if (bit_is_set(UEINTX, RXOUTI))
            {
                // Aborted by host
                return;
            }
        }
    }
    
    // Wait for status
    loop_until_bit_is_set(UEINTX, RXOUTI);
    clear(UEINTX, RXOUTI);
}

// Starts the bootloader
void bootloader()
{
    cli();
    set(UDCON, DETACH);
    ((void (*)(void))0x1800)();
}

// Disables and frees memory for all endpoints except 0.
void usb_free_endpoints()
{
    uint8_t old_ep = UENUM;
    
    uint8_t i;
    for (i = 1; i <= 4; ++i)
    {
        UENUM = i;
        clear(UECONX, EPEN);
        clear(UECFG1X, ALLOC);
    }
    
    UENUM = old_ep;
}

void fs_autocal(uint8_t x)
{
    x = (x << 4) | (radio_read(MCSM0) & ~0x60);
    radio_write(MCSM0, x);
}

void set_mode(uint8_t m)
{
    mode = m;
    
    switch (mode)
    {
        case Mode_Base:
            // Calibrate when going from IDLE (after TX) to RX only.
            // We start out in RX, so autocalibration is off.
            fs_autocal(0);
            
            // Reset TX/RX
            radio_command(SIDLE);
            radio_read(RXFIFO);
            radio_command(SFTX);
            radio_command(SFRX);
            
            // After TX, go to IDLE (GDO2 handler will move to RX so we calibrate).
            // After RX, stay in RX.
            // Turn off CCA.
            radio_write(MCSM1, RXOFF_IDLE | TXOFF_RX);
            
            // Reset and enable the RX timeout timer
            TCCR1B = 0;
            TCNT1H = 0;
            TCNT1L = 0;
            TCCR1B = 3;
            
            // Enable timer1 overflow interrupt
            set(TIFR1, TOV1);
            set(TIMSK1, TOIE1);
    
            // GDO2: packet received with good CRC
            in_tx = 0;
            
            // Go to RX (will calibrate first)
            radio_command(SRX);
            break;
        
        case Mode_Robot:
            // Calibrate when going from IDLE to RX/TX.
            fs_autocal(1);
            
            // Reset TX/RX
            radio_command(SIDLE);
            radio_read(RXFIFO);
            radio_command(SFTX);
            radio_command(SFRX);
            
            // After RX, go to IDLE.
            // After TX, go to RX.
            // Turn off CCA.
            radio_write(MCSM1, RXOFF_IDLE | TXOFF_RX);
            
            // Reset and enable the RX timeout timer
            TCCR1B = 0;
            TCNT1H = 0;
            TCNT1L = 0;
            TCCR1B = 3;
            
            // Enable timer1 overflow interrupt
            set(TIFR1, TOV1);
            set(TIMSK1, TOIE1);
    
            // GDO2: packet received with good CRC
            in_tx = 0;
            
            // Go to RX (will calibrate first)
            radio_command(SRX);
            break;
            
        case Mode_Manual:
        default:
            // Turn off all automatic state changes:
            
            // Disable timer1
            clear(TIMSK1, TOIE1);
            TCCR1B = 0;
            set(TIFR1, TOV1);
            
            // GDO2: packet received with good CRC
            in_tx = 0;
            
            // Turn off FS_AUTOCAL in MCSM0
            fs_autocal(0);
            
            // Turn off RXOFF_MODE and TXOFF_MODE in MCSM1
            radio_write(MCSM1, 0);
            break;
    }
}

// Called when a SETUP packet is received on endpoint 0.
void usb_handle_setup()
{
    // Read the packet
    USB_Setup_Request req;
    usb_read(&req, 8);
    
    // Clear the FIFO
    //FIXME - Do this later if this is an OUT transfer (host will be sending in the DATA stage)?
    clear(UEINTX, RXSTPI);
    
    // Every request must end with either an IN packet (usb_write_packet or similar) or
    // a STALL, which is sent if valid == 0.
    uint8_t valid = 1;
    
    if ((req.bmRequestType & 0x60) == 0)
    {
        // Device request
        switch (req.bRequest)
        {
            case 0x01:  // Clear feature
                if (req.wValue == 0 && req.bmRequestType == 0x02)
                {
                    // Endpoint halt
                    UENUM = req.wIndex;
                    set(UECONX, RSTDT);
                    UENUM = 0;
                } else {
                    valid = 0;
                    break;
                }
                
                usb_write_packet();
                break;
            
            //FIXME - Set feature
            
            case 0x05:  // Set address
                UDADDR = (UDADDR & (1 << ADDEN)) | (req.wValue & 0x7f);
                usb_write_packet();
                set(UDADDR, ADDEN);
                break;
                
            case 0x06:  // Get descriptor
                if (req.wValue == 0x0100)
                {
                    // Get device descriptor
                    usb_write_P(device_desc, sizeof(device_desc), req.wLength);
                } else if (req.wValue == 0x0200)
                {
                    // Get configuration descriptor
                    usb_write_P(config_desc, sizeof(config_desc), req.wLength);
                } else {
                    valid = 0;
                }
                break;
            
            case 0x09:  // Set configuration
                usb_free_endpoints();
                
                if (req.wValue == 1)
                {
                    // Configuration 1
                    // Endpoint 3: bulk OUT
                    //   64-byte packets
                    //   Single buffer
                    UENUM = 1;
                    UECONX = (1 << EPEN);       // Do this before other configuration
                    UEIENX = (1 << RXOUTE);
                    UECFG0X = (2 << EPTYPE0);
                    UECFG1X = (3 << EPSIZE0);
                    set(UECFG1X, ALLOC);
                    
                    // Endpoint 2: bulk IN
                    //   64-byte packets
                    //   Single buffer
                    UENUM = 2;
                    UECONX = (1 << EPEN);       // Do this before other configuration
                    UECFG0X = (2 << EPTYPE0) | (1 << EPDIR);
                    UECFG1X = (3 << EPSIZE0);
                    set(UECFG1X, ALLOC);
                    
                    set(PORTB, LED_GREEN);
                    UENUM = 0;
                } else if (req.wValue == 0)
                {
                    // Configuration 0 (unconfigured)
                    clear(PORTB, LED_GREEN);
                } else {
                    valid = 0;
                    break;
                }
                
                set_mode(Mode_Manual);
                
                usb_write_packet();
                break;
            
            default:
                valid = 0;
                break;
        }
    } else if ((req.bmRequestType & 0x7f) == 0x40)
    {
        // Vendor request
        switch (req.bRequest)
        {
            case 0:     // LED
                if (req.wValue & 1)
                {
                    set(PORTB, LED_RED);
                } else {
                    clear(PORTB, LED_RED);
                }
                usb_write_packet();
                break;
            
            case 1:     // Write register
                radio_write(req.wIndex, req.wValue);
                usb_write_packet();
                break;
            
            case 2:     // Command
                radio_command(req.wIndex);
                usb_write_packet();
                break;
            
            case 3:     // Read register
                if ((req.bmRequestType & 0x80) && req.wLength > 0)
                {
                    uint8_t value = radio_read(req.wIndex);
                    usb_write(&value, 1, req.wLength);
                } else {
                    valid = 0;
                }
                break;
            
            case 4:     // Mode
                set_mode(req.wValue);
                usb_write_packet();
                break;
            
            case 0xff:  // Bootloader
                usb_write_packet();
                bootloader();
                break;
            
            default:
                valid = 0;
                break;
        }
    } else {
        valid = 0;
    }
    
    if (!valid)
    {
        // Unsupported request: stall EP0
        set(UECONX, STALLRQ);
    }
}

void handle_ep1_rx()
{
    // Received TX data on endpoint 1.
    
    set(PORTB, LED_RED);
    
    // Acknowledge the interrupt
    clear(UEINTX, RXOUTI);
    
    // Copy data to the radio transmit FIFO
    //FIXME - Monitor status and wait for free space
    radio_select();
    spi_write(TXFIFO | CC_BURST);
    while (UEBCLX)
    {
        spi_write(UEDATX);
    }
    radio_deselect();
    
    if (mode == Mode_Base)
    {
        // Turn off the RX calibration timer.
        // It will be reset and turned back on when TX is done.
        clear(TIMSK1, TOIE1);
        TCCR1B = 0;
        set(TIFR1, TOV1);
        
        in_tx = 1;
    }
    
    // Start transmission
    radio_command(STX);
    
    // Free the bank
    clear(UEINTX, FIFOCON);
}

void handle_radio_rx()
{
    // The radio received a packet.
    
    PORTB ^= 1 << LED_RED;
    
    // Reset the calibration timer
    TCCR1B = 0;
    TCNT1H = 0;
    TCNT1L = 0;
    TCCR1B = 3;
    
    uint8_t n = radio_read(RXBYTES);
    if (n == 0)
    {
        // No data means bad CRC, so the packet was flushed automatically.
        // Go back to receive mode (with autocalibrate).
        radio_command(SRX);
        return;
    }
    
    if (use_freqest)
    {
        // Copy FREQEST to FREQOFF
        radio_write(FSCTRL0, radio_read(FREQEST));
    }
    
    if (mode == Mode_Robot)
    {
        uint8_t buf[64];
        
        // RX-TX time:
        //   Read RXFIFO then write TXFIFO: 2.320ms
        //   Just write TXFIFO: 1.600ms
        //   Turn on TX immediately: 0.880ms
        
        radio_select();
        spi_write(RXFIFO | CC_READ | CC_BURST);
        for (uint8_t i = 0; i < n; ++i)
        {
            buf[i] = spi_write(SNOP);
        }
        radio_deselect();
        
        radio_select();
        spi_write(TXFIFO | CC_BURST);
        for (uint8_t i = 0; i < (n - 2); ++i)
        {
            spi_write(buf[i]);
        }
        radio_deselect();
        
        radio_command(SFRX);
        radio_command(STX);
        
        // Turn off the RX calibration timer.
        // It will be reset and turned back on when TX is done.
        clear(TIMSK1, TOIE1);
        TCCR1B = 0;
        set(TIFR1, TOV1);
        
        in_tx = 1;
        return;
    }
    
    // Base and Manual modes:
    
    if (mode == Mode_Base)
    {
        // Turn off autocalibration
        fs_autocal(0);
    }
    
    // Select the bulk IN endpoint
    UENUM = 2;
    
    // If there is data waiting to be sent, replace it
    if (UESTA0X & 0x03)
    {
        // Kill the current bank
        set(UEINTX, RXOUTI);
        loop_until_bit_is_clear(UEINTX, RXOUTI);
        
        // Reset the endpoint
        UERST = 1 << 2;
        UERST = 0;
    }
        
    // Read RXFIFO (burst)
    radio_select();
    spi_write(RXFIFO | CC_READ | CC_BURST);
    while (n--)
    {
        UEDATX = spi_write(SNOP);
        // We don't care about multiple packets because the FIFO size on the
        // radio is the maximum USB packet size.
    }
    radio_deselect();
    
    // Mark the endpoint FIFO as ready to be sent
    clear(UEINTX, TXINI);
    clear(UEINTX, FIFOCON);
}

void handle_radio_tx()
{
    // The radio finished transmitting a packet.
    // The state transition for TXOFF_MODE has started.
    
    // Reset and enable the RX timeout timer
    TCCR1B = 0;
    TCNT1H = 0;
    TCNT1L = 0;
    TCCR1B = 3;
    set(TIFR1, TOV1);
    set(TIMSK1, TOIE1);
    
    // The next interrupt will be for received data.
    in_tx = 0;
    
    clear(PORTB, LED_RED);
}

ISR(INT6_vect)
{
    if (in_tx)
    {
        handle_radio_tx();
    } else {
        handle_radio_rx();
    }
}

ISR(USB_GEN_vect)
{
    if (bit_is_set(UDINT, WAKEUPI))
    {
        // Wakeup (USB bus activity is detected)
        
        // We have to turn off the interrupt or it will trigger frequently when
        // the device is active.  This causes all sorts of weird problems.
        clear(UDIEN, WAKEUPE);
        
        // Start the 48MHz PLL
        set(PLLCSR, PLLE);
        loop_until_bit_is_set(PLLCSR, PLOCK);
        
        // Enable the USB clock
        clear(USBCON, FRZCLK);
        
        // Clear the interrupt flag after starting the clock
        clear(UDINT, WAKEUPI);
        
        // The USB controller will indicate end-of-reset soon.
        // The end-of-reset handler will set up endpoints.
    }
    
    if (bit_is_set(UDINT, EORSTI))
    {
        // USB reset
        clear(UDINT, EORSTI);
        
        usb_free_endpoints();
        
        // Turn off the green LED
        clear(PORTB, LED_GREEN);
        
        // Endpoint 0: control
        //   32-byte packets (so we can send the device and config descriptors in one packet)
        //   Single buffer
        UENUM = 0;
        clear(UECONX, EPEN);
        clear(UECFG1X, ALLOC);
        UECONX = (1 << EPEN);       // Do this before other configuration
        UEIENX = (1 << RXSTPE);
        UECFG0X = 0;
        UECFG1X = (2 << EPSIZE0);
        set(UECFG1X, ALLOC);
    }
}

ISR(USB_COM_vect)
{
    UENUM = 0;
    if (bit_is_set(UEINTX, RXSTPI))
    {
        usb_handle_setup();
    }
    
    UENUM = 1;
    if (bit_is_set(UEINTX, RXOUTI))
    {
        handle_ep1_rx();
    }
}

ISR(TIMER1_OVF_vect)
{
#if 1
    // RX timeout: recalibrate
    set(PORTB, LED_RED);
    
    // Go to IDLE.  This only takes 2 radio clocks.
    radio_command(SIDLE);
    
    // Flush the RX FIFO in case we were receiving a packet
    // and cut it off.
    radio_read(RXFIFO);
    radio_command(SFRX);
    
    // Calibrate and go to RX.
    radio_command(SRX);
    
    // Reset FREQOFF
    radio_write(FSCTRL0, 0x00);
    
    clear(PORTB, LED_RED);
#endif
}
    
int main()
{
    // Disable the watchdog timer.
    // This must be done in case we are started from the clear_bit,
    // which uses the WDT to reset.
    wdt_reset();
    clear(MCUSR, WDRF);
    WDTCSR |= (1 << WDCE) | (1 << WDE);
    WDTCSR = 0;
    
    // Run at full clock speed
    CLKPR = 1 << CLKPCE;
    CLKPR = 0;
    
    // Set up I/O ports
    PORTB = (1 << MISO) | (1 << nSS);
    DDRB = (1 << LED_RED) | (1 << LED_GREEN) | (1 << MOSI) | (1 << SCK) | (1 << nSS);
    
    PORTD = (1 << nCS);
    DDRD = (1 << nCS);
    
    // Set up SPI mode 0 (clock idles low, data sampled on rising edge)
    SPCR = (1 << SPE) | (1 << MSTR) | (1 << SPR0);
    
    // Reset the USB controller.
    // This will disable all interrupts and endpoints too.
    USBCON = (1 << FRZCLK);
    UDCON = (1 << DETACH);
    
    // Set up radio
    set(PORTB, LED_RED);
    radio_wait();
    radio_command(SIDLE);
//    radio_init();
    clear(PORTB, LED_RED);
    
    // Enable the USB controller
    set(USBCON, USBE);
    
    // Attach device
    clear(UDCON, DETACH);
    
    // Enable interrupts
    UDIEN = (1 << WAKEUPE) | (1 << EORSTE);
    
    // Configure external interrupt 6 (GDO2 from radio)
    radio_write(IOCFG2, 6 | GDOx_INVERT);
    EICRB = 0x30;           // Rising edge on INT6
    set(EIFR, 6);           // Clear any stale interrupt
    set(EIMSK, 6);          // Enable INT6
    
    sei();
    
    while (1)
    {
    }
}
