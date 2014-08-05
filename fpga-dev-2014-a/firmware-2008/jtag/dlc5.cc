#include <errno.h>
#include <fcntl.h>
#include <unistd.h>
#include <sys/ioctl.h>
#include <linux/ppdev.h>
#include <linux/parport.h>

#include <string>

#include "dlc5.h"
#include "exceptions.h"

using namespace std;

#define CABLE_SENSE (PARPORT_STATUS_BUSY | PARPORT_STATUS_PAPEROUT)

DLC5::DLC5(const char *device)
{
    int param;
    uint8_t data;
    
    cur_tck = cur_tms = cur_tdi = false;
    
    bit_tdi = 0x01;
    bit_tck = 0x02;
    bit_tms = 0x04;
    
    handle = open(device, O_RDWR);
    if (handle < 0)
    {
        throw errno_exception(string("Can't open ") + device);
    }

    if (ioctl(handle, PPCLAIM) != 0)
    {
        throw errno_exception("Can't claim parallel port");
    }

    param = 0;
    if (ioctl(handle, PPDATADIR, &param) != 0)
    {
        throw errno_exception("Can't set data direction");
    }

    /* Make sure the cable is present */
    data = 0x18;
    ioctl(handle, PPWDATA, &data);

    ioctl(handle, PPRSTATUS, &data);
    if ((data & CABLE_SENSE) != PARPORT_STATUS_BUSY)
    {
        throw runtime_error("JTAG cable not detected (sense lines stuck high)");
    }

    data = 0x58;
    ioctl(handle, PPWDATA, &data);

    ioctl(handle, PPRSTATUS, &data);
    if ((data & CABLE_SENSE) != PARPORT_STATUS_PAPEROUT)
    {
        throw runtime_error("JTAG cable not detected (sense lines stuck low)");
    }

    /* Enable buffers */
    data = 0x10;
    ioctl(handle, PPWDATA, &data);
}

DLC5::~DLC5()
{
    if (handle >= 0)
    {
        // Disable buffers
        uint8_t data = 0x18;
        ioctl(handle, PPWDATA, &data);
        ioctl(handle, PPRELEASE);

        close(handle);
        handle = -1;
    }
}

void DLC5::set_bit(uint8_t bit, bool state)
{
    uint8_t data;

    if (handle < 0)
        throw runtime_error("DLC5::set_bit: Parallel port not initialized");

    ioctl(handle, PPRDATA, &data);

    if (state)
    {
        data |= bit;
    } else {
        data &= ~bit;
    }

    ioctl(handle, PPWDATA, &data);
}

void DLC5::tms(bool state)
{
    cur_tms = state;
    set_bit(bit_tms, state);
}

void DLC5::tck(bool state)
{
    bool update = state && !cur_tck;
    
    cur_tck = state;
    set_bit(bit_tck, state);
    
    if (update)
        update_state();
}

void DLC5::tdi(bool state)
{
    cur_tdi = state;
    set_bit(bit_tdi, state);
}

bool DLC5::tck()
{
    return cur_tck;
}

bool DLC5::tms()
{
    return cur_tms;
}

bool DLC5::tdi()
{
    return cur_tdi;
}

bool DLC5::tdo()
{
    uint8_t status;

    if (handle < 0)
        throw runtime_error("DLC5::tdo: Parallel port not initialized");

    ioctl(handle, PPRSTATUS, &status);

    return (status & PARPORT_STATUS_SELECT);
}
