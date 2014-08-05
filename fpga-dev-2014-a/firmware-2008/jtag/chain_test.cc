#include <stdio.h>

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

#define NUM 131072
uint8_t in[NUM], out[NUM];

int main(int argc, char *argv[])
{
//    DLC5 hw("/dev/parport0");
//    XUSB hw;
    JTAG::FT2232 hw(0x0403, 0x6010);

    JTAG::Chain chain(hw);
    JTAG::init(chain);
    
    //for (int i = 0; i < 10; ++i)
    {
        chain.single_instruction(0, "BYPASS");

#if 1
        for (unsigned int j = 0; j < sizeof(in); ++j)
        {
            in[j] = rand() & 255;
        }
        in[sizeof(in) - 1] &= 0x7f;
#else
        memset(in, 0, sizeof(in));
        in[0] = 0xff;
        in[1] = 0x34;
        in[2] = 0x56;
        in[3] = 0x48;
#endif

        hw.set_state(JTAG::Shift_DR);
        hw.shift_data(in, out, 8 * sizeof(in), true);
        
        for (unsigned int j = 0; j < (sizeof(in) - 1); ++j)
        {
            out[j] = (out[j] >> 2) | ((out[j + 1] & 3) << 6);
            
            if (out[j] != in[j])
            {
                printf("err %4d: in %02x out %02x\n", j, in[j], out[j]);
            }
        }
        printf("pass\n");
    }

    return 0;
}
