#include <stdio.h>
#include <unistd.h>
#include <assert.h>

#include "USB_Device.hpp"
#include "config.h"

#define Packet_Size     6

using namespace std;

USB_Device *dev;

void cmd(uint8_t value)
{
    assert(dev->control(USB_Device::Control_In | USB_Device::Control_Vendor, 2, 0, value));
}

void write(uint8_t reg, uint8_t value)
{
    assert(dev->control(USB_Device::Control_In | USB_Device::Control_Vendor, 1, value, reg));
}

uint8_t read(uint8_t reg)
{
    uint8_t value = 0;
    assert(dev->control(USB_Device::Control_In | USB_Device::Control_Vendor, 3, 0, reg, &value, 1));
    return value;
}

void init()
{
    for (unsigned int i = 0; i < sizeof(cc1101_regs); i += 2)
    {
        write(cc1101_regs[i], cc1101_regs[i + 1]);
    }
}

int main(int argc, char *argv[])
{
    vector<USB_Device *> devs;
    USB_Device::find_all(devs, 0x3141, 0x0003);
    
    printf("Found %d devices\n", devs.size());
    if (devs.empty())
    {
        return 1;
    }
    
    int n = 0;
    if (argc == 2)
    {
        n = atoi(argv[1]);
    }
    
    dev = devs[n];
    if (!dev->open())
    {
        printf("Can't open\n");
        return 1;
    }
    if (!dev->set_default())
    {
        printf("Can't set default config\n");
        return 1;
    }
    
    dev->control(USB_Device::Control_In | USB_Device::Control_Vendor, 0, 1, 0);
    
    init();
    
    cmd(0x36);          // IDLE
    cmd(0x3b);          // SFTX
    
    write(0x07, 0x4c);  // PKTCTRL1
    write(0x08, 0x04);  // PKTCTRL0
    write(0x06, Packet_Size);  // PKTLEN
    write(0x03, 0x07);  // FIFOTHR
    
    uint8_t i = 0;
    do
    {
        uint8_t buf[Packet_Size] = {i++, 0x55, 0xaa, 0xc9};
        cmd(0x33);          // CAL
        assert(dev->bulk_write(1, buf, sizeof(buf)));
        
        usleep(50 * 1000);
    } while (true);

    return 0;
}
