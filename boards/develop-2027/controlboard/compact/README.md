# Compact board set (ControlBoard2027_C4L2 + 30 x 40 radio)

The compact set is the active 2027 robot electronics design: a 120 x 60 mm controlboard with an STM32H723 and a
30 x 40 mm ESP32-C5 radio that plugs straight onto it. It replaces the prototype set in `../prototype/` (kept for
reference only); every difference is listed in [docs/PROTOTYPE_TO_COMPACT.md](docs/PROTOTYPE_TO_COMPACT.md).

**The controlboard being built is ControlBoard2027_C4L2.** ControlBoard2027_C (6 layers) and ControlBoard2027_C4L
(the first 4-layer copy) are earlier iterations of the same circuit, kept for reference in `archive/`.

| Board | Folder | Size, layers | Main parts |
|---|---|---|---|
| **ControlBoard2027_C4L2** | [ControlBoard2027_C4L2/](ControlBoard2027_C4L2/) | 120 x 60 mm, 4 layers, JLC04161H-3313 1.6 mm | the board being built; same circuit as the C with the connector groups re-placed and most MCU pins moved (PROTOTYPE_TO_COMPACT.md §1.8) |
| ControlBoard2027_C (archived) | [archive/ControlBoard2027_C/](archive/ControlBoard2027_C/) | 120 x 60 mm, 6 layers, JLC06161H-3313E 1.6 mm | STM32H723ZGT6, LSM6DSV320X IMU, microSD, USB-C, 4 motor + dribbler SPI ports, kicker / expansion I2C, powerboard input, DotStar LEDs, OLED socket |
| RadioBoard2027_C_Inboard | [RadioBoard2027_C_Inboard/](RadioBoard2027_C_Inboard/) | 30 x 40 mm, 4 layers, JLC04161H-3313 1.6 mm | ESP32-C5-WROOM-1U, USB-C, power mux + supervisor |
| RadioBoard2027_C_Overhang | [RadioBoard2027_C_Overhang/](RadioBoard2027_C_Overhang/) | 30 x 40 mm, 4 layers, JLC04161H-3313 1.6 mm | same circuit as Inboard |

## Which files are authoritative

1. The KiCad files in each board folder (`.kicad_sch`, `.kicad_pcb`, `.kicad_dru`, `lib/`, `footprints/`). They
   always win.
2. The documents below, which were checked against those files on 2026-11-07; the C4L2 and radio content was
   re-checked on 2026-11-21.

Positions in all documents are in mm from the top-left corner of the board's own outline, x right, y down. In the
board files that corner is at (49.475, 49.475) on the controlboard and (97.0, 100.0) on the radios.

| Document | For | Content |
|---|---|---|
| [docs/INTERFACE.md](docs/INTERFACE.md) | everyone | J9 / J2 board-to-board pin table, mating rule, positions, standoffs, stack height, keep-outs, link timing; controlboard external connector pinouts and what mating boards must use |
| [docs/FIRMWARE.md](docs/FIRMWARE.md) | firmware | STM32 and ESP32-C5 pin maps, clocks, GPIO speed rules, IMU orientation, power switchover, bring-up checklist |
| [docs/PROTOTYPE_TO_COMPACT.md](docs/PROTOTYPE_TO_COMPACT.md) | reviewers, firmware | every change from the prototype, part by part, with reasons |
| [ControlBoard2027_C4L2/README_BEFORE_ORDERING.md](ControlBoard2027_C4L2/README_BEFORE_ORDERING.md) | whoever orders | checklist and sign-off before the C4L2 order |
| [ControlBoard2027_C4L2/DESIGN_NOTES.md](ControlBoard2027_C4L2/DESIGN_NOTES.md), [TODO.txt](ControlBoard2027_C4L2/TODO.txt) | reviewers | controlboard design reasoning, stackup, lengths, rules, deviations, audits; open items |
| [archive/ControlBoard2027_C/DESIGN_NOTES.md](archive/ControlBoard2027_C/DESIGN_NOTES.md), [archive/ControlBoard2027_C4L/DESIGN_NOTES.md](archive/ControlBoard2027_C4L/DESIGN_NOTES.md) | reference | the earlier 6-layer and first 4-layer controlboards (archived) |
| [datasheets/](datasheets/) (sources: [../prototype/ControlBoard2027/datasheets/SOURCES.md](../prototype/ControlBoard2027/datasheets/SOURCES.md)) | everyone | local datasheet copies the designs were checked against |
| [RadioBoard2027_C_Inboard/DESIGN_NOTES.md](RadioBoard2027_C_Inboard/DESIGN_NOTES.md), [TODO.txt](RadioBoard2027_C_Inboard/TODO.txt) | reviewers | Inboard radio design notes; open items |
| [RadioBoard2027_C_Overhang/DESIGN_NOTES.md](RadioBoard2027_C_Overhang/DESIGN_NOTES.md), [TODO.txt](RadioBoard2027_C_Overhang/TODO.txt) | reviewers | Overhang radio design notes; open items |

Diagrams:
- [RadioBoard2027_C_Inboard/docs/board_map.svg](RadioBoard2027_C_Inboard/docs/board_map.svg) and
  [RadioBoard2027_C_Overhang/docs/board_map.svg](RadioBoard2027_C_Overhang/docs/board_map.svg): radio buttons, LEDs,
  USB, test pads and the J2 pin map.

## BOM

The bills of materials are in each board's `bom/` folder: [ControlBoard2027_C4L2/bom/](ControlBoard2027_C4L2/bom/),
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
| `docs/` | set-level documents (INTERFACE, FIRMWARE, PROTOTYPE_TO_COMPACT) |
| `datasheets/` | datasheet PDFs for all compact boards (copied from `../prototype/ControlBoard2027/datasheets/` on 2026-11-21; download sources in that folder's `SOURCES.md`) |
| `ControlBoard2027_C4L2/` | controlboard being built: KiCad project, `DESIGN_NOTES.md`, `TODO.txt`, `README_BEFORE_ORDERING.md`, `bom/`, `mechanical/`, `lib/`, `footprints/` |
| `archive/` | earlier controlboard iterations, kept for reference: `ControlBoard2027_C/` (6 layers) and `ControlBoard2027_C4L/` (first 4-layer copy). Not maintained; their relative links point to their old location |
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

## Status (2026-11-07; C4L2 and radios re-checked 2026-11-21)

All boards are placed and routed. Checks on the saved repo files (kicad-cli, schematic parity on):

| Board | DRC errors | Unconnected | Parity | DRC warnings | ERC |
|---|---|---|---|---|---|
| ControlBoard2027_C4L2 (2026-11-21, zones refilled) | 0 | 0 | 0 | 15, all intended: 6 courtyard (J13 OLED module over J1 / J2 / U3 / D1 / F1, J9 / U2), 2 NPTH in courtyard (J2 under J13), 7 silk overlap (C4L2 DESIGN_NOTES §1) | 1 error, intended: U2 VCAP pins 71 / 106 tied |
| ControlBoard2027_C (2026-11-07, reference) | 0 | 0 | 0 | 13, all intended: 11 courtyard overlaps (J9 / U2 margin 0.02 mm; ten low parts under the raised OLED module J13) and 2 J2 locating holes under J13 | 1 error, intended: U2 VCAP pins 71 / 106 tied (power output to power output) |
| RadioBoard2027_C_Inboard | 0 | 0 | 0 | 0 | 0 |
| RadioBoard2027_C_Overhang | 0 | 0 | 0 | 0 | 0 |

Matched groups (re-measured with the length scripts on the saved boards):

| Group | Result |
|---|---|
| C4L2 radio SPI1 (to J9) | SCK 15.200, MOSI 15.400, MISO 15.481, CS 14.478 mm (within 1 mm of SCK) |
| C4L2 SDMMC2 | 67.07-67.65 mm, CK 67.16 mm (pin to pin, independent audit 2026-11-20) |
| CB radio SPI3 (to J9), ControlBoard2027_C | 14.860-14.861 mm |
| CB SDMMC2, ControlBoard2027_C | 62.231-62.496 mm (D1 +0.264 mm, within 1 mm) |
| CB motor SPI1 / SPI2 / dribbler SPI4, LED SPI6, ControlBoard2027_C | each connector within 0.001 mm, except J6 MOSI -0.222 mm |
| CB USB, ControlBoard2027_C | 0.000 mm skew in both plug orientations |
| Radio link SCK / MOSI / MISO / CS | Inboard 19.934 mm, Overhang 14.079 mm, spread 0.000 mm |
| Radio USB | see the variant table above |

Each board's independent adversarial audits are summarised in the Review history appendix of its DESIGN_NOTES. The
pre-fabrication audit of the C4L2 and both radios (2026-11-20) found no open critical item; its summary is in C4L2
DESIGN_NOTES §1 and the radio TODOs.

### Open before ordering

Details and the full lists are in each board's TODO.txt.

- **All boards:** confirm the impedance widths in JLC's calculator and order with impedance control; independent
  re-audit of the last changed areas (CB back-edge connectors and audit fixes; Overhang USB-skew changes; Inboard
  after any further change), then refill zones, DRC with parity, ERC and the length scripts again; generate the
  placement files (the BOMs exist, see above); re-check stock (LSHM C3643542 is the limiting JLCPCB part); parts not
  stocked at JLCPCB must be sourced separately (radios: U1, hand-soldered, and ANT1; every CB part is JLC-assembled).
- **Controlboard:** agree J15 (powerboard), J10 (kicker) and J11 / J12 (expansion) pinouts with the mating boards; J4-J8 are
  settled (drive motors on a reversed GH cable, dribbler straight, INTERFACE.md); choose the OLED module; confirm the DotStar footprint (top-view drawing).
- **Radios:** decide the antenna (FXP831 5 GHz gain above the module's certified gain; Inboard WROOM-1 fallback sits
  over CB copper); keep the CB +3V3 load at about 0.8 A or less including the radio and measure +3V3 at J9 during TX
  (radio TODO 1.0); the radio USB-C is probably blocked by the speaker board (radio TODO 1.0a); fab notes for tented and plugged vias and the J2 paste-in-hole stencil; check the TPD4E05U06 land
  pattern against TI's drawing.

Fabrication outputs (gerbers, CPL) are not generated for the compact set; the BOMs are in each board's `bom/`.

## Interface rule

J9 / J2 and the standoff holes are shared by three projects. Change them in all three together and re-run the
mating check; see [docs/INTERFACE.md](docs/INTERFACE.md) §6.
