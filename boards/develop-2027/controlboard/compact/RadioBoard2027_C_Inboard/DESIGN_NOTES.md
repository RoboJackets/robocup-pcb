# RadioBoard2027_C_Inboard design notes

ESP32-C5 radio for ControlBoard2027_C, Inboard variant: 30 x 40 mm, 4 layers. This file describes the design as it
is in the repo today. The schematic and the board file are the ground truth; where this file disagrees with them,
they win (and this file is wrong). History of the audit rounds is condensed in the appendix.

Related documents:
- [../README.md](../README.md): the compact set, status, how the two radio variants differ.
- [../docs/INTERFACE.md](../docs/INTERFACE.md): the board-to-board interface (J2 / J9 pin table, mating rule,
  positions, holes, stack height, keep-outs, link timing). Authoritative for everything shared with the controlboard.
- [../docs/FIRMWARE.md](../docs/FIRMWARE.md): pin map, ESP-Hosted settings, boot, brownout, bench checks.
- [../docs/PROTOTYPE_TO_COMPACT.md](../docs/PROTOTYPE_TO_COMPACT.md): what changed from the prototype RadioBoard2027.
- [docs/board_map.svg](docs/board_map.svg): bench map (buttons, LEDs, USB, test pads, J2).
- [TODO.txt](TODO.txt): open items.

**Coordinates.** All positions in this file are in mm from the top-left corner of the board outline, x to the right
(east), y down (south), seen from the top. (In the board file that corner is at (97.0, 100.0).) North is the robot
front.

**Contents**

1. [Status](#1-status)
2. [Sources](#2-sources)
3. [Variant](#3-variant)
4. [Power](#4-power)
5. [ESP32-C5 module](#5-esp32-c5-module)
6. [USB](#6-usb)
7. [Controlboard link](#7-controlboard-link)
8. [PCB](#8-pcb)
9. [Deviations from the layout rules](#9-deviations-from-the-layout-rules)
10. [Open issues](#10-open-issues)
11. [BOM and sourcing](#11-bom-and-sourcing)
12. [Appendix: review history](#appendix-review-history)

---

## 1. Status

Checked 2026-11-07 on the saved repo files:
- DRC (`kicad-cli pcb drc --schematic-parity --severity-all`, zones as saved): **0 errors, 0 warnings,
  0 unconnected, 0 parity issues.**
- ERC (`--severity-all`, KiCad default ERC settings, see deviation 22): **0 violations.**
- Netlist identical to RadioBoard2027_C_Overhang (net-membership diff).
- Link SPI (SCK, MOSI, MISO, CS) matched at **19.934 mm**, spread 0.000 mm (§8.6).
- USB: orientation B matched (-0.001 mm), orientation A +5.941 mm (deviation 2).
- J2 mates the controlboard J9 pad for pad (20 / 20 contacts coincide, layout work folder `mate.py`).
- Four independent audits plus a scan for the Overhang's audit-4 defect classes; the last round found no critical
  and no new major defect. Open items before ordering: [TODO.txt](TODO.txt).

## 2. Sources

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
| DS22057B | Microchip MCP1826/MCP1826S 1 A LDO, Rev B (ww1.microchip.com/downloads/en/DeviceDoc/22057B.pdf) |
| DS37274 | Diodes AP7361C LDO (the `MPN_ALT` alternate for the LDO) |
| MF-MSMF | Bourns MF-MSMF PTC, Rev BD 06/26 |
| LSHM | Samtec LSHM product specification (suddendocs.samtec.com/productspecs/lshm.pdf) |
| LSHM-FP | Samtec recommended PCB layout for LSHM-1XX-XX.X-X-DV-A-X-X-TR, rev G (suddendocs.samtec.com/prints/lshm-1xx-xx.x-x-dv-a-x-x-tr-footprint.pdf) |
| TAO | Taoglas FXP831.07.0100C spec SPE-11-8-026-K |
| SKQG | Alps Alpine SKQG series (SKQGABE010) |
| USB2 | USB 2.0 specification §7.1.1.1, §7.1.2.1, §7.1.6.1 |
| DS13313 | STM32H723 datasheet rev 4 (controlboard side of the link) |
| JLC | JLCPCB impedance page and capabilities, stackup JLC04161H-3313 |

Project library (`lib/`), the only parts not in the KiCad 10 standard library:
- `ESP32-C5-WROOM-1_1U_DUAL`: one land for either module (§5.1), with both STEP models.
- `TPD4E05U06DQA_FlowThru` symbol: each protected pin drawn opposite its pass-through pin.
- `BOM_Item` (ANT1, BOM only), `TPS3840PL` symbol, `D_TVS_Unidir` symbol.
- `D_SOD-323_Bourns` (D4, Bourns recommended land: pads 0.80 x 0.50 mm, 1.40 mm gap).
- `Samtec_LSHM-110-xx.x-x-DV-S_2x10-1SH_P0.50mm_Vertical_PIH` (J2): the stock LSHM footprint with F.Paste and a
  0.25 mm paste margin on both shield pads (1.5 mm pad, 2.00 mm aperture), per LSHM-FP rev G. The controlboard J9
  uses the same footprint.

## 3. Variant

The module sits at the east edge, long axis north-south, with the WROOM-1 antenna area in the north-east corner,
fully inside the board (x 10.1-30.1, y 0-7.5). The Overhang variant has the same schematic and the same interface but
shifts the module north so that a WROOM-1 antenna overhangs the north edge; see [../README.md](../README.md).

- **Primary build:** ESP32-C5-WROOM-1U-N8R8 with a u.FL external antenna (ANT1, Taoglas FXP831). The cable leaves
  north over the empty antenna area.
- **Fallback build:** ESP32-C5-WROOM-1-N8R8 (PCB antenna). The antenna area is kept copper-free on every layer of
  this board, but not on the controlboard below it (§10).
- **Interface (shared, [../docs/INTERFACE.md](../docs/INTERFACE.md)):** J2 at (3.70, 6.03), rotation 90, bottom
  side; M2 holes H1 (14.0, 37.5) and H2 (27.4, 37.5). The radio's top-left corner sits over controlboard (36, 0).

## 4. Power

The board runs from the controlboard +3V3 through J2 (net +3V3_HOST). USB-C can power it alone for flashing and debug.

| Rail | Source | Loads |
|---|---|---|
| +3V3_HOST | Controlboard +3V3 through J2 pins 16 / 18 / 20, D4 TVS at J2 | U3 VIN1 and MODE, U7 VDD (C10), C7 |
| Net-(D2-IN-Pad4) (raw VBUS) | J1 VBUS contacts, D2 and D5 clamps | F1 |
| VBUS | after F1 | C5, U4 |
| /Power/VIN2_USB | U4 MCP1826S 3.3 V output, C6 | U3 VIN2 |
| +3V3 | U3 output, C8 / C9 | Module (C1, C2), LEDs, R1 / R3 / R13 pull-ups |

**U3 TPS2116, priority mode** (MODE tied to VIN1). The controlboard supply wins whenever PR1 is above VREF. The part
blocks reverse current into the unused input (SLVSFG1A §7.3.4), so USB never back-feeds the controlboard; no diodes.
ST drives GPIO9 (PWR_SRC_HOST, R13 10k pull-up): high means the controlboard powers the board.

**U7 TPS3840PL29 supervisor on PR1.** U7 monitors +3V3_HOST on VDD and drives PR1 with its push-pull active-low
output: high (= VDD) when the host rail is good, low when not. R12 100k holds PR1 low while U7 is unpowered. MR and CT
are open (fastest delay). C10 100 nF sits right north of U7 pin 2, in line on the feed, with its own GND via
(SNVSB03E §8.3: >= 0.1 uF as near VDD as possible).

| Quantity | Value (SNVSB03E §6.5, -40 to 125 °C) | Effect |
|---|---|---|
| VIT- (falling) | 2.9 V +-1.5 % = 2.857-2.944 V | Below it PR1 goes low within 15-30 us and U3 switches to USB (or off) |
| VHYS | 75 / 100 / 125 mV | |
| VIT+ (rising) | 2.932-3.069 V (3.00 V typ) | U3 selects the host only above it |
| tSTRT | 100-350 us after VDD crosses VIT+ | Output held low from VDD = 0.3 V |

- A host at 3.3 V -5 % (3.135 V) is 66 mV above the highest VIT+, so every board starts on the host; the 75 mV
  minimum hysteresis exceeds the 40 mV J2-to-U3 drop at the module's 403 mA peak, so it does not chatter.
- PR1 levels: VOH >= 0.8 x VDD = 2.35 V at VIT+ against VREF max 1.08 V; VOL <= 0.2 V against VREF min 0.92 V. PR1
  sees at most 3.47 V (host +5 %), under the TPS2116's 5.5 V operating limit.
- The module needs 3.0 V minimum (MOD Table 6-2). A falling host can still take it to 2.86 V before USB takes over:
  keep the ESP32-C5 brownout detector on ([../docs/FIRMWARE.md](../docs/FIRMWARE.md)).
- **Back-feed on USB only, controlboard attached but off.** The STM32 link pins (PE1, PB3, PB5, PG15) are 5 V-tolerant
  `FT_h` pins with no positive injection and at most 1.5 uA leakage (DS13313 rev 4, Table 7 note 3, Table 51). The
  only DC path into the dead controlboard rail is the ESP's internal CS pull-up into the controlboard's R29 10k.
  Upper bound 1.70 V (41 uA, only the controlboard's D6 / R46 LED load counted), 1.23 V below VIT+ min: PR1 cannot
  chatter. Firmware keeps MISO / HANDSHAKE / DATA_READY tri-stated while GPIO9 is low. Firmware disables the ESP CS pull-up (docs/FIRMWARE.md §2.2), which removes this path; then only the TPS2116 reverse leakage (<= 0.15 uA) and STM32 pin leakage remain. Bench check in TODO.

**U4 Microchip MCP1826S-3302E/DB** (LCSC C638624, DS22057B; replaces the out-of-stock AP7361C-33E-13, kept as
`MPN_ALT`, same SOT-223 pinout 1 VIN, 2 GND tab, 3 VOUT). 3.3 V +-2.5 %, 1 A, VIN 2.3-6.0 V, dropout 400 mV max at
1 A, so about 160 mV at the module's 403 mA peak: 3.3 V holds down to a VBUS of about 3.5 V. Stable with >= 1 uF
ceramic on the output, at most 22 uF recommended: C6 10 uF sits on the VOUT pin; C8 / C1 sit behind U3. At the
403 mA peak it dissipates (5.0 - 3.3) x 0.403 = 0.69 W (0.79 W at 5.25 V); with the SOT-223 theta-JA of 62 °C/W
that is a 43-49 °C rise even if the peak were continuous. Its tab is solid to the bottom GND pour (rule "LDO tab solid"); three GND vias sit
just outside the tab's north edge, (18.275, 35.775), (20.35, 35.75) and U7's GND via (21.5, 35.51). No via is inside
the tab, its mask opening or its paste.

**Module supply:** 3.0-3.6 V, source >= 0.6 A (MOD Table 6-2); peaks 313 mA at 2.4 GHz and 403 mA at 5 GHz (MOD
Tables 6-4 / 6-5).

**Capacitors:** C7 10 uF at U3 VIN1; C6 10 uF at U4 OUT (also U3 VIN2's capacitor, deviation 18); C8 22 uF + C9 100 nF
at U3 VOUT; C10 100 nF at U7 VDD; at the module (bottom, under its north-west corner) C2 100 nF across the pad-1 GND
and pad-2 +3V3 vias and C1 22 uF with its own via pair (HDG 1.3.2 asks for >= 10 uF); C5 4.7 uF on VBUS at the LDO.

**D4 Bourns CDSOD323-T03S** on +3V3_HOST at J2 (HDG 1.3.2: ESD protection at the power entrance). Unidirectional,
cathode to the rail. VRWM 3.3 V, VBR 4.0 V min at 1 mA, clamp 7.0 V max at 1 A, 500 W (8/20 us), 125 uA max leakage
at 3.3 V. Chosen because TI's flat-clamp family has no 3.3 V member and, among JLC-stocked 3.3 V TVS diodes, it has
the lowest clamp with VBR >= 4.0 V, so a +5 % host (3.47 V) stays below breakdown. No part this size holds a surge
under the module's 3.6 V maximum: D4 covers ESD and hot-plug edges. Placement: deviation 12.

**D3 red PWR LED** with R15 1.5k: (3.3 - 2.0) / 1.5k = 0.87 mA.

## 5. ESP32-C5 module

### 5.1 U1 ESP32-C5-WROOM-1U-N8R8 (either module)

The WROOM-1U-N8R8 is the BOM part. The WROOM-1-N8R8 (PCB antenna) is the fallback (MPN_ALT; LCSC C51950749, Mouser
356-ESP32C5WROM1N8R8). Both fit `ESP32-C5-WROOM-1_1U_DUAL`: pads 1-29 coincide; pads 30-32 are used by the 1U only
and keep the full Espressif land. N8R8 = 8 MB flash, 8 MB PSRAM.
- Pad 19 (GPIO15) is the PSRAM chip select on N8R8 and "cannot be used for other functions" (MOD Table 3-2 note 3):
  unconnected.
- ANT2 (pad 31) is unconnected; the 1U uses its own u.FL.
- EPAD to GND with 8 vias in the paste gaps (MOD Fig 9-2; deviation 19).

### 5.2 Pin map

| Signal | GPIO | Module pad | Notes |
|---|---|---|---|
| SPI CLK | 6 | 8 | IO_MUX FSPICLK |
| SPI MOSI | 7 | 9 | IO_MUX FSPID; strapping pin (JTAG source only) |
| SPI MISO | 2 | 4 | IO_MUX FSPIQ; strapping pin (MTMS); R4 33R series at the module |
| SPI CS | 10 | 12 | IO_MUX FSPICS0 |
| HANDSHAKE | 1 | 7 | ESP-Hosted HS; also XTAL_32K_N |
| DATA_READY | 0 | 6 | ESP-Hosted DR; also XTAL_32K_P |
| STATUS_LED | 8 | 10 | D1 green via R8 1.5k, active high (0.73 mA) |
| PWR_SRC_HOST | 9 | 11 | U3 ST, high = controlboard power |
| USB D- / D+ | 13 / 14 | 13 / 14 | USB Serial/JTAG via R5 / R6 22R |
| UART0 TX / RX | 11 / 12 | 25 / 24 | TP1 (via R7 499R) / TP2 |
| BOOT | 28 | 15 | R3 10k pull-up, SW2 to GND, C4 15 pF DNP |
| Reset | EN | 3 | R1 10k / C3 1 uF, R2 470R from the host, SW1 to GND |
| Unused | 3, 4, 5, 23, 24, 25, 26, 27 | | no-connect |

- 6 / 7 / 2 / 10 are the C5's IO_MUX SPI pins (EH recommends IO_MUX). HANDSHAKE / DATA_READY on GPIO1 / GPIO0 put
  every link pad in one run of the west pad column (pads 3-12, north to south EN, MISO, DR, HS, SCK, MOSI, CS).
- Strapping: GPIO2 and GPIO7 are strapping pins (CHIP Table 3-1) but do not select the boot mode; only GPIO26-28 do
  (CHIP Table 3-3). GPIO7 selects the JTAG source and is ignored with default eFuses (CHIP Table 3-7). GPIO0 / GPIO1
  are not strapping pins.

### 5.3 EN (reset)
- R1 10k to +3V3 and C3 1 uF to GND: the recommended power-on delay (HDG 1.3.3). EN never floats.
- Timing: rails stable >= 50 us before EN rises; a reset needs EN low >= 50 us (MOD Table 4-8). ESP-Hosted's host
  holds reset low 10 ms, then waits 500 ms (EH `spi_drv.c`).
- R2 470R joins EN to the controlboard's ESP_RST (STM32 PE1, open drain). With R1 it holds EN at
  3.3 x 470 / 10.47k = 0.15 V when pulled low, below 0.25 x VDD (MOD Table 6-3), and limits the current into C3 if the
  host pin is mis-set to push-pull.
- SW1 RESET pulls EN to GND.
- Controlboard off, radio on USB: PE1 is `FT_h` (no injection, <= 1.5 uA leakage, DS13313 rev 4). Worst case 11.5 uA
  through R1 + R2 gives EN = 3.18 V, above VIH = 2.48 V: the module leaves reset. Bench check in TODO; contingency
  only if the bench disagrees: a small Schottky (BAT54 / RB521 class) in series with R2, cathode toward J2.

### 5.4 BOOT
- R3 10k pull-up on GPIO28 (HDG 1.3.9). GPIO28 = 1 at reset: SPI boot; GPIO28 = 0 with GPIO27 = 1 (internal pull-up,
  pin unconnected): download mode, including USB (MOD Table 4-3).
- SW2 BOOT pulls GPIO28 low: hold it while pressing RESET.
- C4 15 pF is a footprint only (DNP): HDG 1.3.9 asks for it but warns that it can force download mode.

### 5.5 Debug and status
- UART0 (GPIO11 TX via R7 499R, GPIO12 RX) on TP1 / TP2, with TP3 GND, on the bottom under the module (HDG 1.3.7;
  HDG 1.5: keep UART0 for RF test firmware). Reachable only with the radio unmounted. TP1-TP3 are bare pads, excluded
  from the BOM and the position file.
- D1 green STAT on GPIO8, active high; D3 red PWR on +3V3.

## 6. USB

- J1 GCT USB4110-GF-A at the west edge (3.70, 33.50), rotation 270; shield to GND.
- R9 / R10 5.1k Rd on CC1 / CC2 (sink). CC1 / CC2 have no ESD part (deviation 20).
- Native USB Serial/JTAG on GPIO13 (D-) / GPIO14 (D+), Full-Speed only, no USB-UART bridge.
- U2 TPD4E05U06 on all four data contacts, flow-through, directly east of the J1 contacts: D+ 10 -> 1 and 7 -> 4,
  D- 9 -> 2 and 6 -> 5. Every contact meets its protector before any via or join. No supply pin, so an unplugged cable
  cannot hold a rail up through it.
- R5 / R6 22R in series right after U2, where the duplicate contacts join (HDG 1.3.13 suggests 22-33 ohm); deviation 2.
- D2 (contacts A4 / B9, north of U2) and D5 (A9 / B4, south of it) TVS0500 on the two VBUS contact groups, each in
  flow-through at its contacts before any via; the pair runs between the groups.
- F1 Bourns MF-MSMF075/33X-2: hold 0.75 A (0.56 A at 50 °C), trip 1.50 A, 33 V. The 403 mA peak sits under the hold.
- C5 4.7 uF on VBUS at the LDO (USB Device Capacitance ECN: 1-10 uF). Everything behind the LDO adds to the attach
  load, so the 10 uF inrush limit is exceeded: bench use (§10).
- Auto-download over USB stops working if the application disables the USB PHY or reuses GPIO13 / 14 (HDG 1.5):
  use BOOT + RESET.

## 7. Controlboard link

### 7.1 J2

Samtec LSHM-110-02.5-L-DV-A-S-K-TR (Razor Beam, 0.5 mm pitch, 2 x 10, shielded, hermaphroditic), bottom side at
(3.70, 6.03), rotation 90. The controlboard J9 is the same part; the two mate face to face with a 5 mm stack. The pin
table, the mating rule (radio pin p meets J9 pin p+1 for odd p, p-1 for even p), positions, holes and keep-outs are in
[../docs/INTERFACE.md](../docs/INTERFACE.md). On this board:

| J2 odd row (signals, north end = pin 19) | 19 EN, 17 GND, 15 MISO, 13 GND, 11 DATA_READY, 9 HANDSHAKE, 7 SCK, 5 GND, 3 MOSI, 1 CS |
|---|---|
| J2 even row | 2-14 GND, 16 / 18 / 20 +3V3_HOST; shield GND |

The odd-row order is the module-pad order, so every line runs from J2 to its pad without crossing another.
- Three +3V3_HOST pins carry the 403 mA peak, about 0.13 A per pin; LSHM is rated 2 A per pin with one pin powered per
  row (LSHM §3).
- Shield pins are paste-in-hole (2.00 mm apertures on B.Paste, verified in the paste export), per LSHM-FP rev G.

### 7.2 ESD (U5, U6)

Both TPD4E05U06, bottom side, flow-through, with no via, branch or bend between a J2 pin and its protector (one
45-degree jog on DATA_READY).
- U5 (7.85, 4.23), rotation 0, at J2's pins 11-19; each protected pin on the y of its J2 pin within 0.05 mm.
- U6 (8.42, 9.5), rotation 270, just south of J2's signal end; lines leave J2 east, turn 45 degrees south into U6's
  north (protected) row at 0.5 mm pitch and leave its south row southward. J2 pad to U6 pad: CS 2.53, MOSI 3.53,
  SCK 5.53, HANDSHAKE 6.53 mm of L4.

| Part | Pins 4 -> 7 | Pins 5 -> 6 | Pins 2 -> 9 | Pins 1 -> 10 |
|---|---|---|---|---|
| U5 | EN (J2 19) | unused | MISO (J2 15) | DATA_READY (J2 11) |
| U6 | SCK (J2 7) | HANDSHAKE (J2 9) | MOSI (J2 3) | CS (J2 1) |

GND: J2 pin 17 runs into U5 pin 3 with a via (6.75, 4.25); pin 13 has its own via (6.65, 5.28); U5 pin 8 its own via
(8.85, 4.23). J2 pin 5 -> via (6.75, 7.28) -> 0.25 mm track between SCK and MOSI -> U6 pin 3, pin 8 tied across
(deviation 15). The module is rated HBM +-2 kV / CDM +-500 V (MOD §12).

### 7.3 Pulls and termination
- The controlboard holds CS up (R29 10k) and HANDSHAKE / DATA_READY down (R31 100k, R32 10k). This board adds no pulls
  on the link lines. Once running, ESP-Hosted enables internal pull-ups on MOSI / SCLK / CS and pull-downs on MISO /
  HS / DR (EH `spi_slave_api.c`); during reset and ROM boot the controlboard pulls hold the levels.
- R4 33R on MISO is source termination at the driver (the module), on the top in line on the pad-4 tail, 0.8 mm from
  the pad. Espressif publishes no output impedance; at the default drive strength 33R plus the driver is close to
  50 ohm. SCK and MOSI are source-terminated at their driver on the controlboard (R65 / R66 30R). CS has no series
  resistor (one edge per frame).

## 8. PCB

### 8.1 Placement

| Area | Side | Parts |
|---|---|---|
| North-west corner | Bottom | J2 (3.70, 6.03) rot 90; U5 (7.85, 4.23) rot 0; U6 (8.42, 9.5) rot 270 |
| North-west corner | Top | D4 (2.50, 4.63) over J2's power pins; R2 (9.0, 2.3) EN 470R |
| West strip | Top | L1 link runs (DR, MISO with R4 (9.29, 12.8), EN); SW1 RESET (3.45, 18.2); D1 / R8 STAT, D3 / R15 PWR |
| Module north-west corner | Bottom | C2 / C1 at the pad-1 / pad-2 vias; C3 / R1 (EN RC) at the pad-3 via |
| East | Top | U1 (19.85, 17.9) rot 0, antenna area in the north-east corner |
| South-west | Top | J1 USB-C (3.70, 33.50) rot 270; U2 (9.5, 33.5) USB ESD; D2 / D5 VBUS TVS; R5 / R6 |
| South | Top | SW2 BOOT (18.3, 32.2); U3 (26.5, 31.3) with C7, C9, R12, R13; C10 (23.1, 34.25); U7 (23.1, 37.3); C8 (18.45, 38.6) |
| South | Bottom | F1 (14.7, 31.8), C5, U4 (21.36, 34.0) rot 270 with C6 at its OUT pin; R9 / R10 |
| Under the module | Bottom | TP1 / TP2 / TP3 (25.8, 12.0 / 14.8 / 17.6), R7; R3 / C4 (BOOT) |
| Holes | | H1 (14.0, 37.5), H2 (27.4, 37.5), M2, 2.4 mm keep-out radius |

Bottom-side SMT parts: J2, U5, U6, C1, C2, C3, R1, F1, C5, U4, C6, R9, R10, R3, C4 (DNP), R7 (plus the bare pads
TP1-TP3): the board needs double-sided assembly.

### 8.2 Stackup (JLC04161H-3313, 1.6 mm)

| Layer | Thickness | Use |
|---|---|---|
| L1 F.Cu | 0.035 mm | Parts, USB pair, L1 link runs, GND pour `GND_L1` |
| prepreg 3313 | 0.0994 mm, Er 4.1 | |
| L2 In1.Cu | 0.0152 mm | Solid GND `GND_L2`; only cut: the antenna strip |
| core FR4 | 1.265 mm, Er 4.6 | |
| L3 In2.Cu | 0.0152 mm | +3V3 plane `P3V3_L3` east of x 11.6 and south of y 24.2; higher-priority GND regions `GND_L3_LINK` (x 0-11.6, y 0-24.2, to x 10.1 for y < 7.5, tab x 11.6-13.1 / y 15.9-17.6 under HANDSHAKE's turn) under every L4 link line, and `GND_L3_USB_HOP` (x 9.7-11.2) under the USB D- hop |
| prepreg 3313 | 0.0994 mm, Er 4.1 | |
| L4 B.Cu | 0.035 mm | U6 link bundle, power, slow nets, GND pour `GND_L4` |

L4 signals reference the L3 GND regions across the 0.0994 mm prepreg (CLAUDE.md §4: GND region under the corridor).
Mask: LPI 0.010 mm, Er 3.8.

### 8.3 Net classes, widths and impedance

Impedance from a 2D finite-difference field solver (direct solve, 4 um and 2.5 um grids, grounded box 2.5 mm each
side), Cu 0.035 mm, prepreg 0.0994 mm Er 4.1, conformal mask 0.010 mm Er 3.8. Closed-form Hammerstad-Jensen gives
53-54 ohm uncoated for the link line, consistent.

| Class (net-class / rules) | Nets | Width / gap | Impedance (with mask) | Layers |
|---|---|---|---|---|
| Fast, link | ESP_SPI_*, ESP_HANDSHAKE, ESP_DATA_READY, ESP_EN (J2 to R2), Net-(U1-GPIO2) | 0.15 mm (rule 0.14-0.16); >= 0.3 mm to other signals | 52.4-52.8 ohm (54.2-54.5 uncoated) | L1 over L2, L4 over the L3 GND region |
| Fast, USB pair | /USB/*, Net-(U1-GPIO13/14 ...) | 0.19 / 0.31 mm (0.5 mm pitch; rule 0.18-0.20 mm) | 88.7-89.5 ohm diff (91.6-92.1 uncoated) | L1 over L2 |
| Power | +3V3, +3V3_HOST, VBUS, raw VBUS, /Power/VIN2_USB | 0.25-0.4 mm (0.2-0.3 mm into U3's 0.5 mm pitch pins), 0.2 mm clearance | width from current | L1, L4, pours |
| Default | EN node after R2, slow GPIO | 0.15-0.3 mm, 0.15 mm clearance | not controlled | L1, L4 |

Both controlled lines are inside +-10 % (the USB pair is 1 ohm under 90 ohm; USB Full-Speed allows 90 ohm +-15 %).
0.18 / 0.32 mm would give 91.9 ohm but needs a re-route of the pair; not done. Confirm in JLC's calculator before
ordering (TODO). Vias: all 0.45 / 0.25 mm (111 vias, 80 GND).

Reference check (layout work folder `refchk.py`: track centre and +-0.45 mm sideways every 0.1 mm, zones filled):
every link and USB track is over GND on its reference layer, except samples inside the antipad of the line's own or a
neighbouring via.

### 8.4 Link routing

- **U6 lines (HANDSHAKE, SCK, MOSI, CS) on L4** over `GND_L3_LINK`. After U6 they run south in a bundle (CS x 7.42,
  MOSI 7.92, SCK 8.92, HANDSHAKE east of it), each to one via at its module pad's y with a GND return via 0.64-0.86 mm
  away, then a short L1 tail east into the pad's outer end. CS (via (10.1, 22.96)) is the longest geometric run and
  carries no serpentine. SCK (via (9.2, 17.88)) and MOSI (via (9.235, 19.15)) carry their serpentines right after U6
  (source end for the controlboard-driven lines). HANDSHAKE runs a 45-degree diagonal to x 11.0 and takes a via in the
  west pad band (12.55, 16.61) into pad 7's inner end.
- **U5 lines (EN, MISO, DATA_READY) on L1** over L2. Each changes layer once right after U5 (vias EN (9.0, 3.38), MISO
  (9.42, 4.73), DR (8.79, 5.4); GND return vias (8.85, 4.23) and (8.3, 5.78)), then runs south nested EN east / MISO /
  DR west straight into pads 3 / 4 / 6. MISO carries its serpentine (1-6 mm from its driver) and R4 at pad 4. EN
  crosses R2 first (deviation 13).
- No line crosses another, doubles back or changes layer twice; all bends 45 degrees. Closest Fast-to-Fast edge gap on
  the outer layers 0.303 mm (DATA_READY to MISO, L1); closest Fast track to a foreign Fast pad 0.255 mm.

### 8.5 USB routing

J1 contacts -> U2 flow-through (all four data contacts, L1, before any via) -> R5 / R6 (the duplicate joins) ->
module pads 13 / 14 on L1 over L2. The A7 (D-) branch takes a two-via L4 hop over `GND_L3_USB_HOP`, return vias 0.97 /
0.98 mm. One 45-degree trapezoid bump on D- right after R5 (0.199 mm high, 0.6 mm flat, x 12.401-12.600 (centrelines), y 30.70-31.70)
matches orientation B. D2 / D5 outputs drop to L4 and meet at F1.

### 8.6 Length tables

Measured 2026-11-07 on the saved repo board (layout work folder scripts `llen.py`, `usbskew.py`).

**Link.** Matching definition (`llen.py`): track sum + 1.6 mm per via + the R4 span (1.02 mm pad centre to pad
centre), from the J2 pad centre to the end of the track inside the module pad (every L1 tail ends 0.40 mm inside its
pad's outer end). Tolerance +-0.05 mm within the matched group. The board is matched on its own; the controlboard
matches its side ([../docs/INTERFACE.md](../docs/INTERFACE.md) gives the whole-link figure).

| Line | Length (mm) | Pad centre to pad centre (mm) | Vias | vs SCK | Note |
|---|---|---|---|---|---|
| SCK | 19.934 | 20.334 | 1 | 0.000 | 4 one-sided bumps, 0.4475 mm |
| MOSI | 19.934 | 20.334 | 1 | 0.000 | 5 one-sided bumps, 0.426 mm |
| CS | 19.934 | 20.334 | 1 | 0.000 | longest by geometry, no serpentine |
| MISO | 19.934 | 20.384-20.389 | 1 | 0.000 | 6 centred legs +-0.431 mm, plus R4 |
| HANDSHAKE | 18.453 | 18.853 | 1 | not matched | deviation 3 |
| DATA_READY | 18.745 | 19.145 | 1 | not matched | deviation 3 |
| EN (J2 to R2 pin 1) | 5.765 | 5.815-5.821 | 1 | not matched | slow reset line |

The pad-centre column is the shortest copper path pad centre to pad centre (Dijkstra, 1.6 mm per via, R4 span), from
two independent path searches that differ by up to 0.006 mm. MISO reads 0.05 mm more by that convention because its
J2-to-U5 run sits 0.025 mm off each pad's centre; that is pad copper the signal does not travel. Skew either way is
under 0.4 ps.

**USB** (contact to module pad, pad centre to pad centre, 1.6 mm per via, R5 / R6 span included):

| | D+ | D- | D- minus D+ |
|---|---|---|---|
| Branches (contact to R5 / R6 pad 2) | A6 4.033, B6 4.497 | A7 9.291, B7 3.814 | |
| Trunks (R5 / R6 to the module, R span included) | 12.858 | 13.541 | |
| Orientation B (B6 / B7) | 17.355 | 17.354 | **-0.001 mm** (rule 0.15 mm) |
| Orientation A (A6 / A7) | 16.891 | 22.832 | **+5.941 mm** (deviation 2) |

### 8.7 Termination and protection (summary)

| Part | Where | Why |
|---|---|---|
| R4 33R | MISO, at module pad 4 | Source termination at the driver |
| R5 / R6 22R | USB D- / D+, right after U2 | HDG 1.3.13 damping; at the duplicate joins (deviation 2) |
| R2 470R | EN, between J2 and the EN RC | Limits current into C3 from a mis-set host pin; EN low level 0.15 V |
| R7 499R | UART0 TX to TP1 | HDG 1.3.7 |
| U5 / U6 TPD4E05U06 | All seven link lines, at J2 | ESD at the mating connector, flow-through |
| U2 TPD4E05U06 | USB data contacts A6 / A7 / B6 / B7 | ESD at the USB connector, flow-through |
| D2 / D5 TVS0500 | VBUS contact groups | Surge / ESD on VBUS before F1 |
| D4 CDSOD323-T03S | +3V3_HOST at J2 | ESD / hot-plug at the power entrance (§4) |
| F1 MF-MSMF075/33X-2 | VBUS | Overcurrent on USB power |

### 8.8 Custom DRC rules (`RadioBoard2027_C_Inboard.kicad_dru`)

Every number carries units. Compilation was proven with a deliberately violated test rule (5 mm minimum width on the
Fast class: 197 violations; removed afterwards) and with physical test items (below).

| Rule | Constraint | Why |
|---|---|---|
| Power nets | 0.2 mm clearance, 0.2 mm minimum width | Current-carrying nets |
| Link 50 ohm width | 0.14 / 0.15 / 0.16 mm, `(layer outer)` | Holds the 50 ohm width |
| Link pour clearance | 0.3 mm (2W) to zones, `(layer outer)` | Same-layer pour must not turn the line into a coplanar guide; scoped to outer layers so inner-plane antipads stay normal |
| USB width | 0.18 / 0.19 / 0.20 mm, `(layer outer)` | Holds the pair width |
| USB pour clearance | 0.40 mm (2W) to zones, `(layer outer)` | Same reason |
| Fast spacing | 0.3 mm from a Fast track to any non-Fast, non-GND track or via | 2W edge gap; GND return vias may sit closer |
| Fast to Fast spacing | 0.3 mm between tracks / vias of different Fast nets, outer layers; the two USB lines exempt from each other | 3W centre to centre between fast lines; also the lower bound of the USB pair gap |
| Fast track to Fast pad | 0.24 mm from a Fast track or via to another Fast net's pad, outer layers; USB pair exempt from itself | Catches tracks and vias passing foreign pads; every pad entry keeps >= 0.25 mm |
| Link GND pins without spokes | `min_resolved_spokes 0` on J2 / U5 / U6 GND pads | Joined by track; no room for spokes at 0.5 mm pitch |
| LDO tab solid | `zone_connection solid` on U4 GND | Heat (up to about 0.8 W at 5.25 V VBUS) |
| Antenna keep-out | disallow track / via / pad in `ANTENNA_KEEPOUT` or `ANTENNA_KEEPOUT_INNER` | Rule areas are not enforced by DRC in this setup (deviation 7) |
| No top tracks under the module body | disallow track on F.Cu in `KEEPOUT_MODULE_TOP` | Same |
| Standoff keep-out | disallow track / via in `STANDOFF_KEEPOUT` | Same |

Board text rule: 1.0 mm minimum height, 0.15 mm minimum stroke (JLC minimum), DRC-enforced. The rules and net-class
patterns use some auto-generated net names (deviation 21).

Proofs on a copy of the board (discarded afterwards): test tracks in the antenna area on L1, L4 and L2, a via in the
antenna area, an L1 track under the module body and an L4 track in the H2 standoff keep-out: all 6 flagged
`items_not_allowed`. Two Fast test tracks 0.2 mm apart: flagged by "Fast to Fast spacing". An SCK test track 0.200 mm
from R4 pin 1 and an SCK test via (tied to a short SCK track, so it keeps its net) 0.205 mm from R4 pin 2: both flagged
by "Fast track to Fast pad". Raising the Fast-to-Fast minimum to 0.36 mm fires 42 violations.

### 8.9 Rule areas

| Area | Extent | Layers | Purpose |
|---|---|---|---|
| `ANTENNA_KEEPOUT` | x 10.1-30.1, y 0-7.5, notched round U1 pads 30-32 | L1 | No track / via / pad under the WROOM-1 antenna |
| `ANTENNA_NOPOUR_L1` | full strip | L1 | No pour, including the notch (0.000 mm2 of fill in the strip on every layer, measured) |
| `ANTENNA_KEEPOUT_INNER` | full strip | L2-L4 | No copper |
| `KEEPOUT_MODULE_TOP` | x 12.9-27.3, y 7.5-28.5 | L1 | No top tracks under the module body; 0.8 mm pad bands inside both pad columns stay open for pad stubs; vias allowed |
| `STANDOFF_KEEPOUT` | r 2.4 mm round H1 / H2 | L1, L4 | Standoff and screw-head clearance |
| `NO_POUR_LINK_LANES` | x 6.3-10.05, y 2.6-8.75 | L4 | No pour slivers in the J2 -> ESD fan-out |
| `NO_POUR_WEST_EDGE` | x 0-0.45, y 1.2-27.2 | L1 | No sliver west of the +3V3_HOST rail |

### 8.10 Power routing

- +3V3_HOST: J2 pins 16-20 -> L4 west -> via (0.55, 3.78) -> L1 -> D4 cathode pad (flow-through) -> L1 along the west
  edge -> via (0.65, 26.8) -> L4 east -> via (23.0, 29.4) -> C7 pad 1 -> U3 pins 3 / 5, and C7 -> C10 pad 1 -> U7 VDD.
- VIN2: U4 OUT -> C6 -> via (28.1, 31.9) -> U3 pin 6 (deviation 18). Nothing is routed under U4.
- VOUT: U3 pins 2 / 7 -> +3V3 plane via (28.1, 31.05) -> C9; C8 has its own plane and GND vias.
- PR1: one run U3 pin 4 -> R12 -> U7 RESET. ST: module pad 11 -> via (12.55, 21.69) -> L4 -> U3 pin 8 -> R13.
- Module +3V3: L3 plane -> pad-band via (12.55, 10.26) -> 0.45 mm long, 0.4 mm wide L1 stub -> pad 2. C2 across this
  via and the pad-1 GND via (12.55, 8.99); C1 beside it with its own via pair.
- Return vias of the U3 area: C7 (24.0, 29.4), C9 (28.6, 32.7), C10 (23.1, 33.1), U3 pin 1 (26.05, 29.325) shared with
  C6's GND on the bottom, U7 pin 3 (21.5, 35.51).

### 8.11 Stitching

GND stitching on a grid where it fits (none under the J2 housing) plus a gap pass: no point of the L1 or L4 GND pour is
more than 4.68 mm from a GND via (scripted). Islands removed.

### 8.12 Silkscreen

All text 1.0 mm high, 0.17 mm stroke (JLC: 1.0 mm minimum height, 0.15 mm line, 0.15 mm to pads). Reference
designators are on the fab layers (one per part); the silkscreen carries function labels: top RESET, BOOT, USB, STAT,
PWR, ANT, U1; bottom TX, RX, GND, LINK, the board name. "USB" stands vertically between R5 / R6 and SW2 (no 1.0 mm room
at J1's ends). "STAT" uses 0.85 mm wide glyphs to end before U1's courtyard. "ANT" (26.1, 6.9) is 2.5 mm north of the
1U's u.FL; it lies inside the dual footprint's courtyard only because that includes the WROOM-1 antenna, and it is
hidden under the antenna on a WROOM-1 build (accepted). No silk on pads or off the board.

### 8.13 Cleanliness scan

Layout work folder scripts (`clean.py`, `padscan.py`): no off-45-degree segment, no duplicate or collinear joins, no
off-pad T-junction, no dangling end, no width step away from a pad, no corner sharper than 135 degrees (vias
included). No via inside or touching a pad except the 8 EPAD gap vias and U2's GND via (deviation 14); no foreign-net
track between the pads of one part; no silk over silk. Short segments: deviation 11.

## 9. Deviations from the layout rules

Each item was checked on the saved board file on 2026-11-07.

1. **Link serpentines.** House rule: amplitude <= 3W (0.45 mm), legs >= 4W apart. SCK has 4 one-sided bumps
   (0.4475 mm) and MOSI 5 (0.426 mm) on L4 right after U6: within 3W, bump legs 0.75 mm apart (5W). Between pieces of
   the same line more than 0.66 mm apart along it, the closest approach is 0.618 mm centre to centre (0.468 mm edge,
   about 4W); only the two corners of one bump top (0.148 mm flat) are closer. MISO has 6 legs centred on its L1 run,
   +-0.431 mm (0.86 mm peak to peak, 5.7W, above the 3W amplitude rule), legs 0.75 mm apart: one-sided 3W bumps
   cannot add MISO's length in the run it has. The whole meander is about 30 ps: negligible at 40 MHz.
2. **USB.** (a) R5 / R6 sit right after U2, about 12 mm of track from the module, not within 5 mm of the driver: they
   are the duplicate-contact joins, and at the module the joins would become off-pad T-junctions. Full-Speed only
   (83 ns bit, 4-20 ns edges), so their position along 12 mm (about 80 ps) does not matter. (b) Orientation B is
   matched (-0.001 mm), orientation A is not (+5.941 mm, about 40 ps: 0.05 % of the bit, 0.2-1 % of the edge).
   **Signed off** under the user's instruction "if not possible for both sides, compromise and match just one
   side" (the final audit recorded it as major M1 against the 0.15 mm rule).
   Matching both needs 5.95 mm extra on the A6 branch alone, which lies in a 1.2 x 1.0 mm pocket between U2 pin 4 and
   R6 pad 2 with no room for a meander or a hop. The Overhang's both-orientation fix (D+ A6 hop, R5 / R6 moved, D-
   trunk serpentine) was evaluated and does not fit: it needs R5 / R6 at least 0.6 mm further east, which runs the
   trunk lanes into SW2's courtyard; moving SW2 (the BOOT / RESET access) for 40 ps is not justified. (c) The D-
   duplicate hop passes 0.17 mm from the D+ duplicate leg; the Fast-to-Fast rule exempts the pair from itself. (d) At
   the J1 contacts the 45-degree escape jogs (x 8.2-8.45, y 32.5-34.5) are not concentric: for about 0.35 mm each the
   pitch drops to 0.354 mm (0.164 mm gap). (e) The west 45-degree bend of the trunk is not concentric (final audit
   m5): D- turns (10.15, 29.25) -> (9.90, 29.00) and D+ (10.90, 28.75) -> (10.40, 28.25), so the pitch opens to
   0.884 mm (0.69 mm gap) through the bend. Harmless at Full Speed; make it concentric on the next layout pass.
3. **HANDSHAKE and DATA_READY are 50 ohm but not length-matched** (18.453 / 18.745 mm against 19.934 mm). ESP-Hosted
   uses them as asynchronous status lines.
4. **Inner planes use 0.15 mm clearance and 0.1 mm minimum fill** (JLC inner-layer capability).
5. **Vias under the module are tented**: the 8 EPAD gap vias, the pad-band vias (pads 1, 2, 3, 7, 11, 15, 24, 25,
   28, 30, 32), the antenna-line GND fence (y 8.35) and the stitching under the body. Order all vias tented.
6. **J2's courtyard reaches 0.25 mm past the north edge** (courtyard only; fixed by the shared interface).
7. **Rule areas are enforced by custom rules.** DRC in this KiCad 10 setup does not test rule areas; three `disallow`
   rules keyed to the area names do, proven with test items (§8.8).
8. **The 1U pads 30-32 reach 0.7 mm into the WROOM-1 antenna strip on L1.** They are the 1U's own pads.
   `ANTENNA_KEEPOUT` is notched round them; `ANTENNA_NOPOUR_L1` covers the full strip, so no pour fills the notch.
9. **The WROOM-1 build needs its own stencil**: no paste on U1 pads 30-32 (else solder bumps form under the antenna
   PCB). The board is the same for both builds.
10. **Own-pin ties under parts.** U3 VOUT pin 2 to pin 7 and VIN1 pin 3 to pin 5 (TI layout example); U6 GND pin 8 to
    pin 3 (TI DQA flow-through layout); the J2 even row joined along its own pad row (+3V3_HOST 16-20, GND 2-14), exits
    leaving west outside the body. Nothing else passes under a part.
11. **Short segments.** 172 of 381 track segments are shorter than 0.5 mm: serpentine legs and corners of MOSI, SCK
    and MISO (item 1), 45-degree bend chamfers, and pad or via necks. None is a leftover (§8.13).
12. **D4 sits on the top side, one via from J2.** J2's body covers the bottom from x 1.16 to 6.24 and its pegs and
    shield tails are through-holes, so no bottom spot is nearer than about 8 mm of track. On the top at (2.50, 4.63):
    J2 pins 16-20 -> 1.3 mm of L4 -> via -> 1.2 mm of L1 -> D4 cathode (flow-through) -> rail, about 2.5 mm. The anode
    pad has no track or via of its own: it is joined solid to `GND_L1`, which reaches L2 through the GND vias at
    (6.75, 4.25) / (6.65, 5.28), 3.2 mm away, and through J2's north shield PTH (GND on every layer and on the
    controlboard J9), 3.7 mm away. No via sits under the J2 housing.
13. **EN takes a north loop.** EN leaves U5 through a via, crosses R2 on the top and branches at R2 pin 2: east of the
    link lines to pad 3, and west over J2 to SW1. With the link lanes in place pad 3 cannot be reached from the west on
    either outer layer, so the EN RC (R1 / C3) sits on the bottom at the pad-3 band via. EN is a 10k / 1 uF node.
14. **Return vias; one via touches a pad.** Every link and USB layer change has a GND via 0.62-0.98 mm away (DR 0.62,
    HS 0.64, CS 0.81, MOSI 0.82, SCK 0.86, MISO 0.76, EN 0.86; USB hop 0.97 / 0.98). Protector GND pads are 0.34-0.49 mm
    (pad edge to via centre) from their vias, except U6 (item 15) and U2: U2's GND pins 3 / 8 are enclosed on L1 by the
    USB lines, so its only GND via is (8.72, 33.5) west of pin 8 (pin 3 tied to pin 8 under the body). That via's ring
    overlaps pad 8's west end by 0.1 mm: between J1's 0.5 mm-pitch escapes no site clears the pad. Order it plugged.
15. **U6's GND reaches its via over about 3.3 mm of track.** U6's pass-through side faces south below the antenna strip
    so the four U6 lines leave at full 3W; its GND pins (3 and 8, tied across) can only reach a via westward, along a
    0.25 mm track between the SCK and MOSI lanes to (6.75, 7.28) beside J2 pin 5 (3.33 mm pin 3 to via, 4.5 mm to J2
    pin 5; about 3 nH, about 100 V extra at an IEC 61000-4-2 contact edge). A via next to U6 would sit under the MISO /
    DATA_READY L1 runs; (8.42, 8.4) and (8.42, 10.5-10.6) were checked and hit the MISO serpentine. Accepted: the link
    sees ESD only during mating.
16. **C2 shares the module's pad vias**: pad -> 0.8 mm L1 -> via -> 0.7 mm L4 -> C2, the shortest loop under the
    module. C1 has its own via pair.
17. **EN runs along the antenna edge**: 11.6 mm from R2 to pad 3, 5.5 mm of it at x 10.02 just inside the WROOM-1 strip
    boundary (where L2 ends), plus a 16.6 mm branch to SW1. C3 (1 uF) 3.5 mm from pad 3 with its own GND via filters
    pickup at the pin.
18. **U3 VIN2 has no capacitor of its own.** Its capacitor is C6 (the LDO output cap) on the bottom: pin 6 -> 1.0 mm
    L1 -> via (28.1, 31.9) -> 2.3 mm of 0.4 mm L4 -> C6, about 3.3 mm and one via. A 0402 at the pin does not fit: the
    1.07 mm between U3's east pads and C9 holds the VIN2 and +3V3 vias. VIN2 is a slow LDO output; the switchover step
    is carried by the VOUT caps (C9 at the pin, C8, C1). U3 pin 1's GND via (0.95 mm, pad edge) is shared with C6.
19. **The 8 EPAD gap vias have about 0.075 mm of mask web to the paste openings** (0.45 / 0.25 mm vias in the 0.40 mm
    gaps between 1.3 mm sub-pads). Order them plugged / filled and capped, or at least tented with the fab told they
    sit under a paste-printed pad. They are the only vias inside a pad's mask opening.
20. **CC1 / CC2 have no ESD protection** (CLAUDE.md §12: protection on every external pin). Only R9 / R10 sit on
    them; no protector was fitted. Open item.
21. **The diff-pair gap is not DRC-checked as a pair, and some rules key on auto-generated net names.** A
    `diff_pair_gap` rule only sees `/USB/USB_DP` / `/USB/USB_DN`, which exist only in the 3-5 mm fan-out at J1 / U2; the
    12 mm coupled run after R5 / R6 is on auto-named nets KiCad does not pair. The gap is held from below by
    "Fast to Fast spacing" (0.31 >= 0.30 mm). The rules and net-class patterns also use `Net-(U1-GPIO2)`,
    `Net-(D2-IN-Pad4)` and `Net-(U1-GPIO13/14 ...)`: a re-annotation or pin rename would silently stop them matching.
    Fix: named net labels in the schematic (TODO).
22. **Schematic readability and ERC settings** (CLAUDE.md §1): A3 sheets mostly empty; U1, C1, C2, ANT1 and R4
    outside the boxes on 02_ESP32; the GPIO28 wire crosses groups; value text overlaps (U1, C1 / C2, C5, C7, "8" over
    D2); D2 / D5 GND symbols upside down; two floating-looking no-connects on U1's hidden NC pins; the +3V3_HOST
    PWR_FLAG on the Power sheet, not at J2; the 01_Power note quotes 0.3-0.4 mm power widths. The .kicad_pro has no
    `erc` section, so KiCad's defaults leave four ERC checks off; with all checks on, ERC gives 3 warnings (footprint
    filters on F1 / U1, the 4-way junction at SW2 / R3). Listed in TODO.

## 10. Open issues

- **WROOM-1 antenna over controlboard copper.** The antenna area is inside this board, so on a WROOM-1 build it sits
  5-7 mm above the controlboard, which has filled copper on every layer under the strip (controlboard x 46.1-66.1,
  y 0-7.5). Espressif asks for about 15 mm clearance. Treat the WROOM-1 build of this variant as unlikely to reach full
  range: clear the controlboard copper there (a controlboard change) or drop the fallback; measure RSSI against a
  devkit before relying on it. The 1U build is not affected.
- **Antenna gain at 5 GHz (1U build).** FXP831 peak gain is 5.49 dBi in free space and 7.24 dBi on 2 mm ABS at 5 GHz
  (TAO §2); the module was certified with <= 3.65 dBi at 5 GHz (MOD p.53). Cap 5 GHz TX power, restrict to 2.4 GHz, or
  choose a lower-gain antenna. Confirm the MHF I plug.
- **Bench checks with the controlboard attached but off** (radio on USB): +3V3_HOST at most 1.70 V (must stay below
  2.93 V); EN about 3.2 V.
- **Switchover transient** USB-to-host and back: bench check.
- **Module supply margin** during 5 GHz TX from a 3.30 V controlboard rail: measure at C1.
- **USB inrush**: C5 plus everything behind the LDO exceeds the 10 uF attach limit. Bench use only.
- **TPD4E05U06 land**: U2, U5, U6 use the stock KiCad USON-10 pads, not TI's DQA0010A land pattern. Compare.
- **Impedance**: confirm the widths in JLC's calculator for JLC04161H-3313 and order with impedance control.
- **Part data**: C7 10 uF 0603 is about 5-6 uF at 3.3 V; no DNP caps reserved on USB D+ / D-.
- **3D models** of U1 (body), J1 and F1 do not resolve in renders (cosmetic).

## 11. BOM and sourcing

JLCPCB assembly first; the BOM files are in [bom/](bom/) (2026-11-07, see bom/README.md). Not stocked at JLCPCB: U1
(Mouser 356-ESP32C5WRM1UN8R8 or Digi-Key product 27566801; 0 at Mouser on 2026-11-07) and ANT1 (Taoglas
FXP831.07.0100C, Mouser 960-FXP831070100C or Digi-Key 931-1121-ND, BOM only, fitted with the 1U only); their
`Sourcing` fields say where to buy. J2 is JLCPCB-assembled: LSHM-110-02.5-L-DV-A-S-K-TR is C3643542, 37 at JLCPCB on
2026-11-07, 2 per board set with the controlboard J9 = 18 board sets. U4 is the MCP1826S-3302E/DB (C638624, 1,766 at
JLCPCB); the AP7361C-33E-13 (0 everywhere) stays as `MPN_ALT`. The WROOM-1-N8R8 fallback (LCSC C51950749) had 0 stock on 2026-11-07. Stock on 2026-11-07
(JLC parts database): D1 C5875754 1,019 (low; re-check); D4 C3702214 5,524; U7 C1852117 2,880; resistors C25744,
C25092, C25741 in the millions. Resistors are UNI-ROYAL 0402WGF thick film, 1 %, with the Yageo / Panasonic part as
MPN_ALT. TP1-TP3 are bare pads (excluded from the BOM and the position file); C4 is DNP. Every Datasheet field links a
maker PDF (checked with an HTTP request on 2026-11-07).

---

## Appendix: review history

Audit reports and scripts are in the layout work folder (not in the repo). Every finding was reproduced on the files
before it was fixed or recorded.

| Round | Date | Findings | Key outcomes |
|---|---|---|---|
| First layout | 2026-11-07 | - | Layout finished from the earlier checkpoint; TPS2116 cluster hand-placed; slow and power nets scripted (no autorouter copper); part data aligned with the Overhang |
| Schematic revision (both variants) | 2026-11-07 | - | J2 signal row reversed to module-pad order (EN at pin 19 ... CS at pin 1) with new U5 / U6 channels; the controlboard took the reversal on its side with the PB6 / PB7 swap. D4 TVS0500 on +3V3_HOST replaced by Bourns CDSOD323-T03S (the TVS0500's 6.5 V VBR / 9.2 V clamp did not conduct before the TPS2116 and the module were over their limits). Datasheet links to maker PDFs |
| Audit 1 | 2026-11-07 | 7 major, 23 minor | Fast-to-Fast rule added (lanes were 0.204 mm); D4 replaced and moved to J2; link re-placed and re-routed monotone (was 33.6 mm with a via staircase and a MISO trombone); module supply neck removed (pad-band via in the main plane); USB pair re-solved with a field solver (0.19 / 0.31 mm); protectors at J2; keep-outs extended and proven. Rejected: R5 / R6 at the driver (they are the duplicate joins). Deferred: auto-named nets in rules, ERC settings |
| Audit 2 | 2026-11-07 | 3 major, 13 minor | PR1 divider (R11 / R12, rising threshold as low as 2.53 V) replaced by the TPS3840PL29 supervisor U7 with R12 100k pull-down: 2.93-3.07 V rising, 2.86-2.94 V falling. D4 on the Bourns land, anode to the J2 shield / pour. Fast-track-to-pad rule added; USB hop GND region widened to 3W. WROOM-1 antenna over controlboard copper recorded |
| Audit 3 | 2026-11-07 | 1 major (carried), 10 minor, plus the Overhang round-3 items | C10 added at U7 VDD; TP3 added to the schematic; R14 (hysteresis resistor without a function) removed, PR1 one run; 01_Power readability (box titles, `VIN2_USB` labels, title blocks, root page 1). U6 rotated 270 and moved south of J2: full 3W fan-out, cost recorded (deviation 15). J2 on the paste-in-hole LSHM footprint (Overhang MAJOR). Resistor MPNs set to the LCSC part (UNI-ROYAL, 1 %; the "5 %" claim rejected). Impedances re-stated from the direct solver (about 2 ohm lower than the old SOR solver) |
| Audit 4 (convergence) | 2026-11-07 | 0 critical, 0 new major, 10 minor | EN and back-feed analyses corrected: PE1 is `FT_h` (no clamp), EN = 3.18 V worst case, back-feed bound 1.70 V; FET proposal dropped, Schottky kept as contingency. C10 moved in line at U7 pin 2. U4 tab vias moved out of the pad and paste. Silk raised to 1.0 mm, board text rule 1.0 / 0.15 mm; off-board footprint triangle removed. Descriptions and box titles fixed |
| Overhang audit-4 classes scan | 2026-11-07 | 6 classes | New `padscan.py` check: vias moved off C8 / C6 / C5 / SW1 / U7 pads, gap-fill keeps clear of every pad; U2 GND via accepted (deviation 14); STAT glyphs and U1 reference moved off courtyards; "ANT" accepted |
| USB skew | 2026-11-07 | - | One D- bump after R5 matches orientation B to 0.001 mm; the both-orientation fix of the Overhang evaluated and rejected here (needs SW2 moved; deviation 2) |
