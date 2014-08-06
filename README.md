RoboCup PCB Repository
===========

Welcome to the Georgia Tech RoboJackets repository for storing development PCB files. Most CAD files found here are [EAGLE](http://www.cadsoftusa.com/) files. Users will find the following items:
- Control, Kicker, Antenna, and Base Station files
- RoboCup libraries
- CAM Jobs (for exporting gerber files)
- Gerber files for most PCB designs

The current version of EAGLE CAD used by the team is *version 6.5.0*.

###Configuring EAGLE for the first time

If this is your first time opening any of RoboJackets' EAGLE files, you will need to setup your computer to include the part's libraries. The RoboCup finds that the
*[Adafruit library](https://github.com/adafruit/Adafruit-Eagle-Library)* 
and 
*[Sparkfun libraries](https://github.com/sparkfun/SparkFun-Eagle-Libraries)* for EAGLE CAD 
contain many useful components. Luckly, all of the files can be found on GitHub.

####Downloading the libraries
Once your computer is setup with git, the following lines can be used on any operating system with a git terminal.

```
git clone https://github.com/sparkfun/SparkFun-Eagle-Libraries
git clone https://github.com/adafruit/Adafruit-Eagle-Library
```
####Importing the libraries into EAGLE

####Setting options in EAGLE
