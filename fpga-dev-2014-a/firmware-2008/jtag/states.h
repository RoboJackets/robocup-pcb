#ifndef _JTAG_STATES_H_
#define _JTAG_STATES_H_

#include <stdint.h>

namespace JTAG
{
    typedef enum
    {
        Test_Logic_Reset = 0,
        Run_Test_Idle,
        Select_DR,
        Capture_DR,
        Shift_DR,
        Exit1_DR,
        Pause_DR,
        Exit2_DR,
        Update_DR,
        Select_IR,
        Capture_IR,
        Shift_IR,
        Exit1_IR,
        Pause_IR,
        Exit2_IR,
        Update_IR
    } State;
    
    typedef struct
    {
        /* The longest shortest path between any two states is, conveniently, 8 steps. */
    
        /* Number of bits to use */
        uint8_t len;
        
        /* Bits to be shifted out on TMS, LSB first */
        uint8_t tms;
    } State_Path;
    
    extern const char *state_name[16];
    
    // First index is starting state.
    // Second index is ending state.
    extern State_Path state_path[16][16];

    // Returns the state that will be reached after the next clock pulse with the given value of TMS
    State next_state(State current, bool tms);
};

#endif /* _JTAG_STATES_H_ */
