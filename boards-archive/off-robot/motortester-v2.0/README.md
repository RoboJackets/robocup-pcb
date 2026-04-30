# Motor Tester Board v2.0

This board serves as a proof of concept (PoC) for the design of control board v4.0

## Components

The main components contained in this board are:

- Xilinx Spartan 7 25T FPGA
- QSPI Flash Memory
- CMOS Clock
- USB/JTAG/UART Interface
- 18.5V, 5V, 3.3V, 1.8V, 1.0V Voltage Levels
- 3 Phase Motor Driver

### FPGA

This is the main controller that coordinates the 5 different motor drivers.
It interfaces the main microcontroller via SPI and controls the 3 phase gate drivers.

The CMOS clock is connected directly to the FPGA as the sys_clk.

### QSPI Flash Memory

Non-volatile memory to store the config files for the FPGA. FPGA should be bootable from flash on reset.

### USB Interface

Allows to program the FPGA and QSPI Flash without the need of a debug probe. This is done using Xilinv Vivado.

### Voltage Levels

The FPGA board allows for different voltage levels on each IO Bank.

- The FPGA logic fabric uses 1.0V
- IOBANKs use 3.3V

Aside from the FPGA, the motor drivers require direct battery voltage, 18.5V (nominal) for the
motor current, and 5V to operate the gate driver IC.

The microcontroller also requires a 5V supply to be powered.

### Motor Driver

This is a 3 Phase BLDC motor driver.
(I'll list down the specifics of this later).
