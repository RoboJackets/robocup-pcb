#ifndef _PINS_H_
#define _PINS_H_

#define set(var, bit)   {var |= 1 << (bit);}
#define clear(var, bit) {var &= ~(1 << (bit));}

// Port B
#define LED_RED         7
#define LED_GREEN       6
#define MISO            3
#define MOSI            2
#define SCK             1
#define nSS             0

// Port D
#define nCS             3

#endif // _PINS_H_
