<img src="https://dl.dropboxusercontent.com/s/ao3pe3n8npuxrfo/robobuzz-header.svg" height="100px" width="100px" style="float:left"/>RoboCup PCB Repository
===========
Welcome to the Georgia Tech RoboJackets repository for management and storage of RoboCup's hardware files!

If you are a new member to the RoboCup electrical team, we highly encourage you to follow the tutorial 
[GETTING-STARTED.md](/GETTING-STARTED.md)
before continuing - especially if you are new to *[git version control](http://git-scm.com/)*.

##Prerequisites
- [Setting up git for the first time]()
- [Installing EAGLE]()

##Using this Repository
Most CAD files found here are [EAGLE](http://www.cadsoftusa.com/) files. Users will find the following items:
- Control, Kicker, Antenna, and Base Station files
- Gerber files for most PCB designs
- RoboCup libraries
- DRU rulesets (for checking for errors)
- CAM Jobs (for exporting gerber files)

**Note: The current version of EAGLE used by the team is *version 6.5.0*.**

##Configuring EAGLE for the first time
If this is your first time opening any of RoboJackets' EAGLE files, you will need to setup your computer to include the part's libraries. The RoboCup team finds that the
*[Adafruit library](https://github.com/adafruit/Adafruit-Eagle-Library)* 
and 
*[Sparkfun libraries](https://github.com/sparkfun/SparkFun-Eagle-Libraries)* for EAGLE contain many useful components. Luckly, all of the files can be found on GitHub.

###Setup libraries in EAGLE

1. Download the additional libraries:

	Once your computer is setup with git, the following lines can be used on any operating system within a *[terminal](http://en.wikipedia.org/wiki/Computer_terminal)* configured with git.
	
	```shell
	git clone https://github.com/sparkfun/SparkFun-Eagle-Libraries
	git clone https://github.com/adafruit/Adafruit-Eagle-Library
	``` 
2. Add the new directory locations to EAGLE:

	From EAGLE's Control Panel, navigate to the *Directories* window: *Options -> Directories*. 
    
    Find the *Libraries* text box, and add the directory paths where the repositories were cloned from step 1. Don't forget to also include the path for the *[RoboJackets libraries](https://github.com/jjones646/robocup-pcb/tree/master/parts-libraries)*!

###Setting the final options in EAGLE
1. Always use vector fonts:

	From the EAGLE control panel, go to *Options -> User Interface* and check the box labeled *'Always vector font'*. Figure 1 shows what the window should look like once completed.

	<table style='float: center; width: 330px'>
<tr><td><img style='width: 330px' src="https://lh3.googleusercontent.com/juI56MGbxDzvtQTgJoA8Cpsms7rpks8xTY7rcJyzZJbuQ4M6OqYmB9h5dTvo9pm4Rz9qZZxIa-I=w1342-h557"/>
</td></tr><tr><td>
Figure 1. Always using vector fonts ensures the final design exports correctly.
</td></tr>
</table>

##Testing designs with DRU rules

##Using the CAM jobs

##Firmware
Firmware must be uploaded to the control board before use. The firmware is written in C and defines how the hardware must interact with the higher-level software. The *[RoboJackets Wiki](http://wiki.robojackets.org)* contains basic information about *[compiling the firmware](http://wiki.robojackets.org/w/RoboCup_Compile_HOWTO)*. Instructions for uploading the firmware to a control board are below.

###Source Files
The current working set of firmware can be found in the *[robocup-software](https://github.com/RoboJackets/robocup-software)* repository within the *[firmware](https://github.com/RoboJackets/robocup-software/tree/master/firmware)* directory.

###Uploading Firmware to a Control Board
Uploading firmware to a control board is a 3-step process:

1. Place the microcontroller in *samba mode*

	1. Grab a control board and plug in a *charged battery*
    2. Place dip switch *#3* in the up position
    3. Power on the board with the main power switch
    4. Wait 10 seconds
    5. Power **off** the board
    6. Wait 2 seconds
    7. Power **on** the board
    8. The board is now in *samba mode*    
    
2. Upload firmware to the microcontroller's internal flash memory
```shell
$ scons robot-prog-samba
```
3. Upload firmware to the external memory chip
```shell
$ scons ~~robot-prog-fpga~~ **[UPDATE THIS]**
```



