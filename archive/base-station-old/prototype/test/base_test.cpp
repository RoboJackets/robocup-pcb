#include <stdio.h>
#include <unistd.h>
#include <assert.h>
#include <sys/time.h>
#include <pthread.h>

#include "USB_Device.hpp"
#include "config.h"

#define Packet_Size     62

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

void *rev_thread(void *param)
{
    uint8_t last_seq = 0;
    uint8_t buf[Packet_Size + 2];
    bool first = true;
    while (1)
    {
        unsigned int len = 0;
        dev->bulk_read(2, buf, sizeof(buf), 0, &len);
    
        printf("%2d: ", len);
        for (unsigned int i = 0; i < len; ++i)
        {
            printf("%02x ", buf[i]);
        }
        uint8_t seq = buf[0];
        uint8_t rssi = buf[len - 2];
        uint8_t status = buf[len - 1];
        
        printf("  RSSI %6.1fdBm ", (float)(int8_t)rssi / 2 - 74);
        
        if (!(status & 0x80))
        {
            printf(" CRC ");
        }
        
        if (!first)
        {
            if (seq != (last_seq + 1) && !(seq == 0 && last_seq == 0xff))
            {
                printf(" skipped %d", seq - (uint8_t)(last_seq + 1));
            }
        } else {
            first = false;
        }
        
        printf("\n");
        
        last_seq = seq;
    }
}

int main(int argc, char *argv[])
{
    vector<USB_Device *> devs;
    USB_Device::find_all(devs, 0x3141, 0x0003);
    
    printf("Found %d device%s\n", devs.size(), (devs.size() == 1) ? "" : "s");
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
    
    dev->control(USB_Device::Control_In | USB_Device::Control_Vendor, 4, 0, 0);
    dev->control(USB_Device::Control_In | USB_Device::Control_Vendor, 0, 0, 0);
    
    init();
    
    cmd(0x36);          // IDLE
    cmd(0x33);          // CAL
    cmd(0x3b);          // SFTX
    cmd(0x3a);          // SFRX
    
//    write(0x07, 0x24);  // PKTCTRL1
    write(0x07, 0x4c);  // PKTCTRL1
    write(0x08, 0x04);  // PKTCTRL0
    write(0x06, Packet_Size);  // PKTLEN
    write(0x03, 0x0f);  // FIFOTHR
    
    dev->control(USB_Device::Control_In | USB_Device::Control_Vendor, 4, 1, 0);
    
    pthread_t t;
    pthread_create(&t, 0, rev_thread, 0);
    
//    usleep(500 * 1000);
//    printf("Start\n");
    
    uint8_t i = 0;
    do
    {
        struct timeval t1, t2;
        gettimeofday(&t1, 0);
        
        uint8_t buf[Packet_Size] = {i++, 0x55, 0xaa, 0xc9};
        assert(dev->bulk_write(1, buf, sizeof(buf)));
        
        gettimeofday(&t2, 0);
        long us = t2.tv_usec - t1.tv_usec + (t2.tv_sec - t1.tv_sec) * 1000000;
        usleep(10 * 1000 - us);
    } while (true);

    return 0;
}
