#ifndef _HW_H_
#define _HW_H_

#include <stdint.h>

#include "states.h"

namespace JTAG
{
    class HW
    {
    public:
        HW();
        virtual ~HW();
        
        // Set the state of each output.
        // You should use the higher level functions below where possible,
        // as these may be slow.
        virtual void tms(bool state) = 0;
        virtual void tck(bool state) = 0;
        virtual void tdi(bool state) = 0;
        
        // Accessors for current outputs
        virtual bool tms() = 0;
        virtual bool tck() = 0;
        virtual bool tdi() = 0;
        
        // Read TDO
        virtual bool tdo() = 0;
        
        // Sets the state of TRST.  true means active (low), false means inactive (high).
        // If TRST is not present, this does nothing.
        virtual void trst(bool state);
        
        // Sets the state of SRST.  true means active (low), false means inactive (high).
        // If TRST is not present, this does nothing.
        virtual void srst(bool state);
        
        // Returns true if the interface provides the TRST signal
        virtual bool have_trst();
        
        // Returns true if the interface provides the SRST signal
        virtual bool have_srst();
        
        // These higher-level functions may be overridden by subclasses
        // to increase speed.
        
        // Synchronous reset.
        // Goes to Test-Logic-Reset, then to Run-Test/Idle.
        virtual void reset();
        
        // Issues some number of pulses on TCK.
        // Assumes that TCK is low when called.  Returns with TCK low.
        virtual void tck_pulse(unsigned int n = 1);
        
        // Shifts <len> LSBs of <bits> on TMS.  TDI is unchanged.
        virtual void shift_tms(uint8_t bits, uint8_t len);
        
        // Shifts data into TDI and out of TDO.
        // <in> and <out> must either be 0 or point to <bits> bits of data.
        // If <in> is 0, TDI is not changed.
        // If <exit> is true, TMS is high on the last bit.
        // TMS is always false for bits other than the last.
        //
        // Bytes are shifted LSB first.  Unused bits are ignored.
        virtual void shift_data(const uint8_t *in, uint8_t *out, unsigned int bits, bool exit);
    
        // Moves to the given state.
        //
        // If you want to go to TEST_LOGIC_RESET, use the reset() function as it
        // does not depend on the current state being correct.
        virtual void set_state(State new_state);
        
        // Returns the current state.
        //
        // WARNING: This may not be correct before the first time reset() is called.
        State state() const { return cur_state; }
    
    protected:
        // Subclasses should call this when TCK goes high so that cur_state will be updated.
        void update_state();
        
        State cur_state;
    };
};

#endif // _HW_H_
