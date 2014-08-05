#include <stdio.h>
#include <assert.h>

#include "arm7tdmi.h"
#include "hw.h"
#include "bit_rev.h"
        
JTAG::ARM7TDMI::ARM7TDMI(HW &hw): _hw(hw)
{
    _selected_chain = -1;
}

void JTAG::ARM7TDMI::rt_write(int num, uint32_t value)
{
    assert(num >= 0 && num <= 31);
    
    select_chain(2);
    
    _hw.set_state(JTAG::Shift_DR);
    // Top byte: xxWA AAAA
    uint8_t in[5] = {value, value >> 8, value >> 16, value >> 24, num | 0x20};
    _hw.shift_data(in, 0, 38, true);
    
    // Explicitly go through Update_DR, because the shortest path back to Shift_DR is through Exit2_DR.
    // This is needed for consecutive RT reads/writes.
    _hw.set_state(JTAG::Update_DR);
}

uint32_t JTAG::ARM7TDMI::rt_read(int num)
{
    assert(num >= 0 && num <= 31);
    
    select_chain(2);
    
    // Load the read command
    _hw.set_state(JTAG::Shift_DR);
    // Top byte: xxWA AAAA
    uint8_t in[5] = {0, 0, 0, 0, num};
    uint8_t out[5] = {0, 0, 0, 0, 0};
    _hw.shift_data(in, out, 38, true);
    
    // Explicitly go through Update_DR, because the shortest path is through Exit2_DR.
    _hw.set_state(JTAG::Update_DR);
    
    // Read the data.  The read command will be given again.
    _hw.set_state(JTAG::Shift_DR);
    _hw.shift_data(in, out, 38, true);
    
    // Sanity check
    if (out[4] != in[4])
        printf("Sanity: in %02x out %02x\n", in[4], out[4]);
    //FIXME - 05 to 04 is actually the DCC status W bit.
//    assert(out[4] == in[4]);
    
    return out[0] | (out[1] << 8) | (out[2] << 16) | (out[3] << 24);
}

void JTAG::ARM7TDMI::restart()
{
    _selected_chain = -1;

    _hw.set_state(JTAG::Shift_IR);
    uint8_t in = RESTART, out = 0;
    _hw.shift_data(&in, &out, 4, true);
    printf("restart out %02x\n", out);
    _hw.set_state(JTAG::Run_Test_Idle);
}

void JTAG::ARM7TDMI::select_chain(int num)
{
    if (_selected_chain != num)
    {
        uint8_t in;
        
        // Shift instruction SCAN_N
        _hw.set_state(JTAG::Shift_IR);
        in = SCAN_N;
        _hw.shift_data(&in, 0, 4, true);
        
        // Shift chain number
        _hw.set_state(JTAG::Shift_DR);
        in = num;
        _hw.shift_data(&in, 0, 4, true);
        
        // Shift instruction INTEST
        _hw.set_state(JTAG::Shift_IR);
        in = INTEST;
        _hw.shift_data(&in, 0, 4, true);
        
        _hw.set_state(JTAG::Update_IR);
        
        _selected_chain = num;
    }
}

void JTAG::ARM7TDMI::issue_instruction(uint32_t instr, bool flag)
{
    select_chain(1);
    
    _hw.set_state(JTAG::Shift_DR);
    _hw.shift_data((uint8_t *)&flag, 0, 1, false);
    
    uint8_t in[4] = {
        bit_rev[(instr >> 24) & 0xff],
        bit_rev[(instr >> 16) & 0xff],
        bit_rev[(instr >> 8) & 0xff],
        bit_rev[instr & 0xff]
    };
    
    _hw.shift_data(in, 0, 32, true);
    _hw.set_state(JTAG::Run_Test_Idle);
}
