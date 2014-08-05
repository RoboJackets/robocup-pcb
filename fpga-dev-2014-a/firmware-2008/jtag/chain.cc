#include <stdexcept>
#include <stdio.h>
#include <boost/format.hpp>

#include "chain.h"
#include "hw.h"
#include "part.h"
#include "part_cache.h"

using namespace std;
using namespace boost;
using namespace JTAG;

void JTAG::init(Chain &chain)
{
    try
    {
        Part_Cache::read("part_cache");
    } catch (std::exception &e)
    {
        printf("Can't read part cache\n");
    }
    if (Part_Cache::update("part_cache", "bsdl"))
        Part_Cache::write("part_cache");

    chain.detect();
    
    for (unsigned int i = 0; i < chain.parts.size(); i++)
    {
        JTAG::Part_Info *part_info = chain.parts[i].part_info;
        
        printf("%d: %08x ", i, chain.parts[i].idcode);
        
        if (part_info)
        {
            printf("%s stepping %d IR %d\n", part_info->name.c_str(), chain.parts[i].idcode >> 28, part_info->ir_length);
        } else {
            printf("(unknown)\n");
        }
    }
    
    printf("\n");
}

////////

Chain::Chain(HW &hw): _hw(hw)
{
}

void Chain::detect()
{
    // Force the next call to shift_bit() to actually shift data
    buf_pos = 32;
    
    parts.clear();

    // After reset, all parts will have IDCODE or BYPASS as the current instruction.
    // Presumably any part in BYPASS does not support IDCODE.
    _hw.reset();
    
    _hw.set_state(Shift_DR);
    
    // Parts are detected in reverse order, so we will add to this list and
    // convert to a vector afterwards.
    list<Chain_Part> part_list;
    
    // Each part in BYPASS will produce a single 0.
    // Each part in IDCODE will produce a 32-bit value beginning with 1.
    //
    //FIXME - Use the forbidden ID code in the standard instead of all 1's.
    // We shift in 1's so that when all data has gone through, we will see
    // an IDCODE of all 1's, indicating the end of the chain.
    _hw.tdi(true);
    bool bit = shift_bit();
    int num_parts = 0;
    while (true)
    {
        // Get past parts with no IDCODE
        while (bit == false)
        {
            part_list.push_front(Chain_Part());
            bit = shift_bit();
        }
        
        uint32_t id = 0;
        for (int i = 0; i < 32; i++)
        {
            id >>= 1;
            if (bit)
            {
                id |= 1 << 31;
            }
            bit = shift_bit();
        }
        
        if (id == 0xffffffff)
        {
            // Our end-of-chain marker has come out.
            break;
        }

        Chain_Part part;
        part.idcode = id;
        part.part_info = Part_Info::find(id);
        part_list.push_front(part);
        
        num_parts++;
    }
    
    // Copy from the list to the vector
    parts.reserve(num_parts);
    for (list<Chain_Part>::const_iterator i = part_list.begin(); i != part_list.end(); ++i)
    {
        parts.push_back(*i);
    }
    
    // Is there any point in trying to IDCODE parts that were in BYPASS?
    // Detect IR length of unknown parts?
}

void Chain::single_instruction(int pos, const char *name)
{
    _hw.set_state(Shift_IR);
    
    for (int i = parts.size() - 1; i >= 0; i--)
    {
        Part_Info *info = parts[i].part_info;
        if (!info)
        {
            throw runtime_error(str(format("single_instruction: No Part_Info for device %1%") % i));
        }
        
        // Use the BYPASS instruction for all devices except the selected one
        const char *n;
        if (pos == i)
        {
            n = name;
        } else {
            n = "BYPASS";
        }
        const Instruction *instr = info->find_instr(n);
        
        if (!instr)
        {
            throw runtime_error(str(format("Can't find instruction %1% for device %2%") % n % i));
        }
        
        uint8_t cap[4] = {0,0,0,0};
        _hw.shift_data(instr->instr.data(), cap, info->ir_length, i == 0);
        //printf("Capture-IR %02x %02x %02x %02x\n", cap[3], cap[2], cap[1], cap[0]);
    }
    
    _hw.set_state(JTAG::Update_IR);
}

bool Chain::shift_bit()
{
    if (buf_pos == 32)
    {
        _hw.shift_data(0, buf, 32, false);
        buf_pos = 0;
    }
    
    bool bit = buf[buf_pos / 8] & (1 << (buf_pos & 7));
    buf_pos++;
    
    return bit;
}
