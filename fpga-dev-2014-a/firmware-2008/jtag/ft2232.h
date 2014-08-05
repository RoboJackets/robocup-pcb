#ifndef _FT2232_H_
#define _FT2232_H_

#include "hw.h"

#include <ftdi.h>

namespace JTAG
{
    class FT2232: public JTAG::HW
    {
    public:
        FT2232(uint16_t product, uint16_t vendor);
        ~FT2232();
    
        virtual void tms(bool state);
        virtual void tck(bool state);
        virtual void tdi(bool state);
        virtual bool tms();
        virtual bool tck();
        virtual bool tdi();
        virtual bool tdo();
        virtual void trst(bool state);
        virtual void srst(bool state);
        virtual bool have_trst();
        virtual bool have_srst();
        virtual void shift_tms(uint8_t bits, uint8_t len);
        virtual void shift_data(const uint8_t *in, uint8_t *out, unsigned int bits, bool exit);
        
    protected:
        struct ftdi_context ctx;
        uint16_t data_out;
        
        bool _debug;
        
        // Reads len bytes and stores them in data.
        // Polls the FT2232 for data and throws an exception on error or timeout.
        void read(uint8_t *data, unsigned int len);
        
        void set_bit(int n, bool state);
    };
}

#endif // _FT2232_H_
