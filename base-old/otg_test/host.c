#include <stdio.h>

#include <avr/io.h>
#include <avr/interrupt.h>
#include <avr/wdt.h>
#include <avr/pgmspace.h>
#include <avr/sleep.h>

#include "bits.h"
#include "serial.h"

#define RED1    7
#define GREEN1  6
#define GREEN2  5
#define RED2    4

enum
{
    // No device is connected.
    USB_Disconnected,
    
    // A device is connected but not configured.
    USB_Connected,
    
    // A device is connected, configured, and ready to use.
    USB_Configured,
    
    // An error occurred during connection or configuration.
    // The device can't be used until it is reconnected.
    USB_Broken
};

volatile uint8_t usb_state = USB_Disconnected;

enum
{
    Dev_Unknown,
    Dev_RumblePad2,
    Dev_SpaceNav
};

uint8_t device_type = Dev_Unknown;

typedef struct
{
    uint8_t bmRequestType;
    uint8_t bRequest;
    uint16_t wValue;
    uint16_t wIndex;
    uint16_t wLength;
} usb_control_t;

void usb_send()
{
    // Clear the interrupt flag.
    clear_bit(UPINTX, TXOUTI);
    
    // Start the transfer.
    clear_bit(UPINTX, FIFOCON);
}

void usb_wait(int ms)
{
    clear_bit(UHINT, HSOFI);
    while (ms--)
    {
        loop_until_bit_is_set(UHINT, HSOFI);
        clear_bit(UHINT, HSOFI);
    }
}

static inline int usb_cur_pipe_size()
{
    return 1 << (((UPCFG1X & 0x30) >> 4) + 3);
}

// Sets the packet size of the current pipe.
// s must be a power of two on the range [8, 256].
void usb_set_cur_pipe_size(int s)
{
    char i;
    for (i = 3; i <= 8; ++i)
    {
        if (s & (1 << i))
        {
            break;
        }
    }
    
    UPCFG1X &= ~0x30;
    UPCFG1X |= (i - 3) << 4;
}

// Waits for an IN packet or a STALL.
// Returns nonzero on IN or zero on STALL.
char usb_wait_rx()
{
    while (1)
    {
        if (bit_is_set(UPINTX, RXINI))
        {
            clear_bit(UPINTX, RXINI);
            return 1;
        }
        
        if (bit_is_set(UPINTX, RXSTALLI))
        {
            clear_bit(UPINTX, RXSTALLI);
            return 0;
        }
    }
}

void usb_setup_write(const usb_control_t *c)
{
    usb_wait(1);
    
    UPNUM = 0;
    UPCFG0X = 0x00;
    
    uint8_t i;
    const uint8_t *data = (const uint8_t *)c;
    for (i = 0; i < 8; ++i)
    {
        UPDATX = *(uint8_t *)data++;
    }
    
    clear_bit(UPINTX, TXSTPI);
    clear_bit(UPCONX, PFREEZE);
    usb_send();
    loop_until_bit_is_set(UPINTX, TXSTPI);
    clear_bit(UPINTX, TXSTPI);
    set_bit(UPCONX, PFREEZE);
}

uint16_t usb_control_in(const usb_control_t *c, uint8_t *data)
{
    usb_setup_write(c);

    uint16_t read_len = 0;
    if (data)
    {
        // Data stage (IN)
        UPCFG0X = 0x10;
    
        while (read_len < c->wLength)
        {
            // Wait for IN data or a STALL
            clear_bit(UPCONX, PFREEZE);
            char ret = usb_wait_rx();
            set_bit(UPCONX, PFREEZE);
            
            if (ret == 0)
            {
                // Stalled
                return 0;
            }
            
            // Read this packet
            char partial = (UPBCX < usb_cur_pipe_size());
            while (UPBCX && read_len < c->wLength)
            {
                uint8_t byte = UPDATX;
                *data++ = byte;
                ++read_len;
            }
            
            clear_bit(UPINTX, FIFOCON);
            
            if (partial)
            {
                break;
            }
        }
    }
    
    // Status stage (OUT)
    UPCFG0X = 0x20;
    
    clear_bit(UPCONX, PFREEZE);
    loop_until_bit_is_set(UPINTX, TXOUTI);
    usb_send();
    loop_until_bit_is_set(UPINTX, TXOUTI);
    set_bit(UPCONX, PFREEZE);
    
    return read_len;
}

char usb_control_out(const usb_control_t *c, uint8_t *data)
{
    usb_setup_write(c);

#if 0
    // Data stage (OUT)
    UPCFG0X = 0x20;

    //FIXME - Send data
    clear_bit(UPCONX, PFREEZE);
//    loop_until_bit_is_set(UPINTX, TXOUTI);
//    usb_send();
//    loop_until_bit_is_set(UPINTX, TXOUTI);
    set_bit(UPCONX, PFREEZE);
#endif

    // Status stage (IN).
    // The device will send either a STALL or a zero-length IN packet.
    UPCFG0X = 0x10;
    
    // Wait for a response.
    clear_bit(UPCONX, PFREEZE);
    char ret = usb_wait_rx();
    set_bit(UPCONX, PFREEZE);

    // Clear interrupt flags.
    clear_bit(UPINTX, RXINI);
    clear_bit(UPINTX, RXSTALLI);
    
    if (ret)
    {
        // Clear FIFOCON to mark the buffer as free.
        // Only do this if RXIN was set_bit (not stalled).
        clear_bit(UPINTX, FIFOCON);
    }
    
    return ret;
}

char identify_device(uint16_t vid, uint16_t pid)
{
    if (vid == 0x046d)
    {
        printf_P(PSTR("Logitech "));
        
        if (pid == 0xc219)
        {
            printf_P(PSTR("Cordless RumblePad 2"));
            return Dev_RumblePad2;
        } else if (pid == 0xc626)
        {
            printf_P(PSTR("SpaceNavigator"));
            return Dev_SpaceNav;
        }
    }
    
    printf_P(PSTR("(unknown)"));
    
    return Dev_Unknown;
}

// Reads descriptors and sets up the device.
// Called immediately after the device is connected and reset.
char configure_device()
{
    // Read the first 8 bytes of the device descriptor.
    // The last byte is the endpoint size on the device.
    // We can only assume that it is at least 8, so we have to
    // read the full descriptor again when we know the true value.
    usb_control_t c;
    c.bmRequestType = 0x80;
    c.bRequest = 6;
    c.wValue = 0x0100;
    c.wIndex = 0;
    c.wLength = 8;
    uint8_t desc[18];
    if (usb_control_in(&c, desc) != 8)
    {
        // Failed to read device descriptor
        return 0;
    }
    
    if (desc[0] != 0x12 || desc[1] != 0x01)
    {
        // Bad device descriptor
        return 0;
    }
    
    // Update endpoint size and reallocate its memory.
    clear_bit(UPCONX, PEN);                 // Disable and reset
    set_bit(UPCONX, PEN);                   // Re-enable
    set_bit(UPCONX, INMODE);                // Allow unlimited IN tokens
    usb_set_cur_pipe_size(desc[7]);         // Set packet size
    set_bit(UPCONX, ALLOC);                 // Allocate buffer memory
    
    // Read the full device descriptor
    c.wLength = 18;
    if (usb_control_in(&c, desc) != 18)
    {
        // Failed to read device descriptor
        return 0;
    }
    
    uint16_t vid = desc[8] | (desc[9] << 8);
    uint16_t pid = desc[10] | (desc[11] << 8);
    printf_P(PSTR("  ID %04x:%04x: "), vid, pid);
    device_type = identify_device(vid, pid);
    printf_P(PSTR("\n"));
    
    // Set address
    c.bmRequestType = 0x00;
    c.bRequest = 5;
    c.wValue = 1;
    c.wIndex = 0;
    c.wLength = 0;
    if (!usb_control_out(&c, 0))
    {
        // Failed to set address
        return 0;
    }
    UHADDR = 1;
    
    // Set configuration 1
    c.bmRequestType = 0x00;
    c.bRequest = 9;
    c.wValue = 1;
    c.wIndex = 0;
    c.wLength = 0;
    if (!usb_control_out(&c, 0))
    {
        // Failed to set configuration
        return 0;
    }
    
    // Set up pipe 1 for EP1 interrupt IN
    UPNUM = 1;
    set_bit(UPCONX, PEN);
    set_bit(UPCONX, INMODE);
    UPCFG0X = (3 << PTYPE0) | (1 << PTOKEN0) | 1;
    UPCFG1X = (1 << ALLOC);
    UPCFG2X = 10;
    clear_bit(UPCONX, PFREEZE);
    UPIENX = (1 << RXINE);
    
    return 1;
}

ISR(USB_GEN_vect)
{
    if (bit_is_set(OTGINT, SRPI))
    {
        // Device detected while VBus is forced on.
        clear_bit(OTGINT, SRPI);
        
        printf_P(PSTR("Device connected\n"));
        
        // Switch to the Host Ready state.
        // We have to do this even though we're manually controlling VBus because
        // the USB core needs to change state.
        set_bit(OTGCON, VBUSREQ);
        
        // DCONNI will be set_bit shortly.
    }
    
    if (bit_is_set(UHINT, DCONNI))
    {
        // Device connected.
        clear_bit(UHINT, DCONNI);
        
        // Reset the bus.  After the reset, SOFEN will be set_bit automatically.
        // The bus activity will keep VBus on until the device is disconnected.
        set_bit(UHCON, RESET);
        
        // Configuration happens in response to RSTI.
    }
    
    if (bit_is_set(UHINT, DDISCI))
    {
        // Device disconnected.
        clear_bit(UHINT, DDISCI);
        
        usb_state = USB_Disconnected;
        printf_P(PSTR("Device disconnected\n"));
        
        // Turn off all pipes to reset them.
        char i;
        for (i = 0; i < 6; ++i)
        {
            UPNUM = i;
            clear_bit(UPCONX, PEN);
        }
        
        // Move the USB core to the Host Idle state.
        // We have to do this even though we're manually controlling VBus because
        // the USB core needs to change state.
        set_bit(OTGCON, VBUSRQC);
        
        PORTD = (1 << GREEN1);
    }
    
    if (bit_is_set(UHINT, RSTI))
    {
        // Reset finished.
        clear_bit(UHINT, RSTI);
        
        // Configure pipe 0 for EP0 control
        UPNUM = 0;
        UPCONX = (1 << PFREEZE) | (1 << PEN);
        UPCFG1X = (3 << PSIZE0) | (1 << ALLOC);
        
        usb_state = USB_Connected;
    }
}

int8_t drive_x, drive_y, drive_spin;

void update_rumblepad2(const uint8_t *buf)
{
    drive_x = buf[3] - 0x80;
    drive_y = 0x7f - buf[4];
    drive_spin = 0x7f - buf[1];
}

void update_spacenav(const uint8_t *buf)
{
    // SpaceNav sends 3 reports:
    //   1: Translation (along X, Y, ZZ)
    //   2: Rotation (around X, Y, Z)
    //   3: Buttons (byte 0 bits 0 and 1 are left and right)
    //
    // Each axis measurement is two bytes (little endian).
    // Range is less than [-511, 511].
    
    if (buf[0] == 1)
    {
        // Translation
        drive_x = *(const int16_t *)(buf + 1) / 4;
        drive_y = -*(const int16_t *)(buf + 3) / 4;
    } else if (buf[0] == 2)
    {
        // Rotation
        drive_spin = -*(const int16_t *)(buf + 5) / 4;
    }
}

ISR(USB_COM_vect)
{
    UPNUM = 1;
    if (usb_state == USB_Configured && bit_is_set(UPINTX, RXINI))
    {
        clear_bit(UPINTX, RXINI);
        
        uint8_t len = UPBCLX;
        uint8_t i, buf[8];
        for (i = 0; i < len; ++i)
        {
            buf[i] = UPDATX;
        }
        clear_bit(UPINTX, FIFOCON);
        
        switch (device_type)
        {
            case Dev_RumblePad2:
                update_rumblepad2(buf);
                break;
            
            case Dev_SpaceNav:
                update_spacenav(buf);
                break;
        }
        
        if (drive_x > 10)
        {
            set_bit(PORTD, GREEN1);
            clear_bit(PORTD, RED1);
        } else if (drive_x < -10)
        {
            set_bit(PORTD, RED1);
            clear_bit(PORTD, GREEN1);
        } else {
            clear_bit(PORTD, GREEN1);
            clear_bit(PORTD, RED1);
        }
        
        if (drive_spin > 10)
        {
            set_bit(PORTD, GREEN2);
            clear_bit(PORTD, RED2);
        } else if (drive_spin < -10)
        {
            set_bit(PORTD, RED2);
            clear_bit(PORTD, GREEN2);
        } else {
            clear_bit(PORTD, GREEN2);
            clear_bit(PORTD, RED2);
        }

        if (ser_tx_empty())
        {
#if 1
            printf("%02x:  ", len);
            for (i = 0; i < len; ++i)
            {
                printf_P(PSTR("%02x "), buf[i]);
            }
#endif
            printf_P(PSTR("  %4d %4d %4d"), drive_x, drive_y, drive_spin);
            printf_P(PSTR("\n"));
        }
    }
}

ISR(TIMER1_COMPA_vect)
{
    if (usb_state == USB_Disconnected)
    {
        PORTD ^= (1 << GREEN1) | (1 << GREEN2);
    } else if (usb_state == USB_Broken)
    {
        PORTD ^= (1 << RED1) | (1 << RED2);
    }
}

int main()
{
    // Disable the watchdog timer.
    // This must be done in case we are started from the bootloader,
    // which uses the WDT to reset.
    wdt_reset();
    clear_bit(MCUSR, WDRF);
    WDTCSR |= (1 << WDCE) | (1 << WDE);
    WDTCSR = 0;
    
    // Run at full clock speed
    CLKPR = 1 << CLKPCE;
    CLKPR = 0;
    
    // Set up I/O ports
    DDRD = 0xf0;
    PORTD = 1 << GREEN1;

    DDRE = 0x80;

    // Set up UART
    ser_init();
    
    // Start the 48MHz PLL
    PLLCSR = (3 << PLLP0) | (1 << PLLE);
    loop_until_bit_is_set(PLLCSR, PLOCK);
    
    // Reset the USB core in case the bootloader left it on.
    clear_bit(USBCON, USBE);
    set_bit(USBCON, USBE);
    
    // Set up USB
    clear_bit(UHWCON, UIMOD);
    set_bit(UHWCON, UVREGE);
    clear_bit(USBCON, FRZCLK);
    
    set_bit(OTGCON, VBUSHWC);
    set_bit(PORTE, 7);
    
    clear_bit(UDCON, DETACH);
    set_bit(USBCON, HOST);
    
    OTGIEN = (1 << SRPE);
    UHIEN = (1 << DCONNE) | (1 << DDISCE) | (1 << RSTE);
    
    TCCR1B = (1 << WGM12) | 3;
    OCR1A = 20833;
    set_bit(TIMSK1, OCIE1A);
    
    sei();
    sleep_enable();
    
    printf_P(PSTR("Initialized\n"));

    while (1)
    {
        sleep_cpu();
        
        if (usb_state == USB_Connected)
        {
            // Need to configure outside an interrupt because this can take a long time.
            if (configure_device())
            {
                printf_P(PSTR("  Configured\n"));
                PORTD = (1 << GREEN1) | (1 << GREEN2);
                usb_state = USB_Configured;
            } else {
                printf_P(PSTR("  Configuration failed\n"));
                PORTD = 0;
                usb_state = USB_Broken;
            }
        }
    }
}
