`timescale 1ns/1ns

`include "pwm.v"
`include "half_bridge.v"
`include "bldc.v"
`include "hall_timer.v"
`include "hall_counter.v"
`include "motor.v"
`include "top.v"
`include "kicker.v"

module main;
    reg clk = 0, ale = 1, read = 1, write = 1;
    wire led0, led1;
    wire tx_mcu, rx_mcu, tx_radio, rx_radio;
    wire [7:0] data;
    reg [7:0] data_out = 0;
    
    wire rx_pdn, rx_ssdata, rx_ssclk;
    reg tx_pdn = 0, tx_cts = 0;
    wire tx_ssdata, tx_ssclk;
    
    reg m1hall_a = 1, m1hall_b = 0, m1hall_c = 0;
    reg m2hall_a = 0, m2hall_b = 0, m2hall_c = 0;
    reg m3hall_a = 0, m3hall_b = 0, m3hall_c = 0;
    reg m4hall_a = 0, m4hall_b = 0, m4hall_c = 0;
    reg m5hall_a = 0, m5hall_b = 0, m5hall_c = 0;
    wire m1a_h, m1a_l, m1b_h, m1b_l, m1c_h, m1c_l;
    wire m2a_h, m2a_l, m2b_h, m2b_l, m2c_h, m2c_l;
    wire m3a_h, m3a_l, m3b_h, m3b_l, m3c_h, m3c_l;
    wire m4a_h, m4a_l, m4b_h, m4b_l, m4c_h, m4c_l;
    wire m5a_h, m5a_l, m5b_h, m5b_l, m5c_h, m5c_l;
    
    reg button = 0;
    reg [3:0] switch = 1;
    wire ant_a, ant_b;
    
    reg charge_done = 0;
    wire charge, kick, chip;
    
    reg ale_setup = 0;
    assign data = ((write == 0) || ale_setup || (ale == 0)) ? data_out : 8'bzzzzzzzz;
    
    robocup top(clk, led0, led1, tx_mcu, rx_mcu, tx_radio, rx_radio,
        rx_pdn, rx_ssdata, rx_ssclk,
        tx_pdn, tx_ssdata, tx_ssclk,
        ale, read, write, data,
        m1hall_a, m1hall_b, m1hall_c,
        m2hall_a, m2hall_b, m2hall_c,
        m3hall_a, m3hall_b, m3hall_c,
        m4hall_a, m4hall_b, m4hall_c,
        m5hall_a, m5hall_b, m5hall_c,
        m1a_h, m1a_l, m1b_h, m1b_l, m1c_h, m1c_l,
        m2a_h, m2a_l, m2b_h, m2b_l, m2c_h, m2c_l,
        m3a_h, m3a_l, m3b_h, m3b_l, m3c_h, m3c_l,
        m4a_h, m4a_l, m4b_h, m4b_l, m4c_h, m4c_l,
        m5a_h, m5a_l, m5b_h, m5b_l, m5c_h, m5c_l,
        button, switch,
        ant_a, ant_b,
        charge_done, charge, kick, chip, tx_cts
    );

    // Clock
    initial begin
        clk = 0;
        forever begin
            #34 clk = ~clk;
        end
    end
    
    // Charger
    initial begin
        forever begin
            wait (charge == 1) #100000 charge_done = 1;
            wait (charge == 0) charge_done = 0;
        end
    end
    
    reg [7:0] read_data;
    task read;
        input [7:0] address;
        
        begin
            ale_setup = 1; data_out = address; #17; ale_setup = 0;
            ale = 0; #136; ale = 1; #68;
            read = 0; #34; read_data <= data; #34; read = 1;
            #51;
        end
    endtask
    
    task write;
        input [7:0] address;
        input [7:0] data;
        
        begin
            ale_setup = 1; data_out = address; #17; ale_setup = 0;
            ale = 0; #136; ale = 1;
            data_out = data;
            write = 0; #136; write = 1;
            #51;
        end
    endtask
    
    // Radio test
    reg ok;
    initial begin
        write(8'h10, 8'he5);
        tx_pdn = 1;
        #1200;
        read(8'h12);
        #1200;
        read(8'h12);
        read(8'h10);
    end
    
    // Motor test
    initial begin
        write(8'h00, 8'h01);
    end

    // Logging
    initial begin
        $dumpvars;
        $dumpall;
        #20000000
        $finish;
    end
endmodule
