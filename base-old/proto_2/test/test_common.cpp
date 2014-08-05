#include <stdio.h>
#include <assert.h>
#include <sys/time.h>

#include "USB_Device.hpp"
#include "config.h"
#include "test.hpp"

using namespace std;

USB_Device *dev;

void cmd(uint8_t reg)
{
    assert(dev->control(USB_Device::Control_In | USB_Device::Control_Vendor, 2, 0, reg));
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

void send_motors(int m0, int m1, int m2, int m3, int m4)
{
    uint8_t forward_packet[Forward_Size];
    
    struct timeval t1, t2;
    
    gettimeofday(&t1, 0);
    forward_packet[0] = ((forward_packet[0] & 0xf0) + 0x10) | 0x00;
    forward_packet[1] = 0x07;
    forward_packet[2] = 0x00;
    
    int offset = 3;
    for (int board = 0; board < 5; ++board)
    {
        forward_packet[offset++] = m0;
        forward_packet[offset++] = m1;
        forward_packet[offset++] = m2;
        forward_packet[offset++] = m3;
        forward_packet[offset++] = board;
    }
    
    fflush(stdout);
    assert(dev->bulk_write(1, forward_packet, Forward_Size));
    
    gettimeofday(&t2, 0);
    unsigned int used = (t2.tv_usec - t1.tv_usec + (t2.tv_sec - t1.tv_sec) * 1000000);
    int delay = 33 * 1000 - used;
    if (delay > 0)
    {
        usleep(delay);
    }
}

bool test_init(int n)
{
    vector<USB_Device *> devs;
    USB_Device::find_all(devs, 0x3141, 0x0004);
    
    if (devs.empty())
    {
        printf("No base station found\n");
        return false;
    }
    
    dev = devs[n];
    if (!dev->open())
    {
        printf("Can't open\n");
        return false;
    }
    if (!dev->set_default())
    {
        printf("Can't set default config\n");
        return false;
    }
    
    assert(dev->control(USB_Device::Control_In | USB_Device::Control_Vendor, 4, 0, 0));
    init();
    
    cmd(0x36);                  // IDLE
    cmd(0x3b);                  // SFTX
    
    write(0x07, 0x4c);          // PKTCTRL1
    write(0x08, 0x04);          // PKTCTRL0
//    write(0x06, Forward_Size);  // PKTLEN
//    write(0x03, 0x07);          // FIFOTHR
    
    // Set reverse packet size
    assert(dev->control(USB_Device::Control_In | USB_Device::Control_Vendor, 5, Reverse_Size, 0));

    assert(dev->control(USB_Device::Control_In | USB_Device::Control_Vendor, 4, 1, 0));
    
    return true;
}
