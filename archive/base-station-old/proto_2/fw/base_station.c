#include <avr/io.h>
#include <avr/wdt.h>
#include <avr/interrupt.h>

#include "bits.h"
#include "device.h"
#include "host.h"
#include "radio.h"

uint8_t device_mode;

// Radio GDO0
ISR(INT1_vect)
{
    if (device_mode)
    {
        device_gdo0_vect();
    } else {
        host_gdo0_vect();
    }
}

// Radio GDO2
ISR(INT2_vect)
{
    if (device_mode)
    {
        device_gdo2_vect();
    } else {
        host_gdo2_vect();
    }
}

ISR(USB_GEN_vect)
{
    if (device_mode)
    {
        device_gen_vect();
    } else {
        host_gen_vect();
    }
}

ISR(USB_COM_vect)
{
    if (device_mode)
    {
        device_com_vect();
    } else {
        host_com_vect();
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
    
    // Setup I/O
    DDRB = 0xf7;        // LEDs and SPI outputs
    PORTB = 0x00;
    
    DDRD = 0x08;
    PORTD = 0x0e;
    
    DDRE = 0x80;        // UVCON output
    PORTE = 0x04;       // HWB button pullup
    
    // Start the 48MHz PLL
    PLLCSR = (3 << PLLP0) | (1 << PLLE);
    loop_until_bit_is_set(PLLCSR, PLOCK);
    
    // Set up USB:
    //
    // Enable USB core
    set_bit(USBCON, USBE);
    
    // Enable USB pad regulator
    set_bit(UHWCON, UVREGE);
    
    // Enable Vbus pad (required for Vbus detection)
    set_bit(USBCON, OTGPADE);
    
    // Enable USB clock
    clear_bit(USBCON, FRZCLK);
    
    // Set SPI mode 0 (clock idles low, data sampled on rising edge)
    SPCR = (1 << SPE) | (1 << MSTR) | (1 << SPR0);
    
    // Iniitialize radio
    radio_init();
    
    // Set up external interrupts
    EICRA = 0x30;               // Rising edge on INT2
    set_bit(EIFR, 2);           // Clear any stale interrupt
    set_bit(EIMSK, 2);          // Enable INT6
    
    sei();
    
    while (1)
    {
        // Host/device detection
        if (bit_is_set(USBSTA, VBUS))
        {
            // Vbus present: device
            device_mode = 1;
            device_main();
        } else {
            // Vbus not present: host
            device_mode = 0;
            host_main();
        }
    }
}
