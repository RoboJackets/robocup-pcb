#include <boost/format.hpp>

#include "xilinx_bitstream.h"
#include "exceptions.h"
#include "bit_rev.h"

using namespace std;
using namespace boost;

Xilinx_Bitstream::Xilinx_Bitstream(const char *filename): _filename(filename)
{
    std::ifstream file;
    
    file.exceptions(ifstream::badbit | ifstream::eofbit | ifstream::failbit);
    
    try
    {
        file.open(filename);
    } catch (std::exception &e)
    {
        throw errno_exception(string("Can't open bitstream ") + filename);
    }

    //FIXME - Can we identify the first thirteen bytes?
    
    file.seekg(0x0d);
    
    // NCD filename
    if (file.get() != 'a')
        throw runtime_error(str(format("%1%: Missing NCD name at offset 0x%2$lx") % filename % file.tellg()));
    read_string(file, _ncd);

    // Part
    if (file.get() != 'b')
        throw runtime_error(str(format("%1%: Missing part name at offset 0x%2$lx") % filename % file.tellg()));
    read_string(file, _part);
    
    // Date
    if (file.get() != 'c')
        throw runtime_error(str(format("%1%: Missing date at offset 0x%2$lx") % filename % file.tellg()));
    read_string(file, _date);
    
    // Time
    if (file.get() != 'd')
        throw runtime_error(str(format("%1%: Missing time at offset 0x%2$lx") % filename % file.tellg()));
    read_string(file, _time);
    
    // Length
    if (file.get() != 'e')
        throw runtime_error(str(format("%1%: Missing configuration data at offset 0x%2$lx") % filename % file.tellg()));
    _size = file.get() << 24;
    _size |= file.get() << 16;
    _size |= file.get() << 8;
    _size |= file.get();
    
    _data = (uint8_t *)malloc(_size);
    if (!_data)
        throw length_error("Out of memory for configuration data");

    file.read((char *)_data, _size);
    for (unsigned int i = 0; i < _size; i++)
        _data[i] = bit_rev[_data[i]];
}

void Xilinx_Bitstream::read_string(ifstream &file, string &str)
{
    uint16_t len = file.get() << 8;
    len |= file.get();
    
    str.resize(len);
    for (uint16_t i = 0; i < len - 1; i++)
        str[i] = file.get();

    // Trailing zero
    file.get();
}
