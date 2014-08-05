// ALE, RD, and WR are active low.

// Conventions:
//  Hall effect sensor vectors are [2:0] which maps to {a, b, c}.
//  Half-bridge drive vectors are [1:0] which maps to {high, low}.
//  Motor output vectors are [5:0] which map to
//      {high_a, low_a, high_b, low_b, high_c, low_c}.

module robocup (
    input clk,
    
    output led0,
    output led1,
    
    input tx_mcu, rx_mcu,
    
    // Encoder upgrade pins
    input rx_radio, rx_pdn, rx_ssdata, rx_ssclk,
    input bl0, bl1, bl2, bl3,

    output tx_radio,
    input tx_pdn,
    output tx_ssdata, tx_ssclk,
    
    input ale, read, write,
    inout [7:0] data,
    
    input m1hall_a, m1hall_b, m1hall_c,
    input m2hall_a, m2hall_b, m2hall_c,
    input m3hall_a, m3hall_b, m3hall_c,
    input m4hall_a, m4hall_b, m4hall_c,
    input m5hall_a, m5hall_b, m5hall_c,
    
    output m1a_h, m1a_l, m1b_h, m1b_l, m1c_h, m1c_l,
    output m2a_h, m2a_l, m2b_h, m2b_l, m2c_h, m2c_l,
    output m3a_h, m3a_l, m3b_h, m3b_l, m3c_h, m3c_l,
    output m4a_h, m4a_l, m4b_h, m4b_l, m4c_h, m4c_l,
    output m5a_h, m5a_l, m5b_h, m5b_l, m5c_h, m5c_l,
    
    input button,
    input [3:0] switch,
    
    output ant_a, ant_b,
    
    input charge_done,
    output charge, kick, chip,
    
    input tx_cts
);

// New radio wiring
wire radio_ncs, radio_mosi, radio_sck;
wire radio_miso = tx_cts;
wire radio_gdo0 = 0;
wire radio_gdo2 = tx_pdn;

assign tx_radio = radio_ncs;
assign tx_ssclk = radio_mosi;
assign tx_ssdata = radio_sck;

// Bidirectional data bus.
// Read data is driven out when read is low.
// Otherwise the data bus is not driven.
// Reading is asynchronous and no action is taken as a result of a read.
wire [7:0] data_out;
assign data = read ? 8'bzzzzzzzz : data_out;

// Synchronize bus signals.
reg write_sync = 0;         // Active high
reg ale_sync = 0;           // Active high
reg [7:0] address_sync = 0;
reg [7:0] data_sync = 0;
reg last_write = 0;         // Value of write_sync on last clock
reg write_edge = 0;         // Active high for one cycle when /WR goes low

always @(posedge clk) begin
    // read is not synchronized because it is only used to gate data onto
    // the data bus.
    
    // Do not use ale, write, or data directly.  Use only their synchronized forms.
    ale_sync <= ~ale;
    write_sync <= ~write;
    data_sync <= data;
    
    // Address latch
    if (ale_sync) begin
        address_sync <= data_sync;
    end
    
    // Write edge detector
    write_edge <= ~last_write && write_sync;
    last_write <= write_sync;
end

// Test register
reg [7:0] test = 8'ha5;
always @(posedge clk) begin
    if (write_edge && address_sync == 8'hff) begin
        test <= data_sync;
    end
end

// Radio control
reg radio_select = 0;
assign radio_ncs = ~radio_select;
always @(posedge clk) begin
    if (write_edge && address_sync == 8'h12) begin
        radio_select <= data_sync[0];
    end
end

assign ant_b = 1;
assign ant_a = 0;

// Radio SPI

// Start when /WR goes low.
// This must use write_edge instead of write_sync because it must be
// high for exactly one clock cycle for every write, regardless of how
// long /WR is held low (otherwise duplicate bytes will be sent).
wire spi_start = (write_edge && address_sync == 8'h10);

reg [2:0] spi_clock_div = 0;
reg [3:0] spi_count = 8;
reg [7:0] spi_byte = 0;
reg spi_in = 0;
wire spi_clock = spi_clock_div[2];
wire spi_idle = spi_count[3];
always @(posedge clk) begin
    if (spi_count == 8) begin
        // Idle
        if (spi_start) begin
            spi_count <= 0;
            spi_clock_div <= 0;
            spi_byte <= data_sync;
        end
    end else begin
        // Shifting
        spi_clock_div <= spi_clock_div + 1;
        if (spi_clock_div == 3) begin
            spi_in <= radio_miso;
        end else if (spi_clock_div == 7) begin
            spi_byte <= {spi_byte[6:0], spi_in};
            spi_count <= spi_count + 1;
        end
    end
end

assign radio_sck = spi_clock;
assign radio_mosi = spi_byte[7];

// Interrupts
reg last_gdo2 = 0;
reg last_gdo0 = 0;
reg gdo2_sync = 0;
reg gdo0_sync = 0;
reg gdo2_interrupt = 0;
reg gdo0_interrupt = 0;
wire interrupt_write = (write_edge && address_sync == 8'h11);
always @(posedge clk) begin
    if (interrupt_write == 1 && data_sync[1] == 1) begin
        gdo2_interrupt <= 0;
    end else if (last_gdo2 == 0 && gdo2_sync == 1) begin
        gdo2_interrupt <= 1;
    end
    
    if (interrupt_write == 1 && data_sync[0] == 1) begin
        gdo0_interrupt <= 0;
    end else if (last_gdo0 == 0 && gdo0_sync == 1) begin
        gdo0_interrupt <= 1;
    end
    
    gdo0_sync <= radio_gdo0;
    gdo2_sync <= radio_gdo2;
    
    last_gdo2 <= gdo2_sync;
    last_gdo0 <= gdo0_sync;
end

// PWM clock divider
parameter pwm_period = 5;
reg [2:0] pwm_divider = 0;
reg pwm_clk = 0;
always @(posedge clk) begin
    if (pwm_divider == pwm_period) begin
        pwm_clk <= 1;
        pwm_divider <= 0;
    end else begin
        pwm_clk <= 0;
        pwm_divider <= pwm_divider + 1;
    end
end

// Connect motor signals to nets with names that match the schematic
wire [2:0] hall_1;
wire [2:0] hall_2;
wire [2:0] hall_3;
wire [2:0] hall_4;
wire [2:0] hall_5;

wire [5:0] motor_1;
wire [5:0] motor_2;
wire [5:0] motor_3;
wire [5:0] motor_4;
wire [5:0] motor_5;

// The connector for motor 2 is (top to bottom) hall C, B, A.
// The motor is (top to bottom) 3, 1, 2.

assign hall_1 = {m1hall_b, m1hall_a, m1hall_c};
assign hall_2 = {m2hall_b, m2hall_a, m2hall_c};
assign hall_3 = {m3hall_b, m3hall_a, m3hall_c};
assign hall_4 = {m4hall_b, m4hall_a, m4hall_c};
assign hall_5 = {m5hall_a, m5hall_b, m5hall_c};

// The motors are wired kinda randomly.

assign m1c_h = motor_1[5];
assign m1c_l = motor_1[4];
assign m1b_h = motor_1[3];
assign m1b_l = motor_1[2];
assign m1a_h = motor_1[1];
assign m1a_l = motor_1[0];

assign m2b_h = motor_2[5];
assign m2b_l = motor_2[4];
assign m2c_h = motor_2[3];
assign m2c_l = motor_2[2];
assign m2a_h = motor_2[1];
assign m2a_l = motor_2[0];

assign m3b_h = motor_3[5];
assign m3b_l = motor_3[4];
assign m3c_h = motor_3[3];
assign m3c_l = motor_3[2];
assign m3a_h = motor_3[1];
assign m3a_l = motor_3[0];

assign m4a_h = motor_4[5];
assign m4a_l = motor_4[4];
assign m4c_h = motor_4[3];
assign m4c_l = motor_4[2];
assign m4b_h = motor_4[1];
assign m4b_l = motor_4[0];

assign m5a_h = motor_5[5];
assign m5a_l = motor_5[4];
assign m5b_h = motor_5[3];
assign m5b_l = motor_5[2];
assign m5c_h = motor_5[1];
assign m5c_l = motor_5[0];

// Motor drivers
wire set_pwm_0 = (write_edge && address_sync == 8'h00);
wire set_pwm_1 = (write_edge && address_sync == 8'h01);
wire set_pwm_2 = (write_edge && address_sync == 8'h02);
wire set_pwm_3 = (write_edge && address_sync == 8'h03);
wire set_pwm_4 = (write_edge && address_sync == 8'h04);

wire [7:0] hall_count_1;
wire [7:0] hall_count_2;
wire [7:0] hall_count_3;
wire [7:0] hall_count_4;
wire [7:0] hall_count_5;

wire [5:1] fault_detect;

motor md_1(clk, pwm_clk, set_pwm_0, data_sync, hall_1, motor_1, hall_count_1, fault_detect[1]);
motor md_2(clk, pwm_clk, set_pwm_1, data_sync, hall_2, motor_2, hall_count_2, fault_detect[2]);
motor md_3(clk, pwm_clk, set_pwm_2, data_sync, hall_3, motor_3, hall_count_3, fault_detect[3]);
motor md_4(clk, pwm_clk, set_pwm_3, data_sync, hall_4, motor_4, hall_count_4, fault_detect[4]);
motor md_5(clk, pwm_clk, set_pwm_4, data_sync, hall_5, motor_5, hall_count_5, fault_detect[5]);

// Fault register
reg [5:1] fault = 0;
always @(posedge clk) begin
    if (write_edge && address_sync == 8'h08) begin
        // Clear given faults
        fault <= fault_detect | (fault & ~data_sync[4:0]);
    end else begin
        // Latch new faults
        fault <= fault_detect | fault;
    end
end

// Encoders
wire [15:0] encoder_1;
wire [15:0] encoder_2;
wire [15:0] encoder_3;
wire [15:0] encoder_4;

wire enc1a = rx_ssclk;
wire enc1b = rx_ssdata;
wire enc2a = rx_pdn;
wire enc2b = rx_radio;
wire enc3a = bl3;
wire enc3b = bl2;
wire enc4a = bl1;
wire enc4b = bl0;

encoder counter1(clk, {enc1a, enc1b}, encoder_1);
encoder counter2(clk, {enc2a, enc2b}, encoder_2);
encoder counter3(clk, {enc3a, enc3b}, encoder_3);
encoder counter4(clk, {enc4a, enc4b}, encoder_4);

// Latch all encoders together
reg [15:0] encoder_latch_1 = 0;
reg [15:0] encoder_latch_2 = 0;
reg [15:0] encoder_latch_3 = 0;
reg [15:0] encoder_latch_4 = 0;

always @(posedge clk) begin
    if (write_edge && address_sync == 8'h30) begin
        encoder_latch_1 <= encoder_1;
        encoder_latch_2 <= encoder_2;
        encoder_latch_3 <= encoder_3;
        encoder_latch_4 <= encoder_4;
    end
end

// Button synchronization for firing kicker manually
reg charge_override = 0;
reg button_sync = 0;
always @(posedge clk) begin
    button_sync <= ~button;
    
    if (button_sync) begin
        charge_override <= 1;
    end
end

// LED flashing
reg [20:0] count = 0;
always @(posedge clk) begin
    count <= count + 1;
end

// Kicker
reg charge_enable = 0;
reg kick_select = 0;
wire write_kick = (write_edge && address_sync == 8'h20);
wire lockout;
wire [7:0] kicker_status = {2'b00, kick_select, charge_override, charge_enable, charge, lockout, ~charge_done};

assign led0 = ~kick;
assign led1 = (~charge | count[20]) & charge_done;

wire kick_write = write_kick;
wire [7:0] kick_strength = data_sync;

always @(posedge clk) begin
    if (write_edge && address_sync == 8'h21) begin
        kick_select <= data_sync[5];
        charge_enable <= data_sync[3];
    end
end

wire kick_pulse;
kicker kicker(clk, button_sync, kick_write, kick_strength, charge_enable & ~charge_override, charge, kick_pulse, lockout);

// Send the kick pulse to either the kicker or the chipper
assign kick = kick_pulse && (kick_select == 0);
assign chip = kick_pulse && (kick_select == 1);

// Switch/button status
wire [7:0] switch_read = {3'b000, ~button, ~switch[3], ~switch[2], ~switch[1], ~switch[0]};

assign data_out =
    (address_sync == 8'h00) ? hall_count_1 :
    (address_sync == 8'h01) ? hall_count_2 :
    (address_sync == 8'h02) ? hall_count_3 :
    (address_sync == 8'h03) ? hall_count_4 :
    (address_sync == 8'h04) ? hall_count_5 :
    (address_sync == 8'h08) ? {3'b000, fault} :
    (address_sync == 8'h10) ? spi_byte :
    (address_sync == 8'h11) ? {6'b000000, gdo2_interrupt, gdo0_interrupt} :
    (address_sync == 8'h12) ? {4'b0000, spi_idle, radio_gdo2, radio_gdo0, radio_select} :
    (address_sync == 8'h13) ? switch_read :
    (address_sync == 8'h21) ? kicker_status :
    (address_sync == 8'h30) ? encoder_latch_1[7:0] :
    (address_sync == 8'h31) ? encoder_latch_1[15:8] :
    (address_sync == 8'h32) ? encoder_latch_2[7:0] :
    (address_sync == 8'h33) ? encoder_latch_2[15:8] :
    (address_sync == 8'h34) ? encoder_latch_3[7:0] :
    (address_sync == 8'h35) ? encoder_latch_3[15:8] :
    (address_sync == 8'h36) ? encoder_latch_4[7:0] :
    (address_sync == 8'h37) ? encoder_latch_4[15:8] :
    (address_sync == 8'hff) ? test :
    8'hc9;      // Unused addresses read this value

endmodule
