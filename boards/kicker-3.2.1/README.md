# Kicker Board
On Robot Board 

# Objective 
Board responsible for kicking and chipping functions of bot 

# Details 
- Very high power board, as a lot of power is needed for charging the solenoid.
- Has discharge lines for both kicking and chipping functions, two types of passes for the bot.
- Due to the high power, board setup is designed to protect against voltage spikes, surges and other irregularities.
- A microcontroller is present to handle both manual inputs and control board inputs governing functionality.
- This board interfaces with the breakbeam board to determine if the bot is in possession of the ball.
- Has LEDs to determine if the board is functioning properly, as well as manual switches to test certain functions.
- Charges a bank of capacitors to a high voltage and discharges into solenoid(s).
# For Debugging - directly with hardware 
- Flipping debug swithc before powering board 
- 3 switches: charge, kick, chip that send physical interrupts to use when debugging and testing safety/reliability 
- Charge switch: charges capacitor 
- To perform action, hold down charge switch until charging LEDs are all on, indicating fully charged capacitors 
- Once fully charged, test hardware with kick and chip switches 
## Note
- 2 Safety LEDs: one indicates whether capacitor is charged, other indicates incorrect charging/hardware fault 
- After turning robot off, wait until AUTO DISCHG LED is off before handling robot (picking it up, moving it) 

## PNG 

Kicker Safety 
![kicker_labels](https://user-images.githubusercontent.com/71445563/125146954-adf4a480-e0f6-11eb-99cd-e115d1938803.png)

Real Kicker (see AUTO DISCHG LED) 
![realkicker](https://user-images.githubusercontent.com/71445563/125146970-c06ede00-e0f6-11eb-8e5c-98b06210bc44.jpg)

![Kicker Board](./kicker.png)
