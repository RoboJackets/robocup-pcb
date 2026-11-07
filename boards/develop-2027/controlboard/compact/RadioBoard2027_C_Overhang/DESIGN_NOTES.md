# RadioBoard2027_C_Overhang design notes

The schematic and the board file are the ground truth. This file describes the current design, why each choice
was made, how it was checked, and every known deviation from the house rules
([../../CLAUDE.md](../../CLAUDE.md)). Audit history is condensed in the appendix.

- Set overview, status and the difference between the two radio variants: [../README.md](../README.md).
- Board-to-board interface (J2 / J9 pin table, mating rule, positions, standoffs, stack height, keep-outs, link
  timing): [../docs/INTERFACE.md](../docs/INTERFACE.md).
- Firmware pin map, strapping, boot, USB, brownout and switchover behaviour, bench checks:
  [../docs/FIRMWARE.md](../docs/FIRMWARE.md).
- Changes from the prototype RadioBoard2027: [../docs/PROTOTYPE_TO_COMPACT.md](../docs/PROTOTYPE_TO_COMPACT.md).
- Bench map of the board (buttons, LEDs, USB, test pads, link pin map): [docs/board_map.svg](docs/board_map.svg).
- Open work: [TODO.txt](TODO.txt).

**Coordinates.** All positions in this file are in mm from the top-left corner of the board outline, x to the
right (east), y down (south). North (up) is the robot front. In the board file the outline corner is at
(97.0, 100.0), so file coordinates = these coordinates + (97.0, 100.0). The radio's top-left corner sits over
controlboard (36, 0) in the controlboard's own outline frame.

**Contents**

1. [Status](#1-status)
2. [Variant](#2-variant)
3. [Sources](#3-sources)
4. [Power](#4-power)
5. [ESP32-C5 module](#5-esp32-c5-module)
6. [USB](#6-usb)
7. [Controlboard link](#7-controlboard-link)
8. [PCB](#8-pcb)
9. [Deviations from the house rules](#9-deviations-from-the-house-rules)
10. [Open issues](#10-open-issues)
11. [BOM notes](#11-bom-notes)
- [Appendix A. Review history](#appendix-a-review-history)
- [Appendix B. Build and check scripts](#appendix-b-build-and-check-scripts)

---

## 1. Status

Checked on the saved repo files on 2026-11-07:

| Check | Result |
|---|---|
| DRC (kicad-cli, schematic parity on, all severities) | 0 errors, 0 warnings, 0 unconnected, 0 parity issues |
| ERC (all sheets, all severities) | 0 errors, 0 warnings |
| Link SPI length match (SCK, MOSI, MISO, CS) | 14.079 mm each, spread 0.000 mm (tolerance +-0.05 mm) |
| USB pair, per plug orientation | A: D- minus D+ -0.001 mm; B: +0.000 mm (rule 0.15 mm) |
| J2 against controlboard J9 (pad by pad, nets) | all 20 contacts coincide (0.000 mm) and carry matching nets |
| Netlist against the Inboard variant | identical (44 components, 48 nets, same values, footprints, BOM flags) |
| Custom rules compile and fire | proven with a deliberately violated test rule and test items (§8.8) |

Open before ordering: an independent re-audit of the USB-skew changes (the last layout change), the impedance check in
the JLC calculator, the antenna gain decision and the fab notes. See [TODO.txt](TODO.txt).

## 2. Variant

30 x 40 mm, 4 layers, 1.6 mm. The ESP32-C5 module U1 sits in the north-east corner, long axis north-south, at
(19.85, 11.5). In the WROOM-1 (fallback) build the module's PCB antenna sticks out **5.45 mm** past the radio's
north edge, which is also the controlboard's north edge (module outline y -5.45 to 22.15); the antenna keep-out
rule area extends 1 mm beyond that, to y -6.4. The WROOM-1U (primary build, U.FL and external antenna) has its body
fully on the board (y 0.9 to 22.15), and its antenna cable leaves north.

The Inboard variant has the same schematic and the same mechanical interface, but keeps the WROOM-1 antenna area
inside the board. Choosing between them: [../README.md](../README.md).

## 3. Sources

| Tag | Document |
|---|---|
| MOD | ESP32-C5-WROOM-1 / WROOM-1U datasheet v1.3 |
| CHIP | ESP32-C5 series datasheet v1.5 |
| HDG | Espressif ESP32-C5 hardware design guidelines v1.4 |
| EH | espressif/esp-hosted-mcu: `docs/getting-started-mcu.md`, `docs/design/`, co-processor and host Kconfig, `spi_slave_api.c`, `spi_drv.c` |
| SLVSFG1A | TI TPS2116 power mux |
| SNVSB03E | TI TPS3840 supervisor |
| TPD4E05U06 | TI TPD4E05U06 (DQA, USON-10) |
| TVS0500 | TI TVS0500 (D2, D5) |
| CDSOD323 | Bourns CDSOD323-TxxSC TVS series (D4), www.bourns.com/docs/product-datasheets/cdsod323-txxsc.pdf |
| DS37274 | Diodes AP7361C LDO |
| DS13313 | ST STM32H723 datasheet rev 4 (controlboard pins on the link) |
| MF-MSMF | Bourns MF-MSMF PTC, Rev BD 06/26 |
| LSHM | Samtec LSHM product specification (suddendocs.samtec.com/productspecs/lshm.pdf) |
| LSHM-FP | Samtec "Recommended PCB layout for LSHM-1XX-XX.X-X-DV-A-X-X-TR", rev G, ECN-343532 |
| TAO | Taoglas FXP831.07.0100C spec SPE-11-8-026-K |
| SKQG | Alps Alpine SKQG series (SKQGABE010) |
| USB2 | USB 2.0 specification, §7.1.1.1, §7.1.2.1, §7.1.6.1, Device Capacitance ECN |
| JLC | JLCPCB impedance page, stackup JLC04161H-3313 |

Project library (`lib/`):
- `RadioBoard2027.pretty`: `ESP32-C5-WROOM-1_1U_DUAL` (U1, fits both modules), `D_SOD-323_Bourns` (D4, Bourns
  recommended land), `Samtec_LSHM-110-xx.x-x-DV-S_2x10-1SH_P0.50mm_Vertical_PIH` (J2, the stock LSHM footprint with
  2.00 mm paste-in-hole apertures on the shield pins, LSHM-FP rev G). `ESP32-C5-WROOM-1U` is the older single
  footprint and is not used on the board.
- `RadioBoard2027.kicad_sym`: the module symbol, `TPD4E05U06DQA_FlowThru` (each protected pin drawn opposite its
  pass-through pin), `TPS3840PL`, `D_TVS_Unidir`, `BOM_Item` (ANT1, BOM only).
- `RadioBoard2027.3dshapes`: STEP models of both modules.

---

## 4. Power

The board runs from the controlboard's +3V3 through J2 (net +3V3_HOST). USB-C alone can power it for flashing and
debugging.

| Rail | Source | Loads |
|---|---|---|
| +3V3_HOST | controlboard +3V3, J2 pins 16 / 18 / 20, D4 TVS at J2 | U3 VIN1 and MODE, U7 VDD (C10) |
| Net-(D2-IN-Pad4) (raw VBUS) | J1 VBUS contacts, D2 and D5 | F1 |
| VBUS | after F1 | C5, U4 |
| /Power/VIN2_USB | U4 AP7361C 3.3 V output | U3 VIN2 |
| +3V3 | U3 output | module, LEDs, R1 / R3 / R13 pull-ups |

- **U3 TPS2116, priority mode** (MODE tied to VIN1): the controlboard supply wins whenever U7 reports it good. The
  part blocks reverse current into the unused input (SLVSFG1A §7.3.4), so USB never back-feeds the controlboard and
  no diodes are needed. ST drives GPIO9 (PWR_SRC_HOST, R13 10k pull-up): high = controlboard powers the board.
- **U7 TPS3840PL29 on PR1.** U7 monitors +3V3_HOST on VDD and drives PR1 with its push-pull, active-low output:
  high (= VDD) when the host rail is good, low when not. R12 100k holds PR1 low while U7 is unpowered. MR and CT are
  open (fastest delay). C10 100 nF sits at U7 pin 2 (pad edge 0.47 mm from the pin, in line on the feed) with its
  own GND via (SNVSB03E §8.3).
  - Thresholds (SNVSB03E §6.5, -40 to 125 °C): falling VIT- = 2.9 V +-1.5 % = **2.857-2.944 V**; VHYS 75-125 mV,
    so rising VIT+ = **2.932-3.069 V** (3.00 V typical).
  - Rising: U3 selects the host only above 2.93-3.07 V. Falling: below 2.86-2.94 V PR1 goes low within 15-30 us
    and U3 switches to USB (or off, without USB).
  - Host-only start: the highest VIT+ (3.069 V) is 66 mV below the lowest host rail (3.3 V -5 % = 3.135 V). The
    75 mV minimum hysteresis exceeds the 40 mV J2-to-U3 drop at the module's 403 mA peak, so the mux cannot chatter.
  - PR1 levels: VOH >= 0.8 x VDD = 2.35 V is above the TPS2116 VREF max 1.08 V; VOL <= 0.2 V is below VREF min
    0.92 V. PR1 sees at most VDD (3.47 V at a +5 % host), under the 5.5 V operating limit (SLVSFG1A §6.3).
  - Power-up: the output is held low from VDD = 0.3 V and released 100-350 us after VDD crosses VIT+.
  - The module minimum is 3.0 V (MOD Table 6-2). A falling host can take the module to 2.86 V before USB takes
    over, so firmware keeps the ESP32-C5 brownout detector on ([FIRMWARE.md](../docs/FIRMWARE.md)).
- **Back-feed, radio on USB with the controlboard attached but off.** The STM32 link pins (PE1, PB3, PB5, PG15) are
  5 V-tolerant `FT_h` pins: no positive injection, at most 1.5 uA leakage (DS13313 Table 7 note 3, Table 51). The
  only DC path into the dead controlboard rail is the ESP32-C5 CS pull-up (30k worst case) through the
  controlboard's R29 10k. With only the controlboard's power LED (D6 / R46) as load, the dead rail reaches at most
  **1.70 V**, 1.23 V below U7's lowest VIT+, so U7 cannot hand the module to it. MISO / HANDSHAKE / DATA_READY are
  kept tri-stated by firmware while GPIO9 is low. Bench check open (TODO).
- **U4 AP7361C-33E**: 1 A, 360 mV dropout at 1 A (DS37274). At the module's 403 mA TX peak it dissipates
  (5.0 - 3.3) x 0.403 = 0.69 W; the average is far lower. Its tab is solid in the bottom GND pour (rule "LDO tab
  solid"), with two GND vias just north of the tab (outside its pad, mask and paste) and one between pins and tab.
- **Module supply**: 3.0-3.6 V, >= 0.6 A source (MOD Table 6-2); peaks 313 mA at 2.4 GHz and 403 mA at 5 GHz (MOD
  Tables 6-4, 6-5).
- **Capacitors**, each with its own GND via: C7 10 uF at U3 VIN1; C6 10 uF at the U4 OUT pin, also U3's VIN2 cap
  (deviation 13); C8 22 uF and C9 100 nF at U3 VOUT (C9 1.95 mm from pin 7); C10 100 nF at U7 VDD; C5 4.7 uF at U4
  IN. At the module, on the bottom: C2 100 nF at the pad-2 +3V3 via and C1 22 uF with its own +3V3 / GND via pair
  (HDG 1.3.2 asks for >= 10 uF).
- **D4 Bourns CDSOD323-T03S** (SOD-323, unidirectional, cathode to +3V3_HOST) at J2's power pins (HDG 1.3.2): VRWM
  3.3 V, VBR >= 4.0 V at 1 mA, clamp 7.0 V max at 1 A, 500 W (8/20 us), 125 uA max leakage at 3.3 V. Lowest clamp
  per amp among JLC-stocked 3.3 V TVS parts with VBR >= 4.0 V, so a +5 % host (3.47 V) stays below breakdown. No
  part this size clamps a surge below the module's 3.6 V maximum; D4 covers ESD and hot-plug edges. Placement:
  deviation 12.
- **D3 red power LED**, R15 1.5k: (3.3 - 2.0) / 1.5k = 0.87 mA.

---

## 5. ESP32-C5 module

### U1 ESP32-C5-WROOM-1U-N8R8

- The WROOM-1U-N8R8 (U.FL, external antenna) is the BOM part. The ESP32-C5-WROOM-1-N8R8 (PCB antenna) is the
  fallback (MPN_ALT, LCSC C51950749, Mouser 356-ESP32C5WROM1N8R8). Both fit `ESP32-C5-WROOM-1_1U_DUAL`: pads 1-29
  coincide; pads 30-32 are the 1U's only and keep the full Espressif land. ANT1 (Taoglas FXP831.07.0100C) is fitted
  only with the 1U. N8R8 = 8 MB flash, 8 MB PSRAM.
- Pad 19 (GPIO15) is the PSRAM chip select on N8R8 and must not be used (MOD Table 3-2 note 3): unconnected.
- ANT2 (pad 31) is unconnected. The EPAD is soldered to GND with 8 vias (deviation 16).

### Pin map

| Signal | GPIO | Module pad | Notes |
|---|---|---|---|
| SPI CLK | 6 | 8 | IO_MUX FSPICLK |
| SPI MOSI | 7 | 9 | IO_MUX FSPID; strapping pin (JTAG source) |
| SPI MISO | 2 | 4 | IO_MUX FSPIQ; strapping pin (MTMS); R4 33 ohm series at the module |
| SPI CS | 10 | 12 | IO_MUX FSPICS0 |
| HANDSHAKE | 1 | 7 | ESP-Hosted HS; also XTAL_32K_N |
| DATA_READY | 0 | 6 | ESP-Hosted DR; also XTAL_32K_P |
| Status LED | 8 | 10 | D1 green via R8 1.5k, active high |
| PWR_SRC_HOST | 9 | 11 | U3 ST, high = controlboard power |
| USB D- / D+ | 13 / 14 | 13 / 14 | USB Serial/JTAG, R5 / R6 22 ohm |
| UART0 TX / RX | 11 / 12 | 25 / 24 | TP1 (via R7 499 ohm) / TP2 |
| BOOT | 28 | 15 | R3 10k pull-up, SW2 to GND |
| Reset | EN | 3 | R1 / C3 delay, R2 from the host, SW1 to GND |
| Unused | 3, 4, 5, 15, 23, 24, 25, 26, 27 | | no-connect |

- **Why these pins.** 6 / 7 / 2 / 10 are the C5's IO_MUX SPI pins (EH recommends IO_MUX). HANDSHAKE and DATA_READY
  are on GPIO1 / GPIO0 so every link pad sits in one run of the west pad column (pads 3-12, north to south EN, MISO,
  DR, HS, SCK, MOSI, CS), which is also the J2 signal-row order (§7). GPIO8 puts the status LED pad in the east
  strip.
- **Strapping.** GPIO2 and GPIO7 are strapping pins (CHIP Table 3-1) but neither selects the boot mode; only
  GPIO26-28 do (CHIP Table 3-3). GPIO7 selects the JTAG source and is ignored at default eFuses (CHIP Table 3-7).
  GPIO0 / GPIO1 are not strapping pins.
- **R4 33 ohm** on MISO is the source termination at its driver (the module), on the bottom under pad 4 at the
  pad-band via. MOSI and SCK are source-terminated at their driver on the controlboard (R66 / R65 30 ohm).

### EN (reset)

- **R1 10k to +3V3, C3 1 uF to GND**: the recommended power-on delay (HDG 1.3.3); EN must never float (MOD Table
  3-2). Rails must be stable >= 50 us before EN rises; a reset needs EN low >= 50 us (MOD Table 4-8).
- **R2 470 ohm** joins EN to the controlboard's ESP_RST (STM32 PE1, open drain). It limits the current into C3 if
  the host pin is mis-set to push-pull. With R1 it holds EN at 3.3 x 470 / 10.47k = 0.15 V when pulled low, below
  the 0.25 x VDD input-low limit (MOD Table 6-3).
- **SW1 RESET** pulls EN to GND.
- **Controlboard off, radio on USB.** PE1 is `FT_h`: no injection, <= 1.5 uA leakage. With 11.5 uA worst case
  through R1 + R2, EN = 3.30 - 0.12 = **3.18 V**, above VIH = 2.48 V: the module leaves reset. Bench check open; the
  contingency, only if the bench disagrees, is a small Schottky (BAT54 / RB521 class) in series with R2, cathode
  toward J2.

### BOOT

- **R3 10k pull-up on GPIO28** (HDG 1.3.9). GPIO28 = 1 at reset is SPI boot; GPIO28 = 0 with GPIO27 = 1 is download
  mode, including USB (MOD Table 4-3). GPIO27 has an internal pull-up and is unconnected.
- **SW2 BOOT** pulls GPIO28 low: hold it while pressing RESET.
- **C4 15 pF** is footprint only (DNP): HDG 1.3.9 shows it but warns that fitting it can force download mode.

### Debug and status

- **UART0** (GPIO11 TX, GPIO12 RX) on TP1 / TP2 on the bottom, R7 499 ohm on TX (HDG 1.3.7); TP3 is a GND probe pad
  beside them. HDG 1.5: RF test firmware only supports UART. Reachable only with the radio unmounted.
- **D1 green status LED** on GPIO8 through R8 1.5k: (3.3 - 2.2) / 1.5k = 0.73 mA, active high.

---

## 6. USB

- **J1 GCT USB4110-GF-A** (USB 2.0 Type-C receptacle), west edge at (3.7, 28.2), mouth west. Shield to GND.
- **R9 / R10 5.1k** Rd on CC1 / CC2 (sink). CC1 / CC2 have no ESD part (deviation 22).
- **Native USB Serial/JTAG** on GPIO13 (D-) / GPIO14 (D+), Full-Speed only, no USB-UART bridge.
- **U2 TPD4E05U06**, flow-through on all four data contacts (A6, A7, B6, B7), directly east of J1: D+ 10 -> 1 and
  7 -> 4, D- 9 -> 2 and 6 -> 5. Every contact meets its protector before any via or join. No supply pin, so an
  unplugged cable cannot hold a rail up through it.
- **R5 / R6 22 ohm** in series right after U2, where the duplicate contacts join (HDG 1.3.13 suggests 22-33 ohm;
  placement: deviation 2).
- **D2, D5 TVS0500** on the two VBUS contact groups (D2 on A4 / B9 north of U2, D5 on A9 / B4 south of it). The pair
  runs between the groups, so each group has its own clamp at its contacts, flow-through, before any via.
- **F1 Bourns MF-MSMF075/33X-2**: hold 0.75 A (0.56 A at 50 °C), trip 1.50 A, 33 V. The 403 mA module peak is under
  the hold current.
- **C5 4.7 uF** on VBUS at the LDO input (USB Device Capacitance ECN: 1-10 uF). Everything behind U4 still exceeds
  the 10 uF attach limit (no inrush limit): bench use only.
- Auto-download over USB stops working if the application disables the USB PHY or reuses GPIO13 / 14 (HDG 1.5);
  then use BOOT + RESET.

---

## 7. Controlboard link

J2 is a Samtec LSHM-110-02.5-L-DV-A-S-K-TR (0.5 mm pitch, 2 x 10, shielded, hermaphroditic) on the bottom at
(3.70, 6.03), rotation 90. It mates the controlboard J9 face to face (5 mm stack); radio pin p meets J9 pin p+1 (odd
p) or p-1 (even p). The full pin table, the mating rule, the standoffs and the stack: [INTERFACE.md](../docs/INTERFACE.md).

- The signal row is the odd row, in module-pad order north to south: 19 EN, 15 MISO, 11 DATA_READY, 9 HANDSHAKE,
  7 SCK, 3 MOSI, 1 CS. Each line reaches its module pad without crossing another.
- SCK (pin 7) has GND pin 5 on one side and HANDSHAKE on the other, GND across the gap; MOSI sits between GND pin 5
  and CS; MISO between GND pins 13 and 17 with +3V3_HOST across the gap.
- Power: three +3V3_HOST pins (16 / 18 / 20) carry the 403 mA peak, about 0.13 A per pin (LSHM: 2 A per pin, one pin
  powered per row).
- Footprint: the shield (SH) through-holes are paste-in-hole, 2.00 mm aperture (LSHM-FP rev G), on B.Paste because
  J2 is on the bottom. The controlboard J9 uses the same footprint.

### ESD

U5 and U6 (TPD4E05U06) on the bottom right at J2's pad ends (0.9 mm of track), rotation 0: U5 (7.85, 4.23), U6
(7.85, 7.33). Each line runs J2 pad -> protected pin -> pass-through pin on L4, straight, with no via or branch
before the protector.

| Part | Pin 4 -> 7 | Pin 5 -> 6 | Pin 2 -> 9 | Pin 1 -> 10 |
|---|---|---|---|---|
| U5 (north) | EN (J2 19) | unused | MISO (J2 15) | DATA_READY (J2 11) |
| U6 (south) | SCK (J2 7) | HANDSHAKE (J2 9) | MOSI (J2 3) | CS (J2 1) |

GND: J2 pins 17 and 5 run into U5 / U6 pin 3, with a GND via just east of J2 (x 6.75); J2 pin 13 has its own via;
each part's pin 8 is tied straight across to its pin 3. The module is rated HBM +-2 kV / CDM +-500 V (MOD §12); the
connector is exposed whenever the boards are unplugged.

### Pulls

This board adds no pulls on the link. The controlboard holds CS up (R29 10k) and HANDSHAKE / DATA_READY down (R31
100k, R32 10k), which keeps the levels defined during reset and ROM boot. Once running, ESP-Hosted enables internal
pulls (up on MOSI / SCLK / CS, down on MISO / HS / DR; EH `spi_slave_api.c`). The host ignores HANDSHAKE /
DATA_READY for 500 ms after releasing EN.

---

## 8. PCB

### 8.1 Placement

| Side | Area | Parts |
|---|---|---|
| Top | North-east | U1 (19.85, 11.5), rotation 0. 1U body y 0.9-22.15; U.FL at about (26.1, 3.3), cable north over the edge. WROOM-1 antenna past the north edge (§2) |
| Top | North-west, over J2 | D4 (2.50, 4.63); R2 (9.6, 4.62), EN 470 ohm right after the EN via; EN RC R1 (7.3, 2.52) / C3 (8.3, 2.55) |
| Top | South-west | J1 (3.7, 28.2); U2 (9.6, 28.2) east of the data contacts; D2 / D5 on the two VBUS groups; R5 (12.1, 25.67) / R6 (13.4, 26.67); F1 (7.0, 37.5) |
| Top | South | D1 STAT (20.0, 25.0) with R8; D3 PWR (24.0, 25.0) with R15; SW1 RESET (16.9, 32.0); SW2 BOOT (25.6, 32.0) |
| Bottom | North-west | J2 (3.70, 6.03), rotation 90; U5 (7.85, 4.23), U6 (7.85, 7.33) |
| Bottom | Under the module's north-west corner | R4 (12.25, 4.99) at the pad-4 band via; C2 (13.96, 3.86) at the pad-2 +3V3 via; C1 (14.9, 5.35) |
| Bottom | Under the module | TP1 / TP2 / TP3 at x 26.9, y 13.6 / 15.6 / 17.6; R7 (26.9, 11.6); R3 / C4 (BOOT) |
| Bottom | South | U4 LDO (17.6, 30.4), rotation 270, OUT pin row level with U3 pin 6; C5 (15.3, 24.2) at IN; C6 (19.9, 24.4) at OUT; U3 mux (24.5, 27.0) with C7, C8, C9, R12 (25.6, 29.6), R13; U7 (27.8, 29.3) with C10 (28.28, 26.72) |
| Both | Holes | H1 (14.0, 37.5), H2 (27.4, 37.5): 2.2 mm NPTH for M2 x 5 mm standoffs |

- Everything a user touches (USB-C, RESET, BOOT, LEDs) is on the top.
- The tallest bottom part is U4 (SOT-223, 1.8 mm); over the controlboard MCU it leaves at least 1.6 mm in the 5 mm
  stack (stack clearances: [INTERFACE.md](../docs/INTERFACE.md)).
- J2's shield pins are at (2.55, 1.06) and (2.55, 11.0), under neither module and 8 mm from the nearest module pad.
- The nearest courtyards to H1 / H2 (SW1, SW2) are 2.65 mm from the hole centres, outside the 2.4 mm radius a 4 mm
  A/F M2 hex standoff needs.

### 8.2 Stackup

JLC04161H-3313, 1.6 mm (from the board file):

| Layer | Thickness | Use |
|---|---|---|
| L1 F.Cu | 35 um | Parts, USB pair, link pad stubs, EN, GND pour `GND_L1` |
| prepreg 3313 | 0.0994 mm, Er 4.1 | |
| L2 In1.Cu | 15 um | Solid GND (`GND_L2`); cut only by the WROOM-1 antenna strip |
| core FR4 | 1.265 mm, Er 4.6 | |
| L3 In2.Cu | 15 um | +3V3 plane (`P3V3_L3`) with priority GND regions `GND_L3_LINK` (x 4.8-13.4, y 3.3-17.6, under every L4 link line and its vias) and `GND_L3_USB_HOP` (x 10.4-13.25, y 25.9-29.3, under the USB D+ hop) |
| prepreg 3313 | 0.0994 mm, Er 4.1 | |
| L4 B.Cu | 35 um | Link (J2 -> U5 / U6 -> vias), power, slow nets, GND pour `GND_L4` |

L4 sits on L3, which is the +3V3 plane; the link and the USB hop therefore run over the GND regions poured into L3
under them (CLAUDE.md §4), stitched at both ends.

### 8.3 Net classes, widths and impedance

Impedances from a direct 2D field solver (LPI mask 0.010 mm, Er 3.8). The build's SOR solver reads 1.5-2 ohm higher;
the JLC calculator is the arbiter (TODO).

| Class | Nets (pattern in the project file) | Width / gap | Impedance | Layers |
|---|---|---|---|---|
| Fast, link | `/Controlboard Link/ESP_SPI*`, `ESP_HANDSHAKE`, `ESP_DATA_READY`, `Net-(U1-GPIO2)` (MISO after R4) | 0.15 mm; >= 0.30 mm edge to other signals (SCK >= 0.325 mm) | 50 ohm target: 54.2 ohm uncoated, 52.4-52.8 ohm with mask | L4 over the L3 GND region; L1 stubs over L2 |
| Fast, USB pair | `/USB/*`, `Net-(U1-GPIO1*` (after R5 / R6) | 0.19 mm / 0.31 mm gap (0.5 mm pitch) | 90 ohm diff target: 91.6 ohm uncoated, 88.7-89.5 ohm with mask | L1 over L2; one L4 hop over `GND_L3_USB_HOP` |
| Power | `VBUS`, `Net-(D2-IN-Pad4)`, `+3V3`, `+3V3_HOST`, `/Power/VIN2_USB` | 0.4 mm (0.3 mm at fine-pitch pins, 0.2 mm minimum), 0.2 mm clearance | width from current | L1, L4, L3 plane |
| Default | EN, GPIO, LEDs, UART, CC | 0.15-0.2 mm, 0.15 mm clearance | not controlled | L1, L4 |

- 0.18 / 0.32 mm (about 91.9 ohm) is the USB option if the JLC calculator also reads low.
- Vias 0.45 / 0.25 mm; Power-class vias 0.5 / 0.25 mm. 133 vias, 100 of them GND.
- Inner planes: 0.15 mm clearance, 0.1 mm minimum fill (deviation 4).

### 8.4 Link routing and lengths

- **J2 to U5 / U6 on L4**, 1:1 with the J2 pins, flow-through, no via or branch before the protector. DATA_READY
  makes one 0.55 mm 45-degree jog from J2 pin 11 into U5 pin 1.
- **DATA_READY, HANDSHAKE, SCK, MOSI**: L4 fan-out, nested and monotone. Each line leaves its pass-through pin east,
  turns south in its own lane (DR x 11.5, HS 11.05, SCK 10.5, MOSI 9.95), turns east at its pad's y into a via in
  the west pad band (x 12.55, SCK 12.65), then an 0.8-0.9 mm L1 stub into the pad's inner end (deviation 1).
- **MISO**: L4 east from U5 pin 9 through a square-wave serpentine, R4 under pad 4, band via (12.9, 6.4), 1.15 mm L1
  stub into pad 4. R4 is 2.3 mm of copper and the via from its driver (pad 4).
- **CS**: straight south on L4 from U6 pin 10, one 45-degree run to its via west of pad 12 (10.2, 16.56), 0.75 mm L1
  stub.
- **EN**: via right after U5 (9.6, 3.55) -> L1 -> R2 -> pad 3; the node also feeds R1 / C3 and runs down the west
  side (L1 x 5.7, L4 y 21.3) to SW1. Slow 10k / 1 uF node.
- **Return path**: each band via has a GND via 0.635 mm south of it; CS has one at (9.6, 17.15), 0.84 mm away. Both
  references are GND (L3 region under L4, L2 under L1); a sampled check (centre and +-0.45 mm = 3W, every 0.1 mm)
  finds every link sample over GND.
- **Spacing**: closest different-net Fast tracks 0.300 mm edge to edge (DATA_READY / HANDSHAKE); SCK >= 0.325 mm
  from HANDSHAKE and >= 0.40 mm from MOSI.

Length table (re-measured 2026-11-07 on the saved board). Definition: J2 pad centre to the track end inside the
module pad; every segment summed, U5 / U6 counted pin to pin, R4 pad to pad, each via as 1.6 mm. The pad-centre
column adds the 0.4 mm from the track end to the module pad centre and the 0.025 mm offsets at U5 / U6.

| Net | To track end | Pad centre to pad centre | Vias | vs SCK | Note |
|---|---|---|---|---|---|
| SCK | 14.079 mm | 14.529 mm | 1 | 0.000 | J2-7 to U1-8 |
| MOSI | 14.079 mm | 14.529 mm | 1 | 0.000 | J2-3 to U1-9 |
| CS | 14.079 mm | 14.529 mm | 1 | 0.000 | J2-1 to U1-12; longest by geometry, sets the target |
| MISO | 14.079 mm | 14.529 mm | 1 | 0.000 | J2-15 to U1-4, incl. R4 (1.02 mm) and the serpentine |
| HANDSHAKE | 12.929 mm | 13.379 mm | 1 | | not matched (asynchronous status line, deviation 3) |
| DATA_READY | 12.635 mm | 13.035 mm | 1 | | not matched (deviation 3) |
| EN (J2 to R2 pin 1) | 6.285 mm | 6.335 mm | 1 | | slow reset line |

Tolerance +-0.05 mm. This board is matched on its own; the controlboard matches its half (14.860-14.861 mm)
independently, and nothing is compensated across J2 / J9.

### 8.5 USB routing and lengths

- **Contacts to U2**: all four data contacts run on L1 straight east into U2's pass-through pins (6, 7, 9, 10) and
  leave by the protected pins (5, 4, 2, 1).
- **Duplicate join** after U2 at R5 pad 2 (D-) and R6 pad 2 (D+). The D+ A6 leg, enclosed between the two D- legs,
  hops on L4 between vias (11.1, 27.7) and (12.75, 27.7), with GND return vias at 0.67 mm ((10.65, 28.2), U2's GND
  via) and 0.85 mm ((12.75, 28.55)) and `GND_L3_USB_HOP` under it. The D- legs and the D+ B6 leg stay on L1.
- **Leg balance**: A7 - A6 = B7 - B6 = -2.60 mm, so one D- trunk serpentine (+2.11 mm; 3 bumps, amplitude 0.53 mm
  <= 3W, legs 4W apart, 45-degree corners, the first where the mismatch starts after R5) matches both orientations.
- **After R5 / R6**: L1 pair at 0.19 / 0.31 mm, north to y 23, west below the module body, north at x 9.65 / 10.15,
  east into pads 14 (D+) and 13 (D-).
- **CC1 / CC2** drop through vias at the contacts to R9 / R10 on the bottom.
- A sampled reference check finds GND under every USB centreline.

| | D+ | D- | D- minus D+ |
|---|---|---|---|
| Orientation A (A6 / A7), J1 contact to U1 pad | 21.020 mm (2 vias) | 21.020 mm | -0.001 mm |
| Orientation B (B6 / B7) | 19.332 mm | 19.332 mm | +0.000 mm |

Pad centre to pad centre, R5 / R6 span (1.02 mm) included, 1.6 mm per via. Legs (contact to join pad): A6 9.54 (with
the two hop vias), B6 7.85, A7 6.93, B7 5.25 mm; trunks D- 13.07, D+ 10.46 mm of track.

### 8.6 Power routing

- **Raw VBUS**: A4 / B9 run along D2's three IN pads (flow-through), a 0.5 mm via drops to L4, L4 runs south into
  D5's IN pads, which also take A9 / B4; D5 feeds F1. 0.35-0.4 mm, 0.3 mm beside the CC vias.
- **VBUS**: F1 -> via (4.86, 35.2) -> 0.4 mm L4 round U4's west side, 45 degrees into U4 pin 1, C5 at the pin.
- **+3V3_HOST**: J2 pins 16-20 (joined along the even row) -> 1.3 mm of L4 -> via (0.55, 3.78) -> L1 -> D4 cathode
  (flow-through) -> L1 south along the west edge -> via (0.65, 19.15) -> 0.4 mm L4 east at y 19.4 -> C7 (in line) ->
  U3 VIN1. A 0.25 mm branch from C7's node feeds C10 and U7 VDD.
- **PR1**: U3 pin 4 -> R12 pin 1 -> U7 output (pin 1). U7 GND runs into C10's GND pad and its via.
- **VIN2**: U4 OUT -> C6 at the pin -> 0.25 mm run into U3 pin 6, 6.9 mm, no via, nothing under U4.
- **+3V3**: U3 VOUT pins tied under the body, C9 and a via into the L3 plane. Module pad 2: band via (12.9, 3.86)
  straight into the plane, 1.15 mm L1 stub; C2 at that via, C1 with its own via pair; pad 1 GND has its own band via
  (12.55, 2.59). R1, R3 and R15 have their own +3V3 vias.
- **SW1 / SW2**: the two pad-1 and two pad-2 terminals of each SKQG are internal jumpers in the footprint; no copper
  loop joins them.
- **Slow nets** (STATUS_LED, PWR_SRC_HOST, UART, LED anodes) on L1 / L4, recorded router output replayed by the
  build (Appendix B).

### 8.7 Termination and protection

| Part | Where | Why |
|---|---|---|
| R4 33 ohm | MISO, at module pad 4 (2.3 mm of copper + via) | Source termination at the driver; driver + R near the 50 ohm line (Espressif publishes no output impedance; EH suggests series resistors) |
| R5 / R6 22 ohm | USB D- / D+, right after U2 at the duplicate joins | HDG 1.3.13 damping; placement in deviation 2 |
| U5 / U6 TPD4E05U06 | link, at J2's pad ends, flow-through | Every link line protected before any via; the connector is exposed when unplugged |
| U2 TPD4E05U06 | USB data, at J1, flow-through | All four data contacts protected before any join |
| D2 / D5 TVS0500 | VBUS contact groups, at J1 | Each group clamped at its contacts |
| D4 CDSOD323-T03S | +3V3_HOST, over J2's power pins | ESD / hot-plug at the power entry (HDG 1.3.2) |
| F1 PTC 0.75 A | VBUS after the TVS | Cable fault and overload |

MOSI and SCK are source-terminated on the controlboard (R66 / R65 30 ohm); CS has no series resistor (slow edge
set by the STM32 GPIO speed, see [INTERFACE.md](../docs/INTERFACE.md)).

### 8.8 Custom DRC rules (`RadioBoard2027_C_Overhang.kicad_dru`)

Every number carries units. The pour and Fast-to-Fast rules carry `(layer outer)`, so via antipads in the inner
planes stay normal size.

| Rule | Constraint | Why |
|---|---|---|
| Power nets | 0.2 mm clearance, 0.2 mm min width | Current-carrying nets never necked below 0.2 mm |
| Link 50 ohm width | 0.14 / 0.15 / 0.16 mm, outer | Holds the 50 ohm width |
| Link pour clearance | 0.3 mm (2W) to zones, outer | Same-layer pour does not turn the line into a coplanar guide |
| USB width | 0.18 / 0.19 / 0.20 mm, outer | Holds the 90 ohm pair width |
| USB pour clearance | 0.4 mm (2W) to zones, outer | Same reason |
| Fast spacing | 0.3 mm from a Fast track to any non-Fast, non-GND track or via | 2W edge gap to other signals; GND return vias may sit closer |
| Fast to Fast spacing | 0.3 mm between different Fast nets (tracks, vias), outer; pads not tested; the two USB lines not against each other | 3W centre to centre between fast lines; pads excluded for the 0.5 mm pitch pad entries |
| Fast track to Fast pad | 0.24 mm, outer; USB lines not against each other | Covers what the previous rule leaves out; every pad entry here keeps >= 0.25 mm, no footprint exempt |
| Link GND pins without spokes | min_resolved_spokes 0 on J2 / U5 / U6 GND pads | Joined by track; no room for spokes at 0.5 mm pitch |
| LDO tab solid | solid zone connection on U4 GND | U4 dissipates up to about 0.7 W |
| D4 anode solid | solid zone connection on D4 GND | D4 has no GND via of its own (deviation 12) |
| USB-C GND contacts by track | min_resolved_spokes 0 on J1 GND pads | Tied by track to the shell pads; no room for spokes |
| Antenna keep-out | disallow track / via / pad in `ANTENNA_KEEPOUT` or `ANTENNA_KEEPOUT_INNER` | Rule areas are not tested by DRC in this KiCad 10 setup (proven); this enforces them |
| No top tracks under the module body | disallow F.Cu track in `KEEPOUT_MODULE_TOP` | Same reason |
| Standoff keep-out | disallow track / via in `STANDOFF_KEEPOUT` | Same reason |

Rule areas (verified on the board):

| Name | Layers | Extent | Purpose |
|---|---|---|---|
| `ANTENNA_KEEPOUT` | L1, L4 | x 10.1-30.1, y -6.4 to 1.1, notched round pads 30-32 | No copper in the WROOM-1 antenna area (part of the U1 footprint) |
| `ANTENNA_KEEPOUT_INNER` | L2, L3 | same, no notch | No plane under the antenna |
| `ANTENNA_NOPOUR_OUTER` | L1, L4 | same, no notch | No pour in the notch either |
| `KEEPOUT_MODULE_TOP` | L1 | x 12.2-27.0, y 1.1-22.1, notched for the west pad band (x 12.2-13.15, y 2.0-17.2) and the pad 30 / 32 GND stubs | No top tracks under the module body; tented vias allowed |
| `NO_POUR_LINK_LANES` | L4 | x 5.3-8.6, y 3.4-8.6 | No pour between the J2 -> U5 / U6 lanes |
| `STANDOFF_KEEPOUT` (2) | L1, L4 | octagons 4.8 mm across the flats at H1 / H2 | No copper under the standoffs |

Proofs (copies of the board with their own rules file): a deliberately violated test rule (5 mm minimum width on
Fast) fires 129 times; two Fast test tracks 0.2 mm apart and an SCK track 0.20 mm from U1 pad 9 are flagged; test
items in the antenna strip (L1, L4, L2 under the notch, L3, a via), under the module body (two) and in a standoff
keep-out are flagged (8 of 8), a control track beside the strip is clean. A 0.8 mm / 0.10 mm test text fires the
board text rule.

### 8.9 Antenna edge

- The strip y 0-1.1 inside the board is copper-free on every layer except the 1U pads 30-32: 0.000 mm2 of fill.
- Pads 30 and 32 are tied to GND from the south through tented vias at y 2.5; the stubs start at y 1.4, below the
  strip. Pad 31 is open.
- Nothing but the module crosses the north edge. In the WROOM-1 build only the 1.1 mm strip lies over the
  controlboard, whose copper there is 5 mm below (deviation 17).

### 8.10 J2 shield pins

The Samtec drawing (LSHM-FP rev G) shows the -S shield pins as 1.00 mm PTH soldered paste-in-hole, with no tail
length. Rather than rely on masking under a module, the shared interface puts J2 in the north-west corner,
rotation 90, so its shield tails at (2.55, 1.06) and (2.55, 11.0) are under neither module (decision 2026-11-07).

### 8.11 Stitching

GND vias on a 2.5 mm grid wherever they clear other copper, including under the module body (tented), plus hand-placed
vias under J1, at the south-east corner, beside U4 / SW1, at the east edge, in the east pad band (27.7, 14.6), between
U4's pins and tab (17.5, 29.0), and beside the link and USB fan-outs (7.2, 12.0), (8.4, 22.4). No point of the L1 / L4
GND pours is more than 4.43 mm from a GND via or GND PTH (0.1 mm grid). Every pour island has a via.

### 8.12 Mechanical support

The board is held by J2 (north-west) and the two standoffs (south). The north-east corner, with the module and the
U.FL, is cantilevered (about 22 mm from J2, 34 mm from H2). A third hole would change the shared interface and sit in
the module area, so none was added (deviation 18). Mitigation: mate the U.FL before mounting the radio, or support the
corner while mating; strain-relieve the antenna cable on the chassis; optionally a glued 5 mm spacer under the
north-east corner.

### 8.13 Silkscreen

- Top: USB, RESET, BOOT, STAT, PWR, the U1 reference and the module's pin-1 marker. No "ANT" label: no spot next to
  the U.FL is free and visible in both builds; the U.FL is on the module itself.
- Bottom: TX, RX, GND at TP1 / TP2 / TP3, LINK and the J2 reference at J2, the board name under the module.
- Text 1.0 mm high, 0.17 mm stroke; the board text rule (1.0 mm / 0.15 mm, JLC minimum) makes DRC enforce it.
- Other references are on the fab layers only (deviation 19). J2 has no per-pin labels (0.5 mm pitch, hidden when
  mated); the footprint's pin-1 mark sets its orientation and the pin map is in [docs/board_map.svg](docs/board_map.svg).

### 8.14 Verification (2026-11-07)

| Check | How | Result |
|---|---|---|
| DRC | kicad-cli on the saved repo board, schematic parity, all severities | 0 / 0 / 0 / 0 |
| ERC | kicad-cli, all severities | 0 |
| Lengths | `rlen.py`, `ulen.py` on the saved board | §8.4, §8.5 |
| Mating | `mate.py` with the current controlboard file | 20 / 20 contacts coincide, nets match; pegs (1.70 mm) and shield tails (2.30 mm) of the two halves are mirrored by design, each landing on its own board |
| Rule compilation and keep-outs | proof copies (§8.8) | all test items flagged |
| Antenna strip fill | `antfill.py` | 0.000 mm2 on every layer |
| Reference plane, return vias, pad / via overlap | `refchk.py`, `check.py`, `check2.py`, `padscan.py` | as quoted in §8 and §9; no via overlaps a pad except the 8 EPAD gap vias; the only via edge closer than 0.05 mm to a pad is a GND via 0.045 mm from C2 pad 2 (same net) |
| Cleanliness | `check.py`, `check2.py` | 0 non-45-degree segments, 0 duplicates, 0 collinear joins, 0 off-pad T-junctions, 0 width steps, 0 corners at vias, 0 off-axis pad entries |
| Renders | L1-L4 with silkscreen, 3D views | inspected; the 3D models of U1 (body), J1 and F1 do not resolve (cosmetic) |

---

## 9. Deviations from the house rules

Each item was checked on the saved board file on 2026-11-07 and accepted for the reason given.

1. **Link length added on MISO and by corner size; pad-band stubs turn back.** CS is the long line by geometry and
   sets the target with no added length. MISO gets a 4-leg square-wave serpentine on L4 right after U5: legs 0.75 mm
   apart (5W; 0.60 mm = 4W gap), +-0.42 mm about its centre line (3W each side, 0.85 mm = 5.7W peak to peak), x
   9.05-11.3, 4.3 mm of copper (plus the via and R4) from its driver. SCK and MOSI lose 0.2-0.3 mm through their
   two 45-degree chamfer sizes. MISO, DATA_READY, HANDSHAKE, SCK and MOSI change layer in the west pad band and
   their L1 stubs run back west 0.8-1.15 mm into the pad's inner end: the only reversal on the link, inside the pad
   band. A via west of the pads leaves no room for the MISO serpentine and R4.
2. **USB.** (a) The duplicate-contact stubs stay at 5.25-9.54 mm (unused orientation: 5.25 / 7.85 mm in A, 6.93 /
   9.54 mm in B) where CLAUDE.md asks for a few mm: 2.7 mm of each is the contact jog and U2's flow-through (ESD
   first), the joins must be at pads, and the crossing puts two vias on one leg. (b) R5 / R6 sit at the joins,
   10.5-13 mm of track from the module, not within 5 mm of the driver: at the module the joins would be off-pad
   T-junctions. (c) At the J1 contacts the 45-degree escape jogs are not concentric: the gap drops to 0.164 mm
   for about 0.35 mm at two spots: D+ B6 against D- A7 at about (8.45-8.86, 28.97-29.20), and D+ A6 against D- B7
   at about (8.65-8.87, 27.73-27.96). (d) The two lines of the pair are exempt from the Fast-to-Fast
   rules against each other, so the pair gap (0.31 mm by construction) is not DRC-checked; at the serpentine bumps
   it opens to 0.84 mm for 0.76 mm each. Accepted: the port is Full-Speed only (12 Mb/s, 83.3 ns bit, 4-20 ns
   edges); a 9.5 mm stub resonates near 4 GHz.
3. **HANDSHAKE and DATA_READY are 50 ohm but not length-matched** (12.93 / 12.64 mm against 14.08 mm):
   asynchronous ESP-Hosted status lines, not sampled by SCK.
4. **Inner planes use 0.15 mm clearance and 0.1 mm minimum fill** (JLC inner-layer capability), so neighbouring via
   antipads stay separate.
5. **Vias under the module are tented**: the 8 EPAD vias, the west pad-band vias, the pad 15 / 24 / 25 / 28 / 30 /
   32 vias, C1 / C2's vias and the stitching under the body. Order all vias tented.
6. **J2's courtyard reaches 0.25 mm past the north edge** (courtyard only; part of the shared interface).
7. **Rule areas are enforced by custom rules**, because DRC in this KiCad 10 setup does not test them (proven).
8. **The 1U pads 30-32 reach into the WROOM-1 antenna strip on L1.** They are the 1U's own pads (the WROOM-1 has
   none there); `ANTENNA_KEEPOUT` is notched round them and `ANTENNA_NOPOUR_OUTER` keeps the pour out of the notch.
9. **The WROOM-1 build needs its own stencil** with no paste on U1 pads 30-32 (otherwise solder bumps form under the
   antenna PCB). The board is the same for both builds.
10. **Own-pin ties under parts**: U3 VOUT pin 2 to 7 and VIN1 pin 3 to MODE pin 5 (TI layout example); U5 / U6 GND
    pin 8 to pin 3 (TI flow-through layout); J2 even row joined along its own pads (+3V3_HOST 16-20, GND 2-14), exits
    west. Nothing else passes under a part.
11. **Short segments**: 94 of 301 segments are shorter than 0.5 mm. The off-pad ones are the MISO serpentine (12),
    the USB D- serpentine (25; at 3W amplitude its pieces cannot reach 0.5 mm), link bend chamfers (8), the EN via
    neck (1) and 45-degree chamfers on other nets; the rest are pad necks.
12. **D4 on the top, one via from J2, no GND via of its own.** J2's body and through-hole pegs / shield tails cover
    the bottom, so D4 sits on the top over J2's power pins: pins 16-20 -> 1.3 mm L4 -> via -> 1.2 mm L1 -> D4 cathode
    (flow-through), about 2.5 mm and one via before the clamp (CLAUDE.md §8 asks for no via). Every spot near its
    anode is over the J2 housing, so the anode returns through the solid L1 GND pour (GND vias at (6.75, 4.26) /
    (6.65, 5.28), 3.2 mm) and a 3.7 mm L1 track to J2's north shield PTH; nearest via 2.68 mm.
13. **U3 VIN2 capacitor 6.9 mm away.** C6 is both the U4 output cap (2.1 mm from OUT) and U3's VIN2 cap, 6.9 mm of
    track from pin 6, no via. A cap at pin 6 has no room between C9 (which must stay at VOUT), R13 and D3. VIN2
    changes slowly; the switchover step is carried by the VOUT caps (C9 1.95 mm from pin 7, C8, C1).
14. **Return and protector GND vias.** Link layer changes: GND via 0.63 mm (band vias) or 0.84 mm (CS). USB hop:
    0.67 / 0.85 mm. GND pad to nearest GND via, pad edge to via centre:

    | Pad | Distance |
    |---|---|
    | U5 / U6 pin 3 | 0.44 mm (pin 8 tied across) |
    | U2 pin 3 / pin 8 | 0.39 / 1.16 mm |
    | D4 | 2.68 mm, no via of its own (item 12) |
    | D2 | 0.30-1.60 mm (exposed pad 0.61) |
    | D5 | 0.53-0.69 mm (exposed pad 1.01) |
    | U3 pin 1 | 0.33 mm |
    | C6 / C7 / C9 / C10 | 0.20 / 0.38 / 0.39 / 0.44 mm; U7 GND 1.53 mm through C10's GND pad and via |
    | U4 tab | 0.40 mm, two vias just north of the tab plus one between pins and tab |

15. **Reference-plane edges.** Every link track keeps >= 0.63 mm to the edge of its GND reference (3W = 0.45 mm). USB
    spots closer than 3W, each under 0.4 mm long and with the centreline over GND: the D- B7 leg passes the L2 antipad
    of the D+ hop via (11.1, 27.7), the D- A7 leg that of (12.75, 27.7), D- beside the CC1 via, D+ at (8.95, 29.2)
    with 0.41 mm, and the D- trunk 0.41 mm at its south bump. Harmless at Full-Speed.
16. **The 8 EPAD gap vias have about 0.075 mm of mask web to the paste openings** (0.45 / 0.25 mm vias in the 0.40 mm
    gaps between the 1.3 mm sub-pads). Order them plugged / filled and capped, or at least tented with the fab told
    they sit under a paste-printed pad. They are the only vias inside a pad's mask opening.
17. **WROOM-1 build: antenna clearance.** Espressif asks for about 15 mm of clearance round the PCB antenna; here the
    antenna overhangs the robot front edge and only the 1.1 mm strip inside the board lies over the controlboard,
    5 mm below. The 1U is the primary build; measure RSSI before relying on the fallback.
18. **North-east corner cantilevered** (§8.12): no third support hole, to keep the shared interface.
19. **Silkscreen**: most references only on the fab layers; J2 without per-pin labels (§8.13).
20. **Rules and net classes keyed on auto-generated net names** (`Net-(U1-GPIO2)`, `Net-(U1-GPIO1*`,
    `Net-(D2-IN-Pad4)`). They stop matching after a re-annotation or pin rename; the nets should get schematic labels,
    and then the USB pair can get a diff-pair gap rule (TODO).
21. **No ERC section in the project file**: ERC runs with KiCad's default severities.
22. **CC1 / CC2 have no ESD protection** (CLAUDE.md §12 asks for protection on every external pin). The pins go only
    to the 5.1k Rd resistors to GND. Not added in this design; recorded as an open ESD gap (§10).
23. **Schematic readability items** reported by audit 1 and not yet reworked (no electrical effect): on 03_USB D2 / D5
    are drawn as shunts and U2 is connected by labels rather than drawn flow-through; the A3 sheets are mostly empty;
    U1, C1, C2 and ANT1 sit outside their boxes on 02_ESP32; the C4 DNP cross runs over text; the GND text touches D4
    on 04_Link. Re-check each item against the current sheets when reworking.
24. **Other nets close to the USB pair** (final audit m2): the D+ B6 leg passes 0.306 mm from SW1 pad 2 (EN /
    CHIP_PU, a user-pressed button, so an ESD entry point), and the D- trunk's west bump comes within 0.434 mm of a
    PWR_SRC_HOST track near (9.15, 18.9). Both nets are slow; the port is Full Speed only. Kept.
25. **Net-class diff-pair values (resolved 2026-11-07).** The Fast class now holds the routed pair, 0.19 mm width /
    0.31 mm gap, as on the Inboard. The pair gap itself is still not DRC-checked (deviation 2 (d)).

---

## 10. Open issues

- **Antenna gain at 5 GHz (1U build).** The FXP831 peak gain is 5.49 dBi in free space and 7.24 dBi on 2 mm ABS at
  5 GHz (TAO §2); the module was certified with <= 3.65 dBi at 5 GHz (MOD p.53). Options: cap 5 GHz TX power, use
  2.4 GHz only, or a lower-gain dual-band antenna. Confirm the ordered antenna has an MHF I plug.
- **WROOM-1 RF** (deviation 17): measure RSSI and throughput against a devkit.
- **Supply window**: the module rides a falling host down to 2.86-2.94 V (module minimum 3.0 V); keep the brownout
  detector on. Bench-check the USB-to-host transient.
- **Back-feed and EN with the controlboard off**: expected dead rail <= 1.70 V and EN about 3.2 V (§4, §5);
  bench-check.
- **Module supply margin** during 5 GHz TX from a 3.30 V controlboard rail: measure at C1.
- **USB inrush**: C5 plus everything behind U4 exceeds the 10 uF attach limit (bench use only).
- **ESD**: CC1 / CC2 unprotected (deviation 22); D4 cannot hold a surge below 3.6 V.
- **TPD4E05U06 land**: U2, U5, U6 use the stock KiCad USON-10 pads, not TI's DQA0010A land pattern; compare
  before ordering.
- **Re-audit**: the USB-skew changes (R5 / R6 moved, D+ hop, D- serpentine, VBUS L4 run, `GND_L3_USB_HOP`) were made
  after the last independent audit.

## 11. BOM notes

- Not stocked at JLCPCB: U1 (both module variants; the WROOM-1-N8R8 fallback C51950749 had 0 on 2026-11-06), U4
  AP7361C-33E-13, J2 Samtec LSHM-110-02.5-L-DV-A-S-K-TR, ANT1. Source from Mouser / Digi-Key or consign.
- Check stock before ordering: D1 Kingbright APT1608SGC (C5875754, 1,019 on 2026-11-07), D4 Bourns CDSOD323-T03S
  (C3702214, Extended), U7 TI TPS3840PL29DBVR (C1852117).
- Resistors are UNI-ROYAL 0402WGF 1 % (the MPN matches the LCSC part; the Yageo / Panasonic part is MPN_ALT). R7 is
  Yageo RC0402FR-07499RL. 0402WGF330JTCE / 220JTCE are 1 % parts ("F" is the tolerance letter, "330J" the value).
- Capacitors carry voltage and dielectric in the value and the `Rating` field. C4 is DNP.
- TP1-TP3 are excluded from the BOM and the position file.
- Double-sided assembly: J2, U3-U7, R4, C1, C2 and the rest of the bottom parts; J2's shield pins are paste-in-hole.
- No BOM / CPL has been generated for this variant yet.

---

## Appendix A. Review history

Every finding was reproduced on the files before it was fixed or rejected. Audit reports and build backups are in
the layout work folder, not in the repo (`audit_overhang`, `audit_overhang3`, `audit_overhang4`, and the Inboard
`audit_inboard` to `audit_inboard4` whose findings were ported here).

| Round | Date | Findings | Key outcomes |
|---|---|---|---|
| Overhang audit 1 | 2026-11-07 | 6 major, 13 minor | U4 rotated, C6 at its OUT pin, nothing under U4; EPAD vias moved into the paste gaps; inner layers kept copper-free under the antenna; ESD / TVS GND vias added; TP3 added; stitching under the module; NE support proposed, no hole |
| Schematic revision | 2026-11-07 | - | J2 signal row reversed to module-pad order (both radios and the controlboard J9); U5 / U6 channels re-assigned; D4 TVS0500 replaced by CDSOD323-T03S; every Datasheet field a maker PDF |
| Layout revision (Inboard audit 1 ported) | 2026-11-07 | 7 major, 23 minor checked here | "Fast to Fast spacing" rule; D4 on the top over J2; link re-routed monotone (14.08 mm, was 23.35 mm with a 7 mm MISO hairpin); module supply via straight into the plane, C1 / C2 with own vias; U5 / U6 0.9 mm from J2; module-body keep-out from y 1.1; no pour in the pad 30-32 notch |
| Round 2 (Inboard audit 2 ported) | 2026-11-07 | 1 major, 13 minor | U7 TPS3840PL29 replaces the R11 / R12 divider on PR1 (R12 now 100k pull-down); "Fast track to Fast pad" rule; D4 on the Bourns land; GND turn at a via and off-axis pad entries fixed; sheet notes describe this board |
| Overhang audit 3 | 2026-11-07 | 1 major, 11 minor | J2 on the paste-in-hole footprint; resistor MPNs matched to their LCSC parts; direct-solver impedances quoted; U4 / C5 / C6 re-placed (VIN2 cap 12.7 -> 6.9 mm); own GND vias at C6 / C7 / C9 / C10 / U3; R14 removed, C10 added, TP3 in the schematic, VIN2 named; title blocks filled |
| Round 4 (Inboard audit 4 ported) | 2026-11-07 | 7 minor | EN / back-feed analysis corrected (PE1 is `FT_h`, no clamp: EN 3.18 V, dead rail <= 1.70 V; FET proposal dropped); C10 at U7 VDD; no vias in U4's tab; silkscreen 1.0 mm with the board text rule; off-board footprint marker deleted; Descriptions and box titles |
| Overhang audit 4 (convergence) | 2026-11-07 | 0 critical, 0 major, 5 minor | Vias moved off J1's shell pad, C5 pad 2 and R9 / R10; PWR_SRC_HOST no longer between D3's pads; "ANT" label removed; `padscan.py` added to the build checks |
| USB skew round | 2026-11-07 | - | Per-orientation USB match: A +4.57 -> -0.001 mm, B -1.57 -> +0.000 mm; hop moved to the D+ A6 leg, R5 / R6 moved, D- trunk serpentine; not yet independently audited |

Decisions kept from the audits:
- Rejected: "R4 / R5 / R6 are 5 %" (0402WGF330JTCE / 220JTCE are 1 %); "parts out of stock" (LCSC retail showed 0,
  JLC assembly stock was large; the BOM rule uses JLC stock); "clock at only 3W" (3W is the rule; SCK has more except
  at the forced 0.5 mm pin pitch); removing the footprint's silk arrow tip (later the off-board marker was deleted
  from the project footprint instead).
- Superseded switchover designs: R11 / R12 divider 100k / 68k, then 47k / 27k (rising 2.53-3.06 V, falling
  2.42-2.92 V), replaced by U7 in round 2.
- The FET on EN proposed in round 3 was dropped in round 4; a series Schottky on R2 remains a bench-only contingency.

## Appendix B. Build and check scripts

The board copper is generated by scripts in the layout work folder (not in the repo); hand edits in KiCad would
diverge from them. `build.sh` exports the netlist, builds the board from `place.json` (placement), `hand.py` (link,
USB, module supply and power-entry copper; the link and USB matching are bisected inside the script), `zones.py`
(planes, rule areas), the recorded router output for the slow nets (`slow_routes.json`), `fixups.py`, pours,
stitching, chamfers, silkscreen and stackup; then it refills, saves into this folder, runs DRC with parity and the
checks (`rlen.py`, `ulen.py`, `refchk.py`, `check.py`, `check2.py`, `padscan.py`, `antfill.py`, `standoff.py`,
`mate.py`). `proofs.sh` re-runs the rule proofs. Consecutive builds give the same copper hash. After any change,
update the numbers in §8 and §9.
