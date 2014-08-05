// This is a packed bit vector, like stl::bit_vector, but it provides access
// to its internal storage, which is in the proper format for JTAG bit strings.
//
// This class currently does not provide vector operations that are not
// particularly useful for JTAG.

#ifndef _BIT_STRING_H_
#define _BIT_STRING_H_

#include <stdint.h>
#include <string>

class bit_string
{
protected:
    // This class is used to allow operator[] to be assignable.
    class bit_ref
    {
    public:
        bit_ref(uint8_t *byte, uint8_t bit) { _byte = byte; _bit = bit; }
        
        bool operator=(bool value)
        {
            if (value)
            {
                *_byte |= _bit;
            } else {
                *_byte &= ~_bit;
            }
        
            return value;
        }
        
        operator bool() const
        {
            return *_byte & _bit;
        }
        
    protected:
        uint8_t *_byte, _bit;
    };
    

public:
    typedef unsigned int size_type;
    
    // Creates a zero-size bit string.
    bit_string();
    
    // Creates a bit string of size <n> containing all 0's.
    bit_string(size_type n);
    
    // Creates and initializes a bit string from a text string.
    // All characters equal to <one> produce 1 bits, while other characters produce 0 bits.
    bit_string(const std::string &str, char one = '1');
    
    bit_string(const bit_string &other);
    
    ~bit_string();
    
    bit_string &operator=(const bit_string &other);
    
    bit_ref operator[](size_type i) { return bit_ref(_data + i / 8, 1 << (i & 7)); }
    
    // Returns an array of bytes.  Bits are stored in order from LSB to MSB in each byte,
    // with the first byte holding bit zero.
    uint8_t *data() const { return _data; }
    
    // Returns the number of bits contained by this bit string
    size_type size() const { return _size; }
    
    // Returns the number of bytes in the data array
    size_type num_bytes() const { return (_size + 7) / 8; }
    
protected:
    void alloc();

    size_type _size;
    uint8_t *_data;
};

#endif // _BIT_STRING_H_
