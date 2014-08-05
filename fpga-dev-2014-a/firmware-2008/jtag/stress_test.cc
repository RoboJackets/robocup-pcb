#include <stdio.h>
#include <string.h>

#include "dlc5.h"
#include "xusb.h"
#include "ft2232.h"
#include "part.h"
#include "bsdl.h"
#include "chain.h"
#include "xilinx_bitstream.h"
#include "xsvf_interpreter.h"
#include "part_cache.h"

using namespace std;

int main(int argc, char *argv[])
{
//    DLC5 hw("/dev/parport0");
//    XUSB hw;
    JTAG::FT2232 hw(0x0403, 0x6010);

    JTAG::Chain chain(hw);
    JTAG::init(chain);
    
    if (argc != 2)
    {
        printf("Specify programming file on command line\n");
        return 1;
    }
    
    const char *dot = strrchr(argv[1], '.');
    if (!dot)
    {
        printf("Can't determine file type - it needs an extension\n");
        return 1;
    }
    
    for (int i = 0; i < 100; ++i)
    {
        if (!strcmp(dot, ".xsvf"))
        {    
            JTAG::XSVF_Interpreter xsvf(argv[1], hw);
        } else if (!strcmp(dot, ".bit"))
        {
            Xilinx_Bitstream bs(argv[1]);
            
            chain.single_instruction(0, "JPROGRAM");
            chain.single_instruction(0, "CFG_IN");
            hw.set_state(JTAG::Shift_DR);
            hw.shift_data(bs.data(), 0, bs.size() * 8, true);
    
            // Run the startup sequence.
            // NOTE - This is 12 clocks in Run-Test/Idle, not Shift-DR.
            hw.reset();
            chain.single_instruction(0, "JSTART");
            hw.set_state(JTAG::Run_Test_Idle);
            hw.tck_pulse(12);
            
            // The XC3SProg source says this is necessary to allow
            // reconfiguration from PROM.
            chain.single_instruction(0, "BYPASS");

            const uint8_t in[] = {0xff, 0xff};
            uint8_t out[2] = {0, 0};
            hw.set_state(JTAG::Shift_IR);
            hw.shift_data(in, out, 10, true);

            printf("\rTest %d: ", i);

            bool success = (out[0] == 0x51 && out[1] == 0x03);
            //bool success = (out[0] == 0x35);
            if (!success)
            {
                printf("Fail: IR capture %02x %02x\n", out[0], out[1]);
                return 1;
            }

            printf("pass");
            fflush(stdout);
        }
    }
    printf("\n");

    return 0;
}
