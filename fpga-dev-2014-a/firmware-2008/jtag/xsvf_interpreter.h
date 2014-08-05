#ifndef _XSVF_INTERPRETER_H_
#define _XSVF_INTERPRETER_H_

#include <string>
#include <fstream>

#include "states.h"
#include "bit_string.h"

namespace JTAG
{
    class HW;
    
    class XSVF_Interpreter
    {
    public:
        // Commands
        enum
        {
            XCOMPLETE       = 0x00,
            XTDOMASK        = 0x01,
            XSIR            = 0x02,
            XSDR            = 0x03,
            XRUNTEST        = 0x04,
            XREPEAT         = 0x07,
            XSDRSIZE        = 0x08,
            XSDRTDO         = 0x09,
            XSETSDRMASKS    = 0x0a,
            XSDRINC         = 0x0b,
            XSDRB           = 0x0c,
            XSDRC           = 0x0d,
            XSDRE           = 0x0e,
            XSDRTDOB        = 0x0f,
            XSDRTDOC        = 0x10,
            XSDRTDOE        = 0x11,
            XSTATE          = 0x12,
            XENDIR          = 0x13,
            XENDDR          = 0x14,
            XSIR2           = 0x15,
            XCOMMENT        = 0x16,
            XWAIT           = 0x17
        };
    
        XSVF_Interpreter(const std::string &filename, HW &hw);
    
    protected:
        std::ifstream file;
        HW &hw;
        uint32_t runtest_time;
        uint32_t sdr_size;
        int repeat;
        State end_ir_state;
        State end_dr_state;
        bit_string tdo_mask;
        bit_string tdo_expected;
        
        // If true, runtest_delay() sends TCKs instead of sleeping for xruntest microseconds.
        bool runtest_tck;
        
        // Goes to Run-Test/Idle and waits for the required number of microseconds or TCKs
        void runtest_delay();
        
        // Reads a reversed bit string from the file
        void read_bits(bit_string &bits);
        
        // Checks the given input data against the expected TDO data and mask.
        bool tdo_compare(const bit_string &in);
        
        // Command handlers
        void xcomplete();
        void xtdomask();
        void xsir();
        void xsdr();
        void xruntest();
        void xrepeat();
        void xsdrsize();
        void xsdrtdo();
        void xsetsdkmasks();
        void xsdrinc();
        void xsdrb();
        void xsdrc();
        void xsdre();
        void xsdrtdob();
        void xsdrtdoc();
        void xsdrtdoe();
        void xstate();
        void xendir();
        void xenddr();
        void xsir2();
        void xcomment();
        void xwait();
    };
};

#endif //_XSVF_INTERPRETER_H_
