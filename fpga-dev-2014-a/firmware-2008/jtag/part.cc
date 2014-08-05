#include "part.h"

using namespace JTAG;

Part_Info_List Part_Info::_part_info_list;

Part_Info::Part_Info()
{
    _part_info_list.push_back(this);
}

Part_Info::~Part_Info()
{
    _part_info_list.remove(this);
    
    // Delete instructions
    for (Opcode_Map::iterator i = opcodes.begin(); i != opcodes.end(); ++i)
    {
        delete (*i).second;
    }
}

Part_Info *Part_Info::find(uint32_t idcode)
{
    for (Part_Info_List::const_iterator i = _part_info_list.begin(); i != _part_info_list.end(); ++i)
    {
        Part_Info *part = *i;
        
        if (part->idcode == idcode)
            return part;
    }
    
    return 0;
}
