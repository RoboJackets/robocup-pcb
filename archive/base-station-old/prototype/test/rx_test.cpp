#include <stdio.h>
#include <assert.h>
#include <sched.h>

#include "USB_Device.hpp"
#include "config.h"
#include "../common/cc1101.h"

#define Packet_Size     28

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
    
    dev->control(USB_Device::Control_In | USB_Device::Control_Vendor, 0, 0, 0);
    dev->control(USB_Device::Control_In | USB_Device::Control_Vendor, 4, 0, 0);
    
    printf("MARCSTATE %02x\n", read(MARCSTATE));
    unsigned int len = read(RXBYTES);
    printf("RXBYTES %02x\n", len);
    cmd(SFRX);          // SFRX
    read(RXFIFO);
    if (len)
    {
        printf("%2d: ", len);
        for (unsigned int i = 0; i < len; ++i)
        {
            if (i && (i % 6) == 0)
            {
                printf("\n    ");
            }
            printf("%02x ", read(RXFIFO));
        }
        printf("\n");
    }
    cmd(0x36);          // IDLE
    cmd(SFRX);          // SFRX
    printf("MARCSTATE %02x\n", read(MARCSTATE));
    printf("RXBYTES %02x\n", read(RXBYTES));
    
    init();
    
    struct sched_param p;
    p.sched_priority = 1;
//    assert(sched_setscheduler(0, SCHED_FIFO, &p) == 0);
    
    cmd(0x36);          // IDLE
    cmd(0x33);          // CAL
    cmd(0x3a);          // SFRX
    
    write(0x07, 0x4c);  // PKTCTRL1
    write(0x08, 0x04);  // PKTCTRL0
    write(0x06, Packet_Size);  // PKTLEN
    write(0x03, 0x07);  // FIFOTHR
    
//    cmd(0x34);          // SRX
    
    uint8_t last_seq = 0;
    while (true)
    {
        uint8_t buf[64];
        unsigned int len = 0;
        
        do
        {
//            cmd(0x36);          // IDLE
            cmd(0x33);          // CAL
//            write(0x0c, read(0xf2));
            cmd(0x34);          // SRX
            
            dev->bulk_read(2, buf, sizeof(buf), 100, &len);
            if (len == 0)
            {
                printf("Timeout\n");
            }
        } while (len == 0);
        
//        printf("FREQEST %02x   ", read(0xf2));
        
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
        
        if (seq != (last_seq + 1) && !(seq == 0 && last_seq == 0xff))
        {
            printf(" skipped %d", seq - last_seq - 1);
        }
        
        printf("\n");
        last_seq = seq;
    }

    return 0;
}
