RoboCup PCB Repository
===========

Welcome to the Georgia Tech RoboJackets repository for storing development PCB files. Most CAD files found here are [EAGLE](http://www.cadsoftusa.com/) files. Users will find the following items:
- Control, Kicker, Antenna, and Base Station files
- RoboCup libraries
- CAM Jobs (for exporting gerber files)
- Gerber files for most PCB designs

The current version of EAGLE CAD used by the team is *version 6.5.0*.

##Configuring EAGLE for the first time

If this is your first time opening any of RoboJackets' EAGLE files, you will need to setup your computer to include the part's libraries. The RoboCup finds that the
*[Adafruit library](https://github.com/adafruit/Adafruit-Eagle-Library)* 
and 
*[Sparkfun libraries](https://github.com/sparkfun/SparkFun-Eagle-Libraries)* for EAGLE CAD 
contain many useful components. Luckly, all of the files can be found on GitHub.

###Downloading the libraries
Once your computer is setup with git, the following lines can be used on any operating system with a git terminal.

```shell
git clone https://github.com/sparkfun/SparkFun-Eagle-Libraries
git clone https://github.com/adafruit/Adafruit-Eagle-Library
```
###Importing libraries into EAGLE


###Setting options in EAGLE
1. Set to always use vector fonts

##Firmware
Firmware must be uploaded to the control board before use. The firmware is written in C and defines how the hardware must interact with the higher-level software. The *[RoboJackets Wiki](http://wiki.robojackets.org)* contains basic information about *[compiling the firmware](http://wiki.robojackets.org/w/RoboCup_Compile_HOWTO)*. Instructions for uploading the firmware to a control board can be found below.
###Source Files
The current working set of firmware can be found in the *[robocup-software](https://github.com/RoboJackets/robocup-software)* repository in the *[firmware](https://github.com/RoboJackets/robocup-software/tree/master/firmware)* directory.
###Uploading the Firmware
Uploading firmware to a control board is a 2 step process.
```shell
$ scons robot-prog-samba
```
