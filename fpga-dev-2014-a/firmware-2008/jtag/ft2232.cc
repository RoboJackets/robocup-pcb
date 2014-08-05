// Low byte is ADBUS[0-7]
// High byte is ACBUS[0-3]
//
// Pinout:
//  ADBUS0  TCK (out)
//  ADBUS1  TDI (out)
//  ADBUS2  TDO (in)
//  ADBUS3  TMS (out)
//  ADBUS4  JTAG /OE (out)
//  ADBUS5  Vtarget (in)
//  ADBUS6  /SRST (in)
//  ADBUS7  unused
//
//  ACBUS0  /TRST (out)
//  ACBUS1  /SRST (out)
//  ACBUS2  /TRST /OE (out)
//  ACBUS3  /SRST /OE (out)

#include "ft2232.h"

#include <stdexcept>
#include <stdio.h>

using namespace std;

enum
{
    ADBUS0,
    ADBUS1,
    ADBUS2,
    ADBUS3,
    ADBUS4,
    ADBUS5,
    ADBUS6,
    ADBUS7,
    
    ACBUS0,
    ACBUS1,
    ACBUS2,
    ACBUS3
};

enum
{
    TCK = ADBUS0,
    TDI = ADBUS1,
    TDO = ADBUS2,
    TMS = ADBUS3,
    JTAG_nOE = ADBUS4,
    VTARGET = ADBUS5,
    nSRST_IN = ADBUS6,
    
    nTRST = ACBUS0,
    nSRST_OUT = ACBUS1,
    nTRST_nOE = ACBUS2,
    nSRST_nOE = ACBUS3
};

void assert_err(bool test)
{
    if (!test)
    {
        throw runtime_error("assert failed");
    }
}

JTAG::FT2232::FT2232(uint16_t product, uint16_t vendor)
{
    _debug = false;
    
    uint8_t buf[3];
    
    ftdi_init(&ctx);
        
    assert_err(!ftdi_usb_open(&ctx, product, vendor));
    assert_err(!ftdi_set_interface(&ctx, INTERFACE_A));
    assert_err(!ftdi_usb_reset(&ctx));
    assert_err(!ftdi_usb_purge_buffers(&ctx));
    assert_err(!ftdi_set_latency_timer(&ctx, 2));
    assert_err(!ftdi_set_bitmode(&ctx, 0x0b, 2));
    
    // Turn off loopback
    buf[0] = 0x85;
    assert_err(ftdi_write_data(&ctx, buf, 1) == 1);
    
    // Set clock divisor
    buf[0] = 0x86;
    buf[1] = 0x02;
    buf[2] = 0x00;
    assert_err(ftdi_write_data(&ctx, buf, 3) == 3);
    
    // Set initial data and direction
    data_out = (1 << nSRST_nOE) | (1 << nTRST) | (1 << TMS);

    // Set low byte
    buf[0] = 0x80;          // Command
    buf[1] = data_out;      // Value
    buf[2] = 0x1b;          // Direction
    assert_err(ftdi_write_data(&ctx, buf, 3) == 3);

    // Set high byte
    buf[0] = 0x82;          // Command
    buf[1] = data_out >> 8; // Value
    buf[2] = 0x0f;          // Direction
    assert_err(ftdi_write_data(&ctx, buf, 3) == 3);
}

JTAG::FT2232::~FT2232()
{
    if (_debug)
    {
        printf("shutdown\n");
    }
    
    ftdi_usb_close(&ctx);
    ftdi_deinit(&ctx);
}

void JTAG::FT2232::tms(bool state)
{
    set_bit(TMS, state);
}

void JTAG::FT2232::tck(bool state)
{
    set_bit(TCK, state);
    
    if (state)
    {
        update_state();
    }
}

void JTAG::FT2232::tdi(bool state)
{
    set_bit(TDI, state);
}

bool JTAG::FT2232::tms()
{
    return data_out & (1 << TMS);
}

bool JTAG::FT2232::tck()
{
    return data_out & (1 << TCK);
}

bool JTAG::FT2232::tdi()
{
    return data_out & (1 << TDI);
}

bool JTAG::FT2232::tdo()
{
    uint8_t pins = 0;
    ftdi_read_pins(&ctx, &pins);
    
    return pins & (1 << TDO);
}

void JTAG::FT2232::trst(bool state)
{
    set_bit(nTRST, !state);
}

void JTAG::FT2232::srst(bool state)
{
    set_bit(nSRST_OUT, !state);
}

bool JTAG::FT2232::have_trst()
{
    return true;
}

bool JTAG::FT2232::have_srst()
{
    return true;
}

void JTAG::FT2232::shift_tms(uint8_t bits, uint8_t len)
{
    assert_err(len >= 1 && len <= 7);
    
    if (_debug)
    {
        printf("shift_tms %d bits: %x\n", len, bits);
    }
    
    uint8_t buf[3] = {0x4b, len - 1, bits | ((data_out & TDI) ? 0x80 : 0)};
    ftdi_write_data(&ctx, buf, 3);
    
    // Record new TMS state
    data_out = (data_out & ~(1 << TMS));
    if (bits & (1 << (len - 1)))
    {
        data_out |= 1 << TMS;
    }
    
    //FIXME - Should set cur_state here, but set_state does it for now
}

void JTAG::FT2232::shift_data(const uint8_t *in, uint8_t *out, unsigned int bits, bool exit)
{
    if (_debug)
    {
        printf("shift_data %p %p %d %d\n", in, out, bits, exit);
    }
    
    if ((!in && !out) || !bits)
    {
        // Nothing to do
        return;
    }
    
    if (exit)
    {
        // The last bit will be sent by bit-banging
        bits--;
    }
    
    // Commands are LSB first, write on positive clock edge.
    // Note that "in" and "out" here are from the target's point of view
    // (TDI is in), but the FT2232 documentation is written from the FT2232's
    // point of view (TDI is out).
    uint8_t cmd = 0x09;
    
    if (in)
    {
        cmd |= 0x10;
    }
    
    if (out)
    {
        // Read on negative clock edge.
        cmd |= 0x24;
    }
    
    if (bits >= 8)
    {
        // Read/write whole bytes
        unsigned int bytes = bits / 8;
        
        // Can't change the parameters since writing bits (below) needs them.
        uint8_t *temp_in = (uint8_t *)in;
        uint8_t *temp_out = out;
        
        while (bytes)
        {
            // Write at most 65536 bytes at once, because the length
            // in the command can't indicate more than this.
            unsigned int write_len = (bytes > 384) ? 384 : bytes;
            
            // Command
            uint8_t buf[] = {cmd, write_len - 1, (write_len - 1) >> 8};
            ftdi_write_data(&ctx, buf, sizeof(buf));
            
            if (_debug)
            {
                printf("  byte cmd %02x %02x %02x\n", buf[0], buf[1], buf[2]);
            }
            
            // Data
            if (in)
            {
                int ret = ftdi_write_data(&ctx, temp_in, write_len);
                
                if (_debug)
                {
                    printf("  partial ret %d\n", ret);
                }
            }
            
            if (out)
            {
                if (_debug)
                {
                    printf("  out: %d bytes\n", write_len);
                }
                
                read(temp_out, write_len);
            }
            
            temp_in += write_len;
            temp_out += write_len;
            bytes -= write_len;
        }
    }
    
    // Number of bits in the last byte
    unsigned int bits_left = bits & 7;
    
    // Offset of the last byte
    unsigned int offset = bits / 8;
    
    // Shift the last partial byte
    if (bits_left)
    {
        if (in)
        {
            // Read/write bits
            uint8_t buf[] = {cmd | 2, bits_left - 1, in[offset]};
            int ret = ftdi_write_data(&ctx, buf, sizeof(buf));
            
            if (_debug)
            {
                printf("  rw bits cmd %02x %02x %02x ret %d\n", buf[0], buf[1], buf[2], ret);
            }
        } else {
            // Read bits
            uint8_t buf[] = {cmd | 2, bits_left - 1};
            int ret = ftdi_write_data(&ctx, buf, sizeof(buf));
            
            if (_debug)
            {
                printf("  read bits cmd ret %d\n", ret);
            }
        }
        
        if (out)
        {
            read(out + offset, 1);
            
            // Data is MSB-aligned, so shift it down to be LSB-aligned.
            out[offset] >>= 8 - bits_left;
        }
    }
    
    // Shift the last bit with TMS high
    if (exit)
    {
        // Bits was decremented at the beginning of the function, so we can
        // use it here as the index of the last bit.
        
        // Mask for the last bit
        uint8_t mask = 1 << (bits & 7);
        
        bool last_bit;
        if (in)
        {
            last_bit = in[offset] & mask;
        } else {
            last_bit = false;
        }
        
        if (_debug)
        {
            printf("  offset %d\n", offset);
            printf("  bits %d\n", bits + 1);
            printf("  mask %d %02x\n", bits_left, mask);
        }
        
        if (out)
        {
            uint8_t buf[3] = {0x6f, 0, last_bit ? 0x81 : 0x01};
            ftdi_write_data(&ctx, buf, sizeof(buf));
            
            uint8_t last = 0;
            read(&last, 1);
            
            if (_debug)
            {
                printf("  last %02x\n", last);
            }
            
            // TDO is shifted into the high bit
            if (last & 0x80)
            {
                out[offset] |= mask;
            }
        } else {
            uint8_t buf[3] = {0x4b, 0, last_bit ? 0x81 : 0x01};
            ftdi_write_data(&ctx, buf, sizeof(buf));
        }
        
        cur_state = next_state(cur_state, true);
    }
}

void JTAG::FT2232::set_bit(int n, bool state)
{
    data_out = (data_out & ~(1 << n)) | (state << n);
    
    try
    {
        uint8_t buf[3];
        if (n < 8)
        {
            // Low byte
            buf[0] = 0x80;
            buf[1] = data_out & 0xff;
            buf[2] = 0x1b;
            assert_err(ftdi_write_data(&ctx, buf, 3) == 3);
        } else {
            // High byte
            buf[0] = 0x82;
            buf[1] = data_out >> 8;
            buf[2] = 0x0f;
            assert_err(ftdi_write_data(&ctx, buf, 3) == 3);
        }
    } catch (runtime_error err)
    {
        printf("Write failed: %s\n", ftdi_get_error_string(&ctx));
    }
}

void JTAG::FT2232::read(uint8_t *data, unsigned int len)
{
    while (len)
    {
        int chunk = (len > 384) ? 384 : len;
        int ret = ftdi_read_data(&ctx, data, chunk);
        if (ret < 0)
        {
            printf("Read failed: %d\n", ret);
            abort();
        }
        
        if (ret && ret != chunk)
        {
            printf("Read %d/%d\n", ret, chunk);
        }
        
        data += ret;
        len -= ret;
    }
}
