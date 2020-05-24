<img src="https://dl.dropboxusercontent.com/s/ao3pe3n8npuxrfo/robobuzz-header.svg" height="100px" width="100px" style="float:left"/>RoboCup PCB Repository
===========
Welcome to the Georgia Tech RoboJackets repository for management and storage of RoboCup's hardware files! Additional information about the team and current projects can be found on the [RoboJackets Website](http://www.robojackets.org/teams/robocup/) and the [RoboJacket Wiki](http://wiki.robojackets.org/w/RoboCup).

If you are a new member to the RoboCup electrical team and have never used *[git version control](http://git-scm.com/)* before, we highly recommend that you familiarize yourself with it by reading [this guide](https://github.com/RoboJackets/robocup-firmware/blob/master/doc/Git.md).

## Sponsor Thank You!
- Maxon (discount of EC45 and EC16 motors)
- PCBWay (donation of PCB fabrication runs)
- Texas Instruments (donation of ICs and SBCs)

## Prerequisites
- A computer configured with git [[Windows](https://windows.github.com)] [[Mac](https://mac.github.com/)]
- An installation of [EAGLE](http://www.cadsoftusa.com/)

## Using this Repository
Most CAD files found here are [EAGLE](http://www.cadsoftusa.com/) files. However, very few older archived files were created using [PCB](http://pcb.geda-project.org) (a program that is part of the [gEDA project](http://www.geda-project.org)). Users will find the following items here:
- Control, Kicker, and Radio files
- RoboCup libraries
- DRU rulesets (for checking for errors)


### Setup libraries in EAGLE

1. Downloading the libraries

	Once your computer is setup with git, the following lines can be used on any operating system within a *[terminal](http://en.wikipedia.org/wiki/Computer_terminal)* configured with git. Users who are using a GUI interface for git should simply add the respective repositories through the interface.

	```
    # Download the initial files
	git clone https://github.com/robojackets/robocup-pcb

    # Go into our new directory
    cd robocup-pcb

    # Download additional mtrain pcbs
    git submodule update --init
	```

2. Add the new directory locations to EAGLE:

	From EAGLE's Control Panel, navigate to the *Directories* window: *Options -> Directories*.

    Find the *Libraries* text box, and add the directory paths where the repositories were cloned from step 1. Don't forget to also include the path for the *[RoboJackets libraries](https://github.com/RoboJackets/robocup-pcb/tree/master/lib)*!

### Updating Repository

	# Check which files will removed
	git clean -d -x -n

	# After being sure which files are deleted
	git clean -d -x -f

	# Download additional mtrain pcbs
	git submodule update --init

## License

This project is licensed under the Apache License v2.0.  See the [LICENSE](LICENSE) file for more information.
