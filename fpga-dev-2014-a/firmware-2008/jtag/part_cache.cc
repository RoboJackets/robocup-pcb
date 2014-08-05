#include <fstream>
#include <stdexcept>
#include <boost/filesystem/operations.hpp>

#include "part_cache.h"
#include "bsdl.h"
#include "part.h"

using namespace std;
using namespace boost;
using namespace JTAG;

// This is a multi-byte integer to prevent moving cache files between
// endiannesses, to allow the read/write code to be simpler.
#define PART_CACHE_SIGNATURE    0x61e57800

bool JTAG::Part_Cache::update(const char *cache, const char *path)
{
    bool changed = false;
    
    filesystem::path cache_filename(cache);
    time_t cache_time;
    if (exists(cache_filename))
    {
        cache_time = last_write_time(cache_filename);
    } else {
        cache_time = -1;
    }
    
    //FIXME - Store filename, time, and size in cache
    
    for (filesystem::directory_iterator di(path); di != filesystem::directory_iterator(); ++di)
    {
        if (is_directory(*di))
        {
            continue;
        }

        time_t file_time = last_write_time(*di);
        if (file_time < cache_time)
        {
            continue;
        }

        const char *filename = (*di).string().c_str();
        printf("Updating cache of %s\n", filename);
        
        try
        {
            bsdl_load(filename, new JTAG::Part_Info());
            changed = true;
        } catch (antlr::ANTLRException &e)
        {
            printf("%s: %s\n", filename, e.toString().c_str());
        }
    }
    
    return changed;
}

static void read_cstr(ifstream &f, string &str)
{
    while (true)
    {
        char ch = f.get();
        if (!ch)
            break;
        str.push_back(ch);
    }
}

void JTAG::Part_Cache::read(const char *filename)
{
    ifstream f;
    
    f.exceptions(ifstream::badbit | ifstream::eofbit | ifstream::failbit);
    
    try
    {
        f.open(filename);
    } catch (std::exception &e)
    {
        throw runtime_error("Can't open part cache");
    }
        
    uint32_t sig;
    f.read((char *)&sig, 4);
    if (sig != PART_CACHE_SIGNATURE)
        throw runtime_error("Wrong signature");
    
    // Checking the length here means we don't have to check for EOF while reading
    unsigned long len;
    f.read((char *)&len, sizeof(len));
    if (len != file_size(filesystem::path(filename)))
    {
        throw runtime_error("Wrong file size");
    }
    
    uint8_t num_parts = f.get();
    for (int i = 0; i < num_parts; i++)
    {
        Part_Info *part = new Part_Info();
        read_cstr(f, part->name);
        f.read((char *)&part->idcode.value, sizeof(part->idcode.value));
        f.read((char *)&part->idcode.mask, sizeof(part->idcode.mask));
        f.read((char *)&part->ir_length, sizeof(part->ir_length));
        
        uint8_t num_instrs = f.get();
        for (int j = 0; j < num_instrs; j++)
        {
            Instruction *instr = new Instruction();
            instr->instr = bit_string(part->ir_length);

            f.read((char *)&instr->dr_length, sizeof(instr->dr_length));
            f.read((char *)instr->instr.data(), instr->instr.num_bytes());
            read_cstr(f, instr->name);
            
            part->opcodes[instr->name] = instr;
        }
    }
}

void JTAG::Part_Cache::write(const char *filename)
{
    ofstream f;

    f.exceptions(ofstream::badbit | ofstream::eofbit | ofstream::failbit);
    f.open(filename);
    
    uint32_t sig = PART_CACHE_SIGNATURE;
    f.write((char *)&sig, 4);
    
    // This will be replaced by the actual length later
    long len = 0;
    f.write((char *)&len, sizeof(len));
    
    const Part_Info_List &parts = Part_Info::part_info_list();
    f.put(parts.size());
    for (Part_Info_List::const_iterator i = parts.begin(); i != parts.end(); ++i)
    {
        Part_Info *part = *i;
        f.write((char *)part->name.c_str(), part->name.size() + 1);
        f.write((char *)&part->idcode.value, sizeof(part->idcode.value));
        f.write((char *)&part->idcode.mask, sizeof(part->idcode.mask));
        f.write((char *)&part->ir_length, sizeof(part->ir_length));
        
        f.put(part->opcodes.size());
        for (Part_Info::Opcode_Map::const_iterator op = part->opcodes.begin(); op != part->opcodes.end(); ++op)
        {
            Instruction *instr = (*op).second;
            
            f.write((char *)&instr->dr_length, sizeof(instr->dr_length));
            f.write((char *)instr->instr.data(), instr->instr.num_bytes());
            f.write((char *)instr->name.c_str(), instr->name.size() + 1);
        }
    }
    
    len = f.tellp();
    f.seekp(4);
    f.write((char *)&len, sizeof(len));
}
