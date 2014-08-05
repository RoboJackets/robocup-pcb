#include <stdio.h>
#include <string.h>
#include <stdexcept>
#include <fstream>
#include <antlr/ANTLRException.hpp>
#include <boost/format.hpp>

#include "dlc5.h"
#include "xusb.h"
#include "ft2232.h"
#include "part.h"
#include "bsdl.h"
#include "chain.h"
#include "xilinx_bitstream.h"
#include "xsvf_interpreter.h"
#include "part_cache.h"
#include "arm7tdmi.h"
#include "bit_rev.h"

using namespace boost;
using namespace std;

uint32_t reverse(uint32_t x)
{
    return (bit_rev[x & 0xff] << 24) |
           (bit_rev[(x >> 8) & 0xff] << 16) |
           (bit_rev[(x >> 16) & 0xff] << 8) |
           bit_rev[(x >> 24) & 0xff];
}

int main(int argc, char *argv[])
{
//    DLC5 hw("/dev/parport0");
//    XUSB hw;
    JTAG::FT2232 hw(0x0403, 0x6010);
    
#if 0
    hw.reset();
    hw.set_state(JTAG::Shift_DR);
    
    for (int i = 0; i < 4; i++)
    {
    uint8_t data[4];
    hw.shift_data(0, data, 32, false);
    
    // check 93 e0 e5 06
    // check 93 60 04 f5
    // check 93 60 04 f5
    // check 93 a0 c3 21
    printf("check %02x %02x %02x %02x\n", data[0], data[1], data[2], data[3]);
    }
    
    return 1;
#endif
    
#if 0
    uint8_t in[] = {0xc9, 0x45};
    uint8_t out[16] = {0, 0};
    hw.tms(false);
    hw.shift_data(in, out, 9, true);
    printf("got %02x %02x\n", out[0], out[1]);
    return 1;
#endif
    
    JTAG::Chain chain(hw);
    
    JTAG::init(chain);
    
#if 0
    // ARM test
    JTAG::ARM7TDMI arm(hw);
    
#if 0
    hw.srst(true);
    hw.srst(false);
#endif
    
    printf("pre status %08x control %08x\n", arm.rt_read(1), arm.rt_read(0));
    arm.rt_write(0, 0x20);
    arm.rt_write(9, 0xffffffff);
    arm.rt_write(11, 0xffffffff);
    arm.rt_write(13, 0xff);
    arm.rt_write(12, 0x100);
    arm.rt_write(0, 0);
    printf("post status %08x control %08x\n", arm.rt_read(1), arm.rt_read(0));
    // Leave the watchpoint on
    
    if (arm.rt_read(1) & 0x10)
    {
        // Go from Thumb to ARM mode
        arm.issue_instruction(0x47784778, false);   // BX r0; BX r0
        arm.issue_instruction(0x1c001c00, false);   // NOP; NOP
        arm.issue_instruction(0xe1a00000, false);   // NOP
        arm.issue_instruction(0xe1a00000, false);   // NOP
        printf("arm status %08x\n", arm.rt_read(1));
    }
    
#if 1
    arm.issue_instruction(0xe59f0038, false);   // 0    LDR r0, []
    arm.issue_instruction(0xe0401000, false);   // 1    SUB r0, r0, r0
    arm.issue_instruction(0xe3a01100, false);   // 2    MOV r1, #0x80000000
    arm.issue_instruction(0xe0028008, false);   //      data for 0
    arm.issue_instruction(0xe1a00000, false);   // 3    NOP
    arm.issue_instruction(0xe1a00000, false);   // 4    NOP
    
    arm.issue_instruction(0xe1a00000, true);    //      NOP, next instruction is at system speed
    arm.issue_instruction(0xe8800002, false);   //      STMIA r1, {r0}
    arm.restart();
    arm.issue_instruction(0xe1a00000, false);   // Why?
    printf("back status %08x\n", arm.rt_read(1));
#endif
    
#if 0
    status = arm.rt_read(1);
    if (status & 0x10)
    {
        // Go from Thumb to ARM mode
        arm.issue_instruction(0x47004700, false);   // BX PC; BX PC
        arm.issue_instruction(0x1c001c00, false);   // NOP; NOP
        arm.issue_instruction(0xe1a00000, false);   // NOP
        arm.issue_instruction(0xe1a00000, false);   // NOP
        printf("arm status %08x\n", arm.rt_read(1));
    }

    printf("status %08x\n", arm.rt_read(1));
#endif

#if 0
    printf("RT regs:\n");
    for (int i = 0; i < 32; ++i)
    {
        printf("%2d: %08x\n", i, arm.rt_read(i));
    }
    printf("\n");
#endif
    
#if 1
    // Read registers r0-r15
//    arm.issue_instruction(0xe3a00068, false);   // MOV r0, #0xa5
    arm.issue_instruction(0xe880ffff, false);   // STMIA r0, {r0-r15}
    arm.issue_instruction(0xe1a00000, false);   // NOP
    arm.issue_instruction(0xe1a00000, false);   // NOP
    
    printf("Core regs:\n");
    for (int r = 0; r < 16; ++r)
    {
        uint8_t out = 0;
        uint32_t value = 0;
        arm.select_chain(1);
        hw.set_state(JTAG::Shift_DR);
        hw.tdi(false);
        hw.shift_data(0, &out, 1, false);
        hw.shift_data(0, (uint8_t *)&value, 32, true);
        hw.set_state(JTAG::Run_Test_Idle);
        
        printf("%2d: %d %08x\n", r, out, reverse(value));
    }
    printf("\n");
#endif
    
    // Disable watchpoint 0
    arm.rt_write(12, 0);

#if 1
    arm.issue_instruction(0xe1a00000, false);
    arm.issue_instruction(0xe1a00000, true);
    arm.issue_instruction(0xe12fff11, false);
    arm.restart();
    printf("resume status %08x control %08x\n", arm.rt_read(1), arm.rt_read(0));
#endif
    
    return 0;
    
    // End ARM test
#endif

    if (argc != 2)
    {
        printf("Specify programming file on command line\n");
        return 1;
    }
    
    if (!strcmp(argv[1], "-u"))
    {
        uint8_t data[4] = {0,0,0,0};

        chain.single_instruction(0, "USERCODE");
        usleep(50);
        hw.set_state(JTAG::Shift_DR);
        hw.shift_data(0, data, 3, false);
        hw.shift_data(0, data, 32, true);
        printf("%02x %02x %02x %02x\n", data[3], data[2], data[1], data[0]);

        return 0;
    }

    //FIXME - getarg or whatever
    int n = 0;

    const char *dot = strrchr(argv[1], '.');
    if (!dot)
    {
        printf("Can't determine file type - it needs an extension\n");
        return 1;
    }
    
    if (!strcmp(dot, ".xsvf"))
    {    
        JTAG::XSVF_Interpreter xsvf(argv[1], hw);
    } else if (!strcmp(dot, ".bit"))
    {
        Xilinx_Bitstream bs(argv[1]);
        
        chain.single_instruction(n, "JPROGRAM");
        chain.single_instruction(n, "CFG_IN");
        hw.set_state(JTAG::Shift_DR);
        bool last = (n == 0);
        hw.shift_data(bs.data(), 0, bs.size() * 8, last);

        for (int i = n - 1; i >= 0; --i)
        {
            uint8_t zero = 0;
            hw.shift_data(&zero, 0, 1, (i == 0));
        }

        // Run the startup sequence.
        // NOTE - This is 12 clocks in Run-Test/Idle, not Shift-DR.
        hw.reset();
        chain.single_instruction(n, "JSTART");
        hw.set_state(JTAG::Run_Test_Idle);
        hw.tck_pulse(12);
        
        // The XC3SProg source says this is necessary to allow
        // reconfiguration from PROM.
        chain.single_instruction(n, "BYPASS");
    }

    return 0;
}
