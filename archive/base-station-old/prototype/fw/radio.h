#ifndef _RADIO_H_
#define _RADIO_H_

#include <stdint.h>

#include "pins.h"

static inline void radio_select()
{
    clear(PORTD, nCS);
}

static inline void radio_deselect()
{
    set(PORTD, nCS);
}

uint8_t spi_write(uint8_t data);

void radio_wait();
//void radio_init();
uint8_t radio_command(uint8_t cmd);
uint8_t radio_read(uint8_t addr);
uint8_t radio_write(uint8_t addr, uint8_t value);

#endif // _RADIO_H_
