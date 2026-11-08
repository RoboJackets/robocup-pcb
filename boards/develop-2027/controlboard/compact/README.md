# Compact board set (ControlBoard2027_C + 30 x 40 radio)

The compact set is the active 2027 robot electronics design: a 120 x 60 mm controlboard with an STM32H723 and a
30 x 40 mm ESP32-C5 radio that plugs straight onto it. It replaces the prototype set in `../prototype/` (kept for
reference only); every difference is listed in [docs/PROTOTYPE_TO_COMPACT.md](docs/PROTOTYPE_TO_COMPACT.md).

| Board | Folder | Size, layers | Main parts |
|---|---|---|---|
| ControlBoard2027_C | [ControlBoard2027_C/](ControlBoard2027_C/) | 120 x 60 mm, 6 layers, JLC06161H-3313E 1.6 mm | STM32H723ZGT6, LSM6DSV320X IMU, microSD, USB-C, 4 motor + dribbler SPI ports, kicker / expansion I2C, powerboard input, DotStar LEDs, OLED socket |
| RadioBoard2027_C_Inboard | [RadioBoard2027_C_Inboard/](RadioBoard2027_C_Inboard/) | 30 x 40 mm, 4 layers, JLC04161H-3313 1.6 mm | ESP32-C5-WROOM-1U, USB-C, power mux + supervisor |
| RadioBoard2027_C_Overhang | [RadioBoard2027_C_Overhang/](RadioBoard2027_C_Overhang/) | 30 x 40 mm, 4 layers, JLC04161H-3313 1.6 mm | same circuit as Inboard |

## Which files are authoritative

1. The KiCad files in each board folder (`.kicad_sch`, `.kicad_pcb`, `.kicad_dru`, `lib/`, `footprints/`). They
   always win.
2. The documents below, which were checked against those files on 2026-11-07.

Positions in all documents are in mm from the top-left corner of the board's own outline, x right, y down. In the
board files that corner is at (49.475, 49.475) on the controlboard and (97.0, 100.0) on the radios.

| Document | For | Content |
|---|---|---|
| [docs/INTERFACE.md](docs/INTERFACE.md) | everyone | J9 / J2 board-to-board pin table, mating rule, positions, standoffs, stack height, keep-outs, link timing; controlboard external connector pinouts and what mating boards must use |
| [docs/FIRMWARE.md](docs/FIRMWARE.md) | firmware | STM32 and ESP32-C5 pin maps, clocks, GPIO speed rules, IMU orientation, power switchover, bring-up checklist |
| [docs/PROTOTYPE_TO_COMPACT.md](docs/PROTOTYPE_TO_COMPACT.md) | reviewers, firmware | every change from the prototype, part by part, with reasons |
| [ControlBoard2027_C/DESIGN_NOTES.md](ControlBoard2027_C/DESIGN_NOTES.md), [TODO.txt](ControlBoard2027_C/TODO.txt) | reviewers | controlboard design reasoning, stackup, lengths, rules, deviations; open items |
| [RadioBoard2027_C_Inboard/DESIGN_NOTES.md](RadioBoard2027_C_Inboard/DESIGN_NOTES.md), [TODO.txt](RadioBoard2027_C_Inboard/TODO.txt) | reviewers | Inboard radio design notes; open items |
| [RadioBoard2027_C_Overhang/DESIGN_NOTES.md](RadioBoard2027_C_Overhang/DESIGN_NOTES.md), [TODO.txt](RadioBoard2027_C_Overhang/TODO.txt) | reviewers | Overhang radio design notes; open items |

Diagrams:
- [docs/img/interface_stack.svg](docs/img/interface_stack.svg): the set from above, connectors, J9 pin map, stack;
- [docs/img/cb_compact_layout_top.svg](docs/img/cb_compact_layout_top.svg) and
  [docs/img/cb_compact_layout_bottom.svg](docs/img/cb_compact_layout_bottom.svg): controlboard placement by function;
- [RadioBoard2027_C_Inboard/docs/board_map.svg](RadioBoard2027_C_Inboard/docs/board_map.svg) and
  [RadioBoard2027_C_Overhang/docs/board_map.svg](RadioBoard2027_C_Overhang/docs/board_map.svg): radio buttons, LEDs,
  USB, test pads and the J2 pin map.

## BOM

The bills of materials are in each board's `bom/` folder: [ControlBoard2027_C/bom/](ControlBoard2027_C/bom/),
[RadioBoard2027_C_Inboard/bom/](RadioBoard2027_C_Inboard/bom/) and
[RadioBoard2027_C_Overhang/bom/](RadioBoard2027_C_Overhang/bom/). Each folder has a full BOM with sourcing and stock,
the JLCPCB upload file, a list of the parts to order separately (Digi-Key / Mouser), and a README with the stock date,
board-set limits, substitutions and open issues. The JLCPCB upload file is generated from the schematic fields.
The LDOs (CB U7, radio U4) are Microchip MCP1826S-3302E/DB (the AP7361C-33E-13 was out of stock everywhere on
2026-11-07). The LSHM mezzanine (CB J9, radio J2) is JLCPCB-assembled as C3643542: 37 at JLCPCB on 2026-11-07, two
per board set, so 18 board sets.

## Folder map

| Path | Content |
|---|---|
| `README.md` | this file |
| `docs/` | set-level documents; `docs/img/` their SVG diagrams |
| `ControlBoard2027_C/` | controlboard KiCad project, `DESIGN_NOTES.md`, `TODO.txt`, `lib/`, `footprints/` |
| `RadioBoard2027_C_Inboard/` | Inboard radio KiCad project, `DESIGN_NOTES.md`, `TODO.txt`, `docs/board_map.svg`, `lib/` |
| `RadioBoard2027_C_Overhang/` | Overhang radio KiCad project, `DESIGN_NOTES.md`, `TODO.txt`, `docs/board_map.svg`, `lib/` |

## The two radio variants

Both radios have the same schematic (identical netlists), the same outline, the same J2 position and pinout and the
same standoff holes, so either one fits the same controlboard. Both accept the ESP32-C5-WROOM-1U (primary build,
u.FL connector with an external antenna) and the ESP32-C5-WROOM-1 (fallback, PCB antenna) on one dual footprint.
They differ only in where the module sits, which matters only for a WROOM-1 build:

| | Inboard | Overhang |
|---|---|---|
| Module position | (19.85, 17.9), antenna end 1 mm inside the north edge | (19.85, 11.5), antenna end past the north edge |
| WROOM-1 antenna | inside the radio outline, over the controlboard (CB x 46.1-66.1, y 0-7.5, where the CB has copper) | 5.45 mm past the radio and controlboard front edge (keep-out 6.4 mm) |
| Link length on the radio (matched) | 19.934 mm | 14.079 mm |
| USB pair skew | orientation B -0.001 mm, A +5.94 mm (about 40 ps; a both-orientation match does not fit beside SW2; negligible at Full Speed; one-orientation match accepted per the user's instruction) | -0.001 / +0.000 mm in both orientations |
| Buttons | RESET on the west edge, BOOT on the south edge | RESET and BOOT side by side near the south edge |

With the WROOM-1U both variants work the same. Pick the Overhang if a WROOM-1 build is likely and the robot has room
in front of the board; pick the Inboard if nothing may stick out.

## Status (2026-11-07)

All three boards are placed and routed. Checks on the saved repo files (kicad-cli, schematic parity on, zones as
saved):

| Board | DRC errors | Unconnected | Parity | DRC warnings | ERC |
|---|---|---|---|---|---|
| ControlBoard2027_C | 0 | 0 | 0 | 13, all intended: 11 courtyard overlaps (J9 / U2 margin 0.02 mm; ten low parts under the raised OLED module J13) and 2 J2 locating holes under J13 | 1 error, intended: U2 VCAP pins 71 / 106 tied (power output to power output) |
| RadioBoard2027_C_Inboard | 0 | 0 | 0 | 0 | 0 |
| RadioBoard2027_C_Overhang | 0 | 0 | 0 | 0 | 0 |

Matched groups (re-measured with the length scripts on the saved boards):

| Group | Result |
|---|---|
| CB radio SPI3 (to J9) | 14.860-14.861 mm |
| CB SDMMC2 | 62.231-62.496 mm (D1 +0.264 mm, within 1 mm) |
| CB motor SPI1 / SPI2 / dribbler SPI4, LED SPI6 | each connector within 0.001 mm, except J6 MOSI -0.222 mm |
| CB USB | 0.000 mm skew in both plug orientations |
| Radio link SCK / MOSI / MISO / CS | Inboard 19.934 mm, Overhang 14.079 mm, spread 0.000 mm |
| Radio USB | see the variant table above |

Each board's independent adversarial audits are summarised in the Review history appendix of its DESIGN_NOTES.

### Open before ordering

Details and the full lists are in each board's TODO.txt.

- **All boards:** confirm the impedance widths in JLC's calculator and order with impedance control; independent
  re-audit of the last changed areas (CB back-edge connectors and audit fixes; Overhang USB-skew changes; Inboard
  after any further change), then refill zones, DRC with parity, ERC and the length scripts again; generate the
  placement files (the BOMs exist, see above); re-check stock (LSHM C3643542 is the limiting JLCPCB part); parts not
  stocked at JLCPCB must be sourced and consigned (CB: D7-D11, U11; radios: U1, ANT1).
- **Controlboard:** agree J15 (powerboard), J10 (kicker) and J4-J8 (motor modules: their connector is still PH 8P)
  pinouts with the mating boards; choose the OLED module; confirm the DotStar footprint (top-view drawing).
- **Radios:** decide the antenna (FXP831 5 GHz gain above the module's certified gain; Inboard WROOM-1 fallback sits
  over CB copper); fab notes for tented and plugged vias and the J2 paste-in-hole stencil; check the TPD4E05U06 land
  pattern against TI's drawing.

Fabrication outputs (gerbers, CPL) are not generated for the compact set; the BOMs are in each board's `bom/`.

## Interface rule

J9 / J2 and the standoff holes are shared by three projects. Change them in all three together and re-run the
mating check; see [docs/INTERFACE.md](docs/INTERFACE.md) §6.
