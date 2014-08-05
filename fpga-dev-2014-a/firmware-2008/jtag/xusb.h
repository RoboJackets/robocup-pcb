#ifndef _XUSB_H_
#define _XUSB_H_

#include <usb.h>

#include "hw.h"

class XUSB: public JTAG::HW
{
public:
    XUSB();
    ~XUSB();
    
    void tms(bool state);
    void tck(bool state);
    void tdi(bool state);

    bool tdo();
    bool tms();
    bool tck();
    bool tdi();
    
    void shift_tms(uint8_t bits, uint8_t len);
    void shift_data(const uint8_t *in, uint8_t *out, unsigned int bits, bool exit);
    void tck_pulse(unsigned int n = 1);
    
protected:
    usb_dev_handle *handle;
    
    void enable();
    void disable();
};

#endif // _XUSB_H_
