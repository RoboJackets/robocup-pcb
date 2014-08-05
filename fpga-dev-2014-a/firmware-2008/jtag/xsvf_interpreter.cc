#include <boost/format.hpp>

#include "xsvf_interpreter.h"
#include "hw.h"
#include "bit_string.h"

using namespace std;
using namespace boost;
using namespace JTAG;

XSVF_Interpreter::XSVF_Interpreter(const string &filename, HW &hw): hw(hw)
{
    repeat = 32;
    end_ir_state = Run_Test_Idle;
    end_dr_state = Run_Test_Idle;
    runtest_time = 0;
    runtest_tck = true;
    
    file.exceptions(ofstream::badbit | ofstream::eofbit | ofstream::failbit);
    
    try
    {
        file.open(filename.c_str());
    } catch (std::exception &e)
    {
        throw runtime_error(string("xsvf: Can't open ") + filename);
    }
    
    bool done = false;
    while (!done)
    {
        uint8_t cmd;
        try
        {
            cmd = file.get();
        } catch (std::exception &e)
        {
            if (file.eof())
                break;
            else throw e;
        }
        
        switch (cmd)
        {
            case XCOMPLETE:
                done = true;
                break;
            case XTDOMASK:
                xtdomask();
                break;
            case XSIR:
                xsir();
                break;
//            case XSDR:
            case XRUNTEST:
                xruntest();
                break;
            case XREPEAT:
                xrepeat();
                break;
            case XSDRSIZE:
                xsdrsize();
                break;
            case XSDRTDO:
                xsdrtdo();
                break;
//            case XSETSDRMASKS:
//            case XSDRINC:
#if 0
            case XSDRB:
                break;
            case XSDRC:
                break;
            case XSDRE:
                break;
            case XSDRTDOB:
                break;
            case XSDRTDOC:
                break;
            case XSDRTDOE:
                break;
#endif
            case XSTATE:
                xstate();
                break;
            case XENDIR:
                xendir();
                break;
            case XENDDR:
                xenddr();
                break;
            case XSIR2:
                xsir2();
                break;
            case XCOMMENT:
                xcomment();
                break;
            case XWAIT:
                xwait();
                break;
            default:
                throw out_of_range(str(format("xsvf: Unsupported command 0x%1$02x at offset 0x%2$lx") % (int)cmd % file.tellg()));
        }
    }
}

void XSVF_Interpreter::runtest_delay()
{
    if (runtest_tck)
    {
        hw.tck_pulse(runtest_time);
    } else {
        usleep(runtest_time);
    }
}

void XSVF_Interpreter::read_bits(bit_string &bits)
{
    uint8_t *data = bits.data();
    unsigned int num_bytes = bits.num_bytes();
    for (unsigned int i = 0; i < num_bytes; i++)
    {
        data[num_bytes - i - 1] = file.get();
    }
}

bool XSVF_Interpreter::tdo_compare(const bit_string &in)
{
    uint8_t *in_data = in.data();
    uint8_t *expected = tdo_expected.data();
    uint8_t *mask = tdo_mask.data();
    for (unsigned int i = 0; i < in.num_bytes(); i++)
    {
        if ((in_data[i] & mask[i]) != (expected[i] & mask[i]))
            return false;
    }
    
    return true;
}

////////

void XSVF_Interpreter::xcomplete()
{
}

void XSVF_Interpreter::xtdomask()
{
    read_bits(tdo_mask);
}

void XSVF_Interpreter::xsir()
{
    int length = file.get();
    bit_string bits(length);
    file.read((char *)bits.data(), bits.num_bytes());
    
    hw.set_state(Shift_IR);
    hw.shift_data(bits.data(), 0, bits.size(), true);
    
    // XRUNTEST delay
    if (runtest_time)
    {
        runtest_delay();
    } else {
        hw.set_state(end_ir_state);
    }
}

void XSVF_Interpreter::xsdr()
{
}

void XSVF_Interpreter::xruntest()
{
    runtest_time = file.get() << 24;
    runtest_time |= file.get() << 16;
    runtest_time |= file.get() << 8;
    runtest_time |= file.get();
}

void XSVF_Interpreter::xrepeat()
{
    repeat = file.get();
}

void XSVF_Interpreter::xsdrsize()
{
    sdr_size = file.get() << 24;
    sdr_size |= file.get() << 16;
    sdr_size |= file.get() << 8;
    sdr_size |= file.get();
    
    tdo_mask = bit_string(sdr_size);
    tdo_expected = bit_string(sdr_size);
}

void XSVF_Interpreter::xsdrtdo()
{
    bit_string data_in(sdr_size);
    bit_string data_out(sdr_size);
    
    read_bits(data_in);
    read_bits(tdo_expected);
    
    hw.set_state(Shift_DR);
    hw.shift_data(data_in.data(), data_out.data(), sdr_size, true);
    
    if (!tdo_compare(data_out))
    {
        throw runtime_error("TDO compare failed");
    }
    
    // XRUNTEST delay
    if (runtest_time)
    {
        runtest_delay();
    } else {
        hw.set_state(end_dr_state);
    }
}

void XSVF_Interpreter::xsetsdkmasks()
{
}

void XSVF_Interpreter::xsdrinc()
{
}

void XSVF_Interpreter::xsdrb()
{
}

void XSVF_Interpreter::xsdrc()
{
}

void XSVF_Interpreter::xsdre()
{
}

void XSVF_Interpreter::xsdrtdob()
{
}

void XSVF_Interpreter::xsdrtdoc()
{
}

void XSVF_Interpreter::xsdrtdoe()
{
}

void XSVF_Interpreter::xstate()
{
    int state = file.get();

    if (state == 0)
    {
        hw.reset();
    } else if (state <= 15)
    {
        hw.set_state((State)state);
    } else {
        throw out_of_range(str(format("xsvf: XSTATE with bad state %d") % state));
    }
}

void XSVF_Interpreter::xendir()
{
    int state = file.get();
    switch (state)
    {
        case 0:
            end_ir_state = Run_Test_Idle;
            break;
        case 1:
            end_ir_state = Pause_IR;
            break;
        default:
            throw out_of_range(str(format("xsvf: XENDIR with bad state %d") % state));
    }
}

void XSVF_Interpreter::xenddr()
{
    int state = file.get();
    switch (state)
    {
        case 0:
            end_dr_state = Run_Test_Idle;
            break;
        case 1:
            end_dr_state = Pause_DR;
            break;
        default:
            throw out_of_range(str(format("xsvf: XENDDR with bad state %d") % state));
    }
}

void XSVF_Interpreter::xsir2()
{
    int length = file.get() << 8;
    length |= file.get();
    
    bit_string bits(length);
    file.read((char *)bits.data(), bits.num_bytes());
    
    hw.set_state(Shift_IR);
    hw.shift_data(bits.data(), 0, bits.size(), true);
    
    // XRUNTEST delay
    if (runtest_time)
    {
        runtest_delay();
    } else {
        hw.set_state(end_ir_state);
    }
}

void XSVF_Interpreter::xcomment()
{
    while (file.get())
        ;
}

void XSVF_Interpreter::xwait()
{
    int wait_state = file.get();
    int end_state = file.get();
    uint32_t wait_time = file.get() << 24;
    wait_time |= file.get() << 16;
    wait_time |= file.get() << 8;
    wait_time |= file.get();
    
    if (wait_state > 15)
        throw out_of_range(str(format("xsvf: XWAIT: invalid wait_state %1$d at 0x%lx") % wait_state % file.tellg()));
    
    if (end_state > 15)
        throw out_of_range(str(format("xsvf: XWAIT: invalid end_state %1$d at 0x%lx") % wait_state % file.tellg()));

    hw.set_state((State)wait_state);
    usleep(wait_time);
    hw.set_state((State)end_state);
}
