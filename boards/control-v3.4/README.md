# Control Board
On Robot Board 

## Objective 
Regulates voltages, connects mTrain to other boards, user interface, hardware to enable motor control 

## Specifics of v3.4
IR connector, extra SPI connector, many improvements to be made

## Approach 
 - MTrain is our microcontroller, has three SPI buses which tie it to the FPGA, the radio, and then all other devices. 
 - AnalogIn is used to monitor battery voltage and input voltage  
 - Reset network reset MTrain if the 3.3V is low and the MTrain is high  
 - IO expander connects hex pins and DIP switches to MTrain for inputs into MTrain
 - FPGA handles all of the wheel drivers and the dribble driver, including the SPI interface to those motor drivers (AUX)
 - Handles hall sensors and writing three phase motor states.

## Control board has connectors for all of the different modules on the board, including:
IMU  
Kicker  
Radio  
Ball Speed (IR)  
I2C Module  
The SPI interfaces for each of these connectors is supplied by the MTrain and monitored by the Dot Star network

## The battery provides 18.5V, so the voltage regulation circuits also produce other voltage levels (5V and 3.3V) that other devices run off.
18.5V is only needed for the motors.  
There are also 1.2V and 2.5V lines, and when these are out of tolerance, error LEDs are activated

## Wheel Drive Module writes each of the three phases for the motor. Takes inputs of whether phase should be high and low, and uses outputs to write each phase
Phase is set that it can be high (shorted to 18V) low (shorted to ground) or float (some indeterminate phase in between).
## Dribbler Drive Module works very similarly
![Control Board](./control.png)
