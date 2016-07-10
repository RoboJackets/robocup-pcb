#ifndef _MAIN_WINDOW_HPP_
#define _MAIN_WINDOW_HPP_

#include <QMainWindow>

#include "ui_main_window.h"

class USB_Device;

class Main_Window: public QMainWindow
{
    Q_OBJECT;
    
public:
    Main_Window(USB_Device *dev, QWidget *parent = 0);
    
protected slots:
    void on_red_led_toggled(bool on);
    void update_freq();
    void on_freq_editingFinished();
    void on_send_clicked();
    void on_idle_clicked();
    void on_cal_clicked();
    void on_tx_clicked();
    void on_rx_clicked();
    void on_sweep_clicked();

protected:
    Ui_Main_Window ui;
    USB_Device *_dev;
    
    bool tx;
    
    // Value for FREQ0:2
    int freq;
    
    void send_freq();
};

#endif // _MAIN_WINDOW_HPP_
