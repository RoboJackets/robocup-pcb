#include <avr/pgmspace.h>

#include "pins.h"
#include "radio.h"
#include "../common/cc1101.h"

uint8_t spi_write(uint8_t data)
{
    SPDR = data;
    loop_until_bit_is_set(SPSR, SPIF);
    return SPDR;
}

// Waits for the radio's status and version bytes to have expected values.
// This verifies that the radio crystal oscillator and SPI interface are working.
// Checking these two registers isn't strictly necessary but it reduces the chances
// of a false positive.
void radio_wait()
{
    uint8_t status, version;
    do
    {
        radio_select();
        status = spi_write(VERSION | CC_READ);
        version = spi_write(SNOP);
        radio_deselect();
    } while ((status & 0x80) || version != 0x04);
}

#if 0
void radio_init()
{
    uint8_t i;
    clear(PORTD, nCS);
    // The table is a just a list of bytes to send to the radio.
    // It is arranged as [address, data] tuples.  A single write requires that
    // the top two bits of the header byte be low, so the header byte is simply the address.
    for (i = 0; i < sizeof(cc1101_regs); ++i)
    {
        spi_write(pgm_read_byte(&cc1101_regs[i]));
    }
    set(PORTD, nCS);
}
#endif

uint8_t radio_command(uint8_t cmd)
{
    radio_select();
    uint8_t status = spi_write(cmd);
    radio_deselect();
    
    return status;
}

uint8_t radio_read(uint8_t addr)
{
    radio_select();
    spi_write(addr | CC_READ);
    uint8_t value = spi_write(SNOP);
    radio_deselect();
    
    return value;
}

uint8_t radio_write(uint8_t addr, uint8_t value)
{
    radio_select();
    uint8_t status = spi_write(addr);
    spi_write(value);
    radio_deselect();
    
    return status;
}
