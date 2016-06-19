#include <stdio.h>

#include "USB_Device.hpp"

using namespace std;

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
    
    USB_Device *dev = devs[n];
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
    
    dev->control(USB_Device::Control_In | USB_Device::Control_Vendor, 0xff, 0x1800, 0);
    
    return 0;
}
