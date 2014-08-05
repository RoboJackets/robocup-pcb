#ifndef _ARM7TDMI_H_
#define _ARM7TDMI_H_

#include <stdint.h>

namespace JTAG
{
    class HW;
    
    class ARM7TDMI
    {
    public:
        // Instructions (4 bits)
        enum
        {
            SCAN_N = 0x2,
            INTEST = 0xc,
            IDCODE = 0xe,
            BYPASS = 0xf,
            RESTART = 0x4
        };
        
        ARM7TDMI(HW &hw);
        
        void rt_write(int num, uint32_t value);
        uint32_t rt_read(int num);
        
        void restart();
    
        // Selects a scan chain (1 or 2).  Does nothing if the given chain is
        // already selected.
        void select_chain(int num);
        
        // flag is the last bit.  In normal mode, it sets DBGBREAK.
        // In debug mode (DBGACK=1), it selects the clock to use when executing the
        // instruction.
        void issue_instruction(uint32_t instr, bool flag);
        
    protected:
        HW &_hw;
        
        // The selected scan chain or -1 if unknown or none.
        int _selected_chain;
    };
};

#endif // _ARM7TDMI_H_
