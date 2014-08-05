// A class to load a Xilinx .bit file.

#ifndef _XILINX_BITSTREAM_H_
#define _XILINX_BITSTREAM_H_

#include <stdint.h>
#include <fstream>
#include <string>

class Xilinx_Bitstream
{
public:
    // Loads the file.
    // Throws an exception if an error occurs.
    Xilinx_Bitstream(const char *filename);
    
    // Returns the name of this file, as given to the constructor
    const std::string &filename() const { return _filename; }
    
    // Returns the name of the NCD file which was used to generate the bitstream.
    const std::string &ncd() const { return _ncd; }
    
    // Returns the name of the part for which this bitstream was generated
    const std::string &part() const { return _part; }
    
    // Returns the date this bitstream was generated
    const std::string &date() const { return _date; }
    
    // Returns the time this bitstream was generated
    const std::string &time() const { return _time; }
    
    // Returns the number of bytes of configuration data
    uint32_t size() const { return _size; }
    
    const uint8_t *data() const { return _data; }
    
protected:
    std::string _filename;
    std::string _ncd;
    std::string _part;
    std::string _date;
    std::string _time;
    uint32_t _size;
    uint8_t *_data;
    
    // Reads a counted string from the file
    void read_string(std::ifstream &file, std::string &str);
};

#endif // _XILINX_BITSTREAM_H_
