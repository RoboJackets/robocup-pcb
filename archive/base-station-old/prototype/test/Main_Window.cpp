#include <QProgressDialog>

#include <math.h>
#include <unistd.h>

#include "Main_Window.hpp"
#include "USB_Device.hpp"

Main_Window::Main_Window(USB_Device *dev, QWidget *parent): QMainWindow(parent)
{
    _dev = dev;
    tx = false;
    
    ui.setupUi(this);
    
    connect(ui.crystal, SIGNAL(valueChanged(double)), SLOT(update_freq()));
    connect(ui.freq, SIGNAL(valueChanged(double)), SLOT(update_freq()));
    
    update_freq();
}

void Main_Window::on_red_led_toggled(bool on)
{
    _dev->control(USB_Device::Control_In | USB_Device::Control_Vendor, 0, on, 0);
}

void Main_Window::on_freq_editingFinished()
{
    printf("ok\n");
}

void Main_Window::update_freq()
{
    double crystal = ui.crystal->value();
    double base_freq = ui.freq->value();
    
    if (base_freq >= 770 && base_freq <= 970)
    {
        freq = (int)round(base_freq * 65536.0 / crystal);
        double freq_actual = crystal / 65536.0 * freq;
        ui.freq_actual->setText(QString::number(freq_actual, 'f', 6));
        printf("%08x %f\n", freq, freq_actual);
        
        if (tx)
        {
            on_idle_clicked();
            send_freq();
            on_cal_clicked();
            on_tx_clicked();
        } else {
            send_freq();
        }
    }
}

void Main_Window::send_freq()
{
    int f0 = freq & 0xff;
    int f1 = (freq >> 8) & 0xff;
    int f2 = (freq >> 16) & 0xff;
    _dev->control(USB_Device::Control_In | USB_Device::Control_Vendor, 1, f0, 0x0f);
    _dev->control(USB_Device::Control_In | USB_Device::Control_Vendor, 1, f1, 0x0e);
    _dev->control(USB_Device::Control_In | USB_Device::Control_Vendor, 1, f2, 0x0d);
}

void Main_Window::on_send_clicked()
{
    update_freq();
    send_freq();
    
    int channel = ui.channel->value();
    _dev->control(USB_Device::Control_In | USB_Device::Control_Vendor, 1, channel, 0x0a);
}

void Main_Window::on_idle_clicked()
{
    tx = false;
    _dev->control(USB_Device::Control_In | USB_Device::Control_Vendor, 2, 0, 0x36);
}

void Main_Window::on_cal_clicked()
{
    if (tx)
    {
        on_idle_clicked();
        tx = false;
    }
    
    _dev->control(USB_Device::Control_In | USB_Device::Control_Vendor, 2, 0, 0x33);
}

void Main_Window::on_tx_clicked()
{
    tx = true;
    _dev->control(USB_Device::Control_In | USB_Device::Control_Vendor, 1, 0xc0, 0x3e);
    _dev->control(USB_Device::Control_In | USB_Device::Control_Vendor, 2, 0, 0x35);
}

void Main_Window::on_rx_clicked()
{
    tx = false;
    _dev->control(USB_Device::Control_In | USB_Device::Control_Vendor, 2, 0, 0x34);
}

void Main_Window::on_sweep_clicked()
{
    QProgressDialog *dlg = new QProgressDialog(this);
    dlg->setWindowModality(Qt::WindowModal);
    dlg->setLabelText("Frequency Sweep");
    dlg->setCancelButtonText("Cancel");
    dlg->setMaximum(100);
    dlg->show();
    
    double start = ui.sweep_start->value();
    double stop = ui.sweep_stop->value();
    double step = ui.sweep_step->value();
    
    for (double f = start; f <= stop && !dlg->wasCanceled(); f += step)
    {
        dlg->setValue((int)((f - start) * 100.0 / (stop - start)));
        QCoreApplication::processEvents();
        
        ui.freq->setValue(f);
        on_idle_clicked();
        update_freq();
        send_freq();
        on_cal_clicked();
        on_tx_clicked();
        
        usleep(100 * 1000);
    }
    
    delete dlg;
}
