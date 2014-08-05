#include "states.h"

using namespace JTAG;

// Bits 7-4 are the next state when TMS=1.
// Bits 3-0 are the next state when TMS=0.
#define LINK(a, b)   (((a) << 4) | (b))
static uint8_t state_graph[16] =
{
    LINK(Test_Logic_Reset,  Run_Test_Idle), /* Test Logic Reset */
    LINK(Select_DR,         Run_Test_Idle), /* Run/Test Idle */
    LINK(Select_IR,         Capture_DR),    /* Select DR */
    LINK(Exit1_DR,          Shift_DR),      /* Capture DR */
    LINK(Exit1_DR,          Shift_DR),      /* Shift DR */
    LINK(Update_DR,         Pause_DR),      /* Exit 1 DR */
    LINK(Exit2_DR,          Pause_DR),      /* Pause DR */
    LINK(Update_DR,         Shift_DR),      /* Exit 2 DR */
    LINK(Select_DR,         Run_Test_Idle), /* Update DR */
    LINK(Test_Logic_Reset,  Capture_IR),    /* Select IR */
    LINK(Exit1_IR,          Shift_IR),      /* Capture IR */
    LINK(Exit1_IR,          Shift_IR),      /* Shift IR */
    LINK(Update_IR,         Pause_IR),      /* Exit 1 IR */
    LINK(Exit2_IR,          Pause_IR),      /* Pause IR */
    LINK(Update_IR,         Shift_IR),      /* Exit 2 IR */
    LINK(Select_DR,         Run_Test_Idle)  /* Update IR */
};

const char *JTAG::state_name[] =
{
    "Test_Logic_Reset",
    "Run_Test_Idle",
    "Select_DR",
    "Capture_DR",
    "Shift_DR",
    "Exit1_DR",
    "Pause_DR",
    "Exit2_DR",
    "Update_DR",
    "Select_IR",
    "Capture_IR",
    "Shift_IR",
    "Exit1_IR",
    "Pause_IR",
    "Exit2_IR",
    "Update_IR"
};

JTAG::State JTAG::next_state(JTAG::State current, bool tms)
{
    if (tms)
    {
        return (JTAG::State)(state_graph[current] >> 4);
    } else {
        return (JTAG::State)(state_graph[current] & 15);
    }
}
