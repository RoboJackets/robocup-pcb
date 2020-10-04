# BallSpeed Board

## Supplies power to IR phototransistors. Raspberry PI calculates the speed.
Raspberry PI only takes in digital values, so an ADC is needed to convert the  input analog signals into digital, and send on to Raspberry PI.
Raspberry PI is supplied by a 5V source. DC-DC converter is used to step down the 12V supply on the board to the needed 5V, and keep power supply stable.
Raspberry PI also supplies a 3.3V source that the rest of the circuit is connected to.
!BallSpeed Board](./ballspeed.png)

