#ifndef _CHAIN_H_
#define _CHAIN_H_

#include <vector>
#include <stdint.h>

namespace JTAG
{
    class Part_Info;
    class Instruction;
    class HW;
    class Chain;
    
    void init(JTAG::Chain &chain);
    
    class Chain_Part
    {
    public:
        Chain_Part()
        {
            part_info = 0;
            idcode = 0;
        }
        
        JTAG::Part_Info *part_info;
        
        // idcode as read from the device
        uint32_t idcode;
    };

    class Chain
    {
    public:
        Chain(HW &hw);
        
        HW &hw() const { return _hw; }
        
        // Populates the list of parts automatically
        void detect();

        void single_instruction(int pos, const char *name);
        
        unsigned int num_parts() const { return parts.size(); }

        // List of parts in the chain, starting with the one closest to TDI.
        std::vector<Chain_Part> parts;
    
    protected:
        HW &_hw;
        
        // This 32-bit buffer is used by detect() to avoid shifting single
        // bits through the interface.
        uint8_t buf[4];
        int buf_pos;
        
        // Returns the next bit from the 32-bit buffer, reading from the hardware
        // if no more data is available.
        bool shift_bit();
    };
};

#endif // _CHAIN_H_
