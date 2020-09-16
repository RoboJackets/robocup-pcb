# Kicker Board

## Board responsible for kicking and chipping functions of bot.
#This is a very high power board, as a lot of power is needed for charging the solenoid
#Has discharge lines for both kicking and chipping functions, two types of passes for the bot
#Due to the high power, lots of the board setup is designed to protect against voltage spikes, surges and other irregularities
#A microcontroller is present to handle both manual inputs and control board inputs governing functionality
#A significant part of this board is that it has a breakbeam aspect. This board interfaces with the breakbeam board to determine if the bot is in possession of the ball.
#It's also important to note the debug features. This board is complex, and has LEDs to determine if the board is function, as well as manual switches to trigger certian functions
!KickerBoard](./kicker.png)
