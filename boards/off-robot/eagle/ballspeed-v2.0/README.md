# BallSpeed Board
Off robot board 

## Objective 
To be able to measure the velocity and deceleration of the robot's kick.

## Approach 
- Board supplies power to IR phototransistors. 
- Raspberry PI calculates the speed.
- Raspberry PI only takes in digital values, so an ADC is needed to convert the input analog signals into digital, and send on to Raspberry PI.  
- Raspberry PI is supplied by a 5V source. DC-DC converter is used to step down the 12V supply on the board to the needed 5V, and keep power supply stable. 
- Raspberry PI also supplies a 3.3V source that the rest of the circuit is connected to.  

## PNG 
![ballspeed](https://user-images.githubusercontent.com/71445563/123548993-1de94f00-d735-11eb-8374-33f9c099b5c2.PNG)
