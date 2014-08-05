#include <stdio.h>
#include <stdexcept>

#include "hw.h"

using namespace std;

JTAG::HW::HW()
{
    cur_state = Run_Test_Idle;
}

JTAG::HW::~HW()
{
}

void JTAG::HW::trst(bool state)
{
}

void JTAG::HW::srst(bool state)
{
}

bool JTAG::HW::have_trst()
{
    return false;
}

bool JTAG::HW::have_srst()
{
    return false;
}

void JTAG::HW::reset()
{
#if 0
    // Go to Test Logic Reset
    tms(true);
    tck_pulse(5);
    
    // Go to Run/Test Idle
    tms(false);
    tck_pulse();
#else
    shift_tms(0x1f, 6);
#endif
    
    cur_state = Run_Test_Idle;
}

void JTAG::HW::tck_pulse(unsigned int n)
{
    for (unsigned int i = 0; i < n; i++)
    {
        tck(true);
        tck(false);
    }
}

void JTAG::HW::shift_tms(uint8_t bits, uint8_t len)
{
    for (int i = 0; i < len; i++)
    {
        tms(bits & 1);
        tck_pulse();
        
        bits >>= 1;
    }
}

void JTAG::HW::shift_data(const uint8_t *in, uint8_t *out, unsigned int bits, bool exit)
{
//    printf("shift data in %s\n", state_name[cur_state]);
    
    unsigned int byte = 0;
    uint8_t bit = 1;
    
    tms(false);
    
    for (unsigned int i = 0; i < bits; i++)
    {
        if (exit && i == (bits - 1))
        {
            tms(true);
        }
        
        if (in)
        {
            tdi(in[byte] & bit);
        }
        
//        printf("%d: read %d\n", i, tdo());
        if (out)
        {
            if (bit == 1)
            {
                out[byte] = 0;
            }
            
            if (tdo())
            {
                out[byte] |= bit;
            }
        }
        
        tck_pulse();
            
        bit <<= 1;
        if (!bit)
        {
            bit = 1;
            byte++;
        }
    }
}

void JTAG::HW::set_state(State new_state)
{
//    printf("state %s to %s\n", state_name[cur_state], state_name[new_state]);
    State_Path path = state_path[cur_state][new_state];
    shift_tms(path.tms, path.len);
    
#if 0
    /* Sanity check */
    if (state() != new_state)
    {
        throw runtime_error("set_state: Ended up in the wrong state");
    }
#else
    cur_state = new_state;
#endif
}

void JTAG::HW::update_state()
{
    cur_state = next_state(cur_state, tms());
}
