# Style Guide

## Schematic Style
* Always snap to 0.1 inch grid
* Insert appropriate size frame for each sheet
    * Set Global Attributes for `REVISION` and `TEAM`
    * Set Attribute of frame for `SCH_DESC`

## Board Style
* Attempt to keep snapped to 0.5 mm (with 0.25 alt) with 90º or 45º angles

## Library Style
#### Symbol
* Always keep pins aligned to 0.1 inch grid
* Add Name and Value on correct layers

#### Package
* Add Name and Value on correct layers
* Silkscreen on `TPLACE` should not go over pad
* Use `TDOCU` to show accurate package outline

#### Device
* Final Device ideally be actual part number unless generic part where many possibles could be used
* Use wildcard when using multiple packages with one symbol
* Add correct prefix for component type ([reference](https://en.wikipedia.org/wiki/Reference_designator)), common components:
    * C : Capacitor
    * L : Inductor
    * R : Resistor
    * D : Diodes (including LEDs)
    * J : Jack (least movable part of connector)
    * Q : Transistor
    * F : Fuse
* Add manufacturer part number and (when possible) Digikey part number as attributes `MPN` and `DIGIKEY` respectivly
    * Do this for each technology and variant combination

# Finalize Board

When board completely done and ready to order ensure the following are completed:
* Board folder named "board-name"-v"version"
* Export board to PNG and place in folder
* Create README.md with description of the board and PNG of the board
* Create gerber.zip file of all Gerber files to be sent to board fab
* After all items added for board, make final commit for board version and tag commit as "board-name"-v"version"
* Once pushed to Github create release of board from tag consisting of list of changes from past version, link to gerber.zip (Github raw link for that tag), and PNG of board
    * For prototypes mark release as pre-release