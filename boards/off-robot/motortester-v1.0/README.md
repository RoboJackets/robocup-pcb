# MotorTester Board
Off Robot Board

# Objective 
Simulate a 3 Phase Brushless Motor to connect to the control board, allowing us to test the motor functionality without blowing the motor. 

# Details 
- ATMega writes Hall sensor values (H1, H2, and H3) to the control board, which in turn responds with the proper voltages to the motor tester.  
- Voltages provided by the control board, either high (~18V), low (~0V) or float(somewhere in between), are stepped down by way of a voltage divider and the divided voltage is read in by the ATMega.  
- For each voltage, the ATMega checks to verify that it is correct, whether high, low, or float, for the given hall sensors, as given for the following table. 
 
## Hall Value/Voltage Level: 
001:10/  
101:1/0  
100:/10  
110:01/  
010:0/1  
011:/01  
These comparisons are made, and the LCD screen tells us if the motor is being supplied appropriately, to ensure it won't be blown.  

## PNG 
![motortester](https://user-images.githubusercontent.com/71445563/123549140-a831b300-d735-11eb-8211-bc8b042677b4.PNG)
