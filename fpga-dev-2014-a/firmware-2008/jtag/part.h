//FIXME - How to detect duplicate Part_Info's?

#ifndef _PART_H_
#define _PART_H_

#include <map>
#include <list>
#include <string>

#include "bit_string.h"

class Masked_Value
{
public:
    Masked_Value() { value = 0; mask = 0; }
    
    bool operator==(uint32_t other) const
    {
        return (other & mask) == (value & mask);
    }
    
    uint32_t value;
    uint32_t mask;
};

namespace JTAG
{
    // Information about an instruction for a part
    class Instruction
    {
    public:
        Instruction()
        {
            dr_length = 0;
        }
        
        int dr_length;
        bit_string instr;
        std::string name;
    };
    
    class Part_Info;
    typedef std::list<Part_Info *> Part_Info_List;
    
    // Information about a type of part (typically from a BSDL file)
    class Part_Info
    {
    public:
        typedef std::map<std::string, Instruction *> Opcode_Map;
        
        Part_Info();
        ~Part_Info();
        
        std::string name;
        Masked_Value idcode;
        int ir_length;
        Opcode_Map opcodes;
        
        // Returns the instruction with the given name, or 0 if none exists.
        const Instruction *find_instr(std::string name) const
        {
            Opcode_Map::const_iterator i = opcodes.find(name);
            if (i == opcodes.end())
                return 0;
            return (*i).second;
        }
        
        // Operations on the list of parts
        static Part_Info *find(uint32_t idcode);
        static const Part_Info_List &part_info_list() { return _part_info_list; }
        
    private:
        // List of all Part_Info's.
        // This is maintained by the constructor and destructor.
        static Part_Info_List _part_info_list;
    };
};

#endif // _PART_H_
