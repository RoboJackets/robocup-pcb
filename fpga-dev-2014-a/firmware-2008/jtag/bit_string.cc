#include <string.h>
#include <string>
#include <boost/format.hpp>

#include "bit_string.h"

using namespace std;
using namespace boost;

bit_string::bit_string()
{
    _size = 0;
    _data = 0;
}

bit_string::bit_string(size_type n)
{
    _size = n;
    _data = 0;
    alloc();
    memset(_data, 0, num_bytes());
}

bit_string::bit_string(const string &str, char one)
{
    _size = str.size();
    _data = 0;
    
    if (!_size)
    {
        return;
    }

    alloc();
    memset(_data, 0, num_bytes());

    size_type byte = 0;
    uint8_t bit = 1;
    string::size_type i = _size;
    do
    {
        --i;
        
        if (str[i] == one)
        {
            _data[byte] |= bit;
        }
        
        if (bit == 0x80)
        {
            bit = 1;
            byte++;
        } else {
            bit <<= 1;
        }
    } while (i);
}

bit_string::bit_string(const bit_string &other)
{
    _data = 0;
    *this = other;
}

bit_string::~bit_string()
{
    if (_data)
    {
        free(_data);
        _data = 0;
    }
}

bit_string &bit_string::operator=(const bit_string &other)
{
    _size = other.size();
    
    if (_data)
    {
        free(_data);
        _data = 0;
    }
    
    alloc();
    
    memcpy(_data, other.data(), num_bytes());
    
    return *this;
}

void bit_string::alloc()
{
    _data = (uint8_t *)realloc(_data, num_bytes());
    if (!_data)
    {
        _size = 0;
        throw length_error(str(format("bit_string: Can't allocate %1% bits") % _size));
    }
}
