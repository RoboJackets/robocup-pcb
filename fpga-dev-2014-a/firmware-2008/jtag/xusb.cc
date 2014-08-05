#include <stdexcept>
#include <stdio.h>

#include "xusb.h"
#include "exceptions.h"

using namespace std;

static struct usb_device *find_device(uint16_t vendor, uint16_t product)
{
    for (struct usb_bus *bus = usb_get_busses(); bus; bus = bus->next)
    {
        for (struct usb_device *dev = bus->devices; dev; dev = dev->next)
        {
            if (dev->descriptor.idVendor == vendor && dev->descriptor.idProduct == product)
            {
                return dev;
            }
        }
    }
    
    return NULL;
}

XUSB::XUSB()
{
    handle = 0;
    
    usb_init();
    
    usb_find_busses();
    usb_find_devices();
    
    struct usb_device *dev = find_device(0x03fd, 0x000d);
    if (!dev)
    {
        throw errno_exception("XUSB: Can't find device");
    }
    
    handle = usb_open(dev);
    if (!handle)
    {
        throw errno_exception("XUSB: Can't open device");
    }
    
    if (usb_set_configuration(handle, 1))
    {
        throw errno_exception("XUSB: Can't set configuration");
    }
    
    if (usb_claim_interface(handle, 0))
    {
        throw errno_exception("XUSB: Can't claim configuration");
    }
    
    if (usb_set_altinterface(handle, 1))
    {
        throw errno_exception("XUSB: Can't set alt interface");
    }
    
    char crap[256];
    printf("flush %d\n", usb_bulk_read(handle, 6, crap, sizeof(crap), 1));
    
    enable();
}

XUSB::~XUSB()
{
    if (handle)
    {
        disable();
        
        usb_release_interface(handle, 1);
        usb_close(handle);
        handle = 0;
    }
}

void XUSB::enable()
{
    uint8_t data[] = {0x04};
    if (usb_bulk_write(handle, 2, (char *)data, sizeof(data), 0) != sizeof(data))
    {
        throw errno_exception("XUSB: enable");
    }
}

void XUSB::disable()
{
    uint8_t data[] = {0x05};
    if (usb_bulk_write(handle, 2, (char *)data, sizeof(data), 0) != sizeof(data))
    {
        throw errno_exception("XUSB: disable");
    }
}

void XUSB::tms(bool state)
{
    uint8_t data[] = {0x06, 0x04, state ? 0x04 : 0x00};
    if (usb_bulk_write(handle, 2, (char *)data, sizeof(data), 0) != sizeof(data))
    {
        throw errno_exception("XUSB: tms");
    }
}

void XUSB::tck(bool state)
{
    uint8_t data[] = {0x06, 0x02, state ? 0x02 : 0x00};
    if (usb_bulk_write(handle, 2, (char *)data, sizeof(data), 0) != sizeof(data))
    {
        throw errno_exception("XUSB: tck");
    }
}

void XUSB::tdi(bool state)
{
    uint8_t data[] = {0x06, 0x01, state ? 0x01 : 0x00};
    if (usb_bulk_write(handle, 2, (char *)data, sizeof(data), 0) != sizeof(data))
    {
        throw errno_exception("XUSB: tdi");
    }
}

bool XUSB::tdo()
{
    throw runtime_error("XUSB: tdo not implemented");
}

bool XUSB::tms()
{
    throw runtime_error("XUSB: tms not implemented");
}

bool XUSB::tck()
{
    throw runtime_error("XUSB: tck not implemented");
}

bool XUSB::tdi()
{
    throw runtime_error("XUSB: tdi not implemented");
}

void XUSB::shift_tms(uint8_t bits, uint8_t len)
{
    if (!handle)
    {
        throw runtime_error("XUSB: Not initialized");
    }

    uint8_t data[] = {0x00, len, bits};
    if (usb_bulk_write(handle, 2, (char *)data, sizeof(data), 0) != sizeof(data))
    {
        throw errno_exception("shift_tms");
    }
}

void XUSB::shift_data(const uint8_t *in, uint8_t *out, unsigned int bits, bool exit)
{
    if (in && out)
    {
        throw runtime_error("XUSB: exchange data not implemented");
    }
    
    if (out)
    {
        if (bits > 64)
        {
            throw runtime_error("XUSB: shift out: too many bits");
        }
        
        uint8_t data[] = {0x01, bits, bits >> 8};
        if (exit)
        {
            data[0] |= 0x80;
        }
        if (usb_bulk_write(handle, 2, (char *)data, sizeof(data), 0) != sizeof(data))
        {
            throw errno_exception("XUSB: shift out command");
        }
        
        unsigned int bytes = (bits + 7) / 8;
        if (usb_bulk_read(handle, 6, (char *)out, bytes, 0) != (int)bytes)
        {
            throw errno_exception("XUSB: shift out data");
        }

#if 0
        printf("read %d:", bytes);
        for (unsigned int i = 0; i < bytes; ++i)
        {
            printf(" %02x", out[i]);
        }
        printf("\n");
#endif
    } else if (in)
    {
//        printf("in %d bits %d\n", bits, exit);
        int bytes = bits / 8;
        
        int last_bits = bits & 7;
        if (exit && !(bits & 7))
        {
            // Have to write the last byte separately
            // so the exit flag can be set.
            bytes--;
            last_bits = 8;
        }
        
        if (bytes)
        {
            // Write full bytes without exit
            if (usb_bulk_write(handle, 4, (char *)in, bytes, 0) != bytes)
            {
                throw errno_exception("XUSB: shift in data");
            }

            if (bytes >= 64)
            {
                // Empty write to serialize EP4/EP2 transactions
                //FIXME - I don't think there's any guarantee that this will always work.
                usb_bulk_write(handle, 4, (char *)in, 0, 0);
            }
        }

#if 0
        uint8_t get_total[] = {0x11};
        usb_bulk_write(handle, 2, (char *)get_total, 1, 0);
        uint8_t total[7];
        usb_bulk_read(handle, 6, (char *)total, 7, 0);
        if (total[0] != 0xc9 || total[1] != 0x56 || total[6] != 0x39)
        {
            throw runtime_error("Bad total");
        }
        uint32_t n_total = total[2] + total[3] * 256 + total[4] * 65536 + total[5] * 16777216;
        printf(" total %d\n", n_total);
#endif

        if (exit || (bits & 7))
        {
            // Write the last byte
            uint8_t last_byte = in[bytes];
            uint8_t data[] = {0x02, last_bits, last_byte};
            if (exit)
            {
                data[0] |= 0x80;
            }
            
            if (usb_bulk_write(handle, 2, (char *)data, sizeof(data), 0) != sizeof(data))
            {
                throw errno_exception("XUSB: shift in command");
            }
        }
    }
    
    if (exit)
    {
        cur_state = next_state(cur_state, true);
    }
}

void XUSB::tck_pulse(unsigned int n)
{
    if (n > 255)
    {
        throw runtime_error("XUSB: too many tck_pulses");
    }
    
    uint8_t data[] = {0x03, n};
    if (usb_bulk_write(handle, 2, (char *)data, sizeof(data), 0) != sizeof(data))
    {
        throw errno_exception("XUSB: tck_pulse");
    }
}
