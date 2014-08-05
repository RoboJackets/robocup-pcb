#ifndef _DLC5_H_
#define _DLC5_H_

#include "hw.h"

class DLC5: public JTAG::HW
{
public:
    // Initializes using ppdev
    DLC5(const char *device);
    ~DLC5();

    virtual void tms(bool state);
    virtual void tck(bool state);
    virtual void tdi(bool state);
    virtual bool tms();
    virtual bool tck();
    virtual bool tdi();
    virtual bool tdo();

protected:
    // Sets/clears the output bits given in <bit> according to <state>.
    void set_bit(uint8_t bit, bool state);

    int handle;
    uint8_t bit_tms, bit_tck, bit_tdi, bit_tdo;
    bool cur_tms, cur_tck, cur_tdi;
};

#endif // _DLC5_H_
