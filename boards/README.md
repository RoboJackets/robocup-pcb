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
* Silkscreen on TPLACE should not go over pad
* Use TDOCU to show accurate package outline

#### Device
* Final Device should be actual part number
* Use wildcard when using multiple packages with one symbol
* Add correct prefix for component type ([reference](https://en.wikipedia.org/wiki/Reference_designator)), common components:
    * C : Capacitor
    * L : Inductor
    * R : Resistor
    * D : Diodes (including LEDs)
    * J : Jack (least movable part of connector)
    * Q : Transistor
    * F : Fuse
