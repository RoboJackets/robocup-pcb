#include <QApplication>

#include "Main_Window.hpp"
#include "USB_Device.hpp"

using namespace std;

int main(int argc, char *argv[])
{
    QApplication app(argc, argv);
    
    vector<USB_Device *> devs;
    USB_Device::find_all(devs, 0x3141, 0x0003);
    
    if (devs.empty())
    {
        printf("No devices found\n");
        return 1;
    }
    printf("Found %d devices\n", (int)devs.size());
    
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
    
#if 0
    uint8_t x = 0;
    printf("check %d\n", dev->control(USB_Device::Control_In | USB_Device::Control_Vendor, 3, 0, 0x11, &x, 1));
    printf("got %02x\n", x);
    dev->control(USB_Device::Control_In | USB_Device::Control_Vendor, 1, 0x06, 0x10);
#endif
    
    Main_Window *win = new Main_Window(dev);
    win->show();
    
    return app.exec();
}
