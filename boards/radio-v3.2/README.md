# Radio Board
On Robot Board 

# Objective
Uses onboard bluetooth/wifi module to communicate with other robots. Most radio logic is handled on the chip. 

# Approach 
- Radio outputs are delivered to the connector, which allows the robot to interface with this board.  
- Radio is supplied by a 3.3V source. DC-DC converter is used to step down the 5V supply on the board to the needed 3.3V volts, and keep power supply stable.  
- RF components are very sensitive, ESD protection chips are needed to prevent damaging components with any built up static.  
- The radio firmware may need updates. In event of update, there is a JTAG programming port.  

## PNG 
![radio](https://user-images.githubusercontent.com/71445563/123549158-be3f7380-d735-11eb-9ac9-4ebb6022f54f.PNG)


