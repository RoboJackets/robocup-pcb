# ControlBoard2027 Design Notes - !!!NOT AUTHORITATIVE!!!

Why each part and value on this board was chosen, the firmware settings the hardware
depends on, and the issues still open. Schematic notes point to sections here by number
(for example "DESIGN_NOTES §3") and to open issues by ID (for example "M7").

Datasheets are the reference for every number. Where a value comes from a calculation,
the inputs and the source table are given.

2026-09-16 feedback revision: see `review/REVIEW.md` for changes, validation and
remaining qualification work. This is a schematic review, not a finished PCB impedance or
power qualification.

2026-09-29: the schematic was re-annotated. Every reference designator in this document
matches the current schematic netlist.

2026-09-30: the board was laid out again from scratch after the layout review (flow-through
TVS arrays, SD and SPI signal integrity, full 100 x 100mm outline, 45° routing, M3 holes in all
four corners). §2 "PCB stackup and layout rules" describes the result. The motor connectors
changed to 6-pin and the I2C ports to JST PH (§11). A second pass the same day re-routed SD
and widened motor SPI to 0.36mm, moved the microSD socket inside the board edge, spread the
power jumpers with a label table each, set J2 flush with the board edge and cleaned up the
silkscreen.

**Contents**

1. [Sources](#1-sources)
2. [Power architecture](#2-power-architecture)
3. [Power input and fuses](#3-power-input-and-fuses)
4. [Power mux, USB power and LDO](#4-power-mux-usb-power-and-ldo)
5. [MCU, clock and supply pins](#5-mcu-clock-and-supply-pins)
6. [I2C pull-ups](#6-i2c-pull-ups)
7. [USB and debug](#7-usb-and-debug)
8. [SD card](#8-sd-card)
9. [IMU, DIP switch and buttons](#9-imu-dip-switch-and-buttons)
10. [DotStar LEDs](#10-dotstar-leds)
11. [Connectors](#11-connectors)
12. [Firmware configuration](#12-firmware-configuration)
13. [Open issues](#13-open-issues)

---

## 1. Sources

| Tag | Document |
|---|---|
| DS13313 | STM32H723 datasheet |
| AN5419 | STM32H723/733 hardware development, Rev 3; SDMMC routing §9.4.1 |
| RM0468 | STM32H723 reference manual (st.com did not serve it during the audit) |
| AN2606 | STM32 system bootloader, Rev 61, STM32H72x section (Tables 111/112) |
| SLVSFG1A | TI TPS2116 power mux |
| DS37274 | Diodes AP7361C LDO |
| TVS0500 | TI TVS0500 flat-clamp TVS |
| AO3401A | AOS AO3401A P-FET |
| MF-MSMF | Bourns MF-MSMF PTC, Rev BD 06/26 |
| SCLS264R | TI SN74AHCT125 |
| DS15060 | ST LSM6DSK320X datasheet, Rev 1 (July 2026); DB5732 data brief Rev 1 |
| BB2020 | American Bright BB-2020BGR-TRB |
| ABM8 | Abracon ABM8 crystal |
| SLVA689 | TI I2C pull-up resistor calculation |
| SLVSBO7O | TI TPD4E05U06 / TPD6E05U06, including layout guidance |
| JLC04161H-7628 | JLCPCB 4-layer 1.6mm impedance-controlled stackup |
| USBLC6 | ST USBLC6-2 |
| USB 2.0 | USB 2.0 spec plus the VBUS Max Limit and Device Capacitance ECNs |
| Type-C | USB Type-C specification |
| XKTF-015 | microSD socket drawing |
| OLED326 | Adafruit 326 guide and Eagle board files (STEMMA QT and v2.1) |
| SSD1306 | Solomon Systech SSD1306 |
| ESP32-C5 | Espressif ESP32-C5 and ESP32-C5-WROOM datasheets |
| ESP-Hosted | Espressif esp-hosted-mcu, SPI full-duplex design |
| V0.3 | ControlBoard_TestingV0.3 CubeMX report and clock tree |

See `datasheets/SOURCES.md` for the local-reference inventory and official download URLs.

Backup references in the repo: `nucleo/MB1364` (ST Nucleo-144 H7), `rev-2026/control-v4.1-stm32`,
`drive-motorboard/motor-module`, `rev-2026/kicker-v3.4`, `daughterboard`.

---

## 2. Power architecture

The powerboard supplies 5V and 3V3 on J15. USB supplies 5V as a bench fallback.

| Rail | Source | Loads |
|---|---|---|
| +5V_PB | Powerboard, after Q1 and F5 | J14 → U8 VIN1; J16 direct option |
| +3V3_PB | Powerboard, after F6 | J17 → U9 VIN1; J18 direct option |
| VBUS | USB, after F1 | J14 → U8 VIN2, U7, R20/R21 sense divider; J16 direct option |
| +3V3_LDO | U7 from VBUS | J17 → U9 VIN2; J18 direct option |
| +5V | J16: U8 output (powerboard, else USB), or +5V_PB, or VBUS | DotStars, U10, F2/F3/F4 (independent J10/J11/J12 feeds) |
| +3V3 | J18: U9 output (powerboard, else USB), or +3V3_PB, or +3V3_LDO | MCU, SD, IMU, OLED, pull-ups, radio (J9) |

The motor connectors J4-J8 carry SPI only; the motor modules take no +5V or +3V3 from this
board (§11).

The radio board (RadioBoard2027) and the DotStars run from the mux outputs, so both also work
on USB alone. Firmware caps LED brightness on USB (§10). The radio adds up to about 0.4A of Wi-Fi
TX peaks to the USB budget (§4, m22).

Protection is kept simple: a TVS and a PTC fuse on each input. There are no eFuses, so the
board has no undervoltage lockout, no overvoltage clamp, no fast current limit, no fault
signal and no USB inrush limit. The consequences are listed in M1, M3 and m18.

### PCB stackup and layout rules
- 4 layers, JLC04161H-7628, 1.6mm: F.Cu signal (L1) / In1.Cu solid GND (L2) / In2.Cu +3V3
  plane (L3) / B.Cu low-speed signal and GND pour (L4). The same line is printed on F.Fab.
- 50Ω single-ended = 0.36mm on the outer layers. USB 90Ω differential = 0.30mm traces with
  0.20mm gap.
- Every high-speed net (USB, radio SPI, SD, motor SPI, crystal) runs on F.Cu over the unbroken
  In1 GND plane. B.Cu carries only low-speed nets (UART, DIP, buttons, reset, BOOT0, OLED,
  SWD, power-source flags) and power.
- +3V3 is the In2 plane; every SMD +3V3 pad reaches it through its own via. +5V, VBUS and the
  powerboard rails are routed as traces (0.5-0.8mm). F.Cu and B.Cu carry GND pours, stitched
  to In1 on an 8mm grid.
- Board 100 x 100mm, M3 mounting holes H1-H4 at all four corners, 4mm in from each edge.
- 45° routing only (no 90° bends).

### Floorplan
Parts are grouped by schematic sheet around the MCU (U2, board centre), following its pin
groups:

| Area | Parts |
|---|---|
| West edge | Motor connectors J4-J8 in a column, each with its TVS array directly beside it |
| South-west edge | I2C ports J12, J11, J10 with U6; fuses F2-F4 on the back |
| South edge, centre | USB-C J2 with D1, U3, F1 |
| South-east | Power: J15, Q1, D3/D4, F5/F6, muxes U8/U9, jumpers J14/J16/J17/J18, LDO U7 |
| East edge | Radio J9 (top), microSD J1 with U1 (below it), SWD J3 |
| North edge | DIP switch SW3, reset SW1, BOOT0 SW2, user buttons SW4-SW6 |
| North-west | OLED header J13 |
| South of the MCU | DotStar chain D7-D11 with U10 |
| North of the MCU | Crystal X1 and IMU U11, both on the top side |

### Signal-integrity summary of the routed board

| Bus | Routing |
|---|---|
| USB D+/D- | About 23mm, F.Cu only, 90Ω pair, no vias, through U3 |
| Radio SPI (J9) | F.Cu only, no vias, 0.36mm (about 50Ω) except 0.25mm at the MCU escape. Pin-to-pin copper length: SCK 58.2mm, MOSI 57.8mm, MISO 58.2mm, CS 58.2mm (matched within 0.5mm; the series resistor bodies are not counted). Rows are 2.4mm apart, verticals 1.1mm apart |
| SD (J1) | F.Cu at 0.36mm (about 50Ω) on the main runs, 0.25mm only at the MCU pins, under U1 and into the socket pads. Flow-through U1, no stubs. Copper length MCU pin to socket pad: CLK 46.1mm (including 1.0mm through R6), CMD 45.5mm, DAT0 46.2mm, DAT1 46.0mm, DAT2 46.1mm, DAT3 46.1mm (0.7mm spread). CLK and CMD carry short serpentines to match the data lines. DAT2 and DAT3 each cross CMD and CLK once on B.Cu next to the MCU (5.0mm and 3.7mm, two vias each, with a GND return via within 0.9mm of three of the four). Gaps are 0.5mm or more except at the MCU pins (0.5mm pitch), under the MCU body for DAT0/DAT1, through U1 and in the socket fan-out |
| Motor SPI (J4-J8) | F.Cu only over In1 GND, daisy-chained through each connector's TVS array (flow-through). 0.36mm on the runs between connectors and back to the MCU (178mm of the bus), 0.25mm through the TVS arrays and pin escapes, where SCK and MOSI sit 0.25mm apart for about 3mm per connector |
| Crystal | X1, C18, C19 and R12 on the top side next to PH0/PH1, GND vias at each capacitor |
| I2C | Pull-ups at the MCU; kicker and expansion buses run as a spaced bundle to U6 and J10-J12 with TP7/TP8 inline |

---

## 3. Power input and fuses

### J15 powerboard connector
JST B8B-XH-A. Pins 1-2 +5V, 3-4 +3V3, 5-6 GND, 7 PWR_UART_TX, 8 PWR_UART_RX. 3A per contact
with AWG22 (JST XH). UART4 on PA0/PA1 (FT pins), 115200, 3.3V logic.

R34 (TX) and R33 (RX), both 1k, sit in series with the UART lines at the MCU, with TP11/TP10 beside them; the J15 side runs on B.Cu around the board edge (DS13313 Rev 4 cited):
- Unpowered powerboard: if its RX pin clamps to its own VDD, PA0 high feeds at most
  (3.3V - 0.6V)/1k = 2.7mA into that rail, instead of back-powering it.
- Cable faults: J15 carries +5V on pins 1-2. TX shorted to GND or +5V is held to 3.3mA or 1.7mA,
  well below the 20mA per-pin limit (Table 10, I_IO).
- Injection: Table 10 allows -5/+0mA on FT pins, but Table 50 rates PA0/PA1 (FT_ha,
  shared with the PA0_C/PA1_C analog switches) at 0mA functional susceptibility. Ringing below
  GND on the cable must be damped and limited, not just survived.
- Unpowered MCU: PA1 is 5V tolerant (Table 9, V_IN up to min(VDD...)+4.0V, pull-ups off), so a
  powerboard TX reaching an unpowered control board is not a damage path. R33 is kept for the fault
  and damping cases.
- Timing: 1k with about 100pF of cable and pin gives tau = 100ns, about 1% of a 115200 bit (8.7us).

### Q1 reverse polarity (5V only)
AO3401A P-FET: -30V, -4A, Vgs abs max ±12V. Drain to the input, source to the load, gate to
GND through R35 100k. D2 (10V zener) keeps Vgs inside ±12V. RDS(on) ≤60mΩ at -4.5V, so 135mW
at 1.5A. The 3V3 input has no series FET: its drop would take the radio below 3.0V (see M2).

### D3 (5V), D4 (3V3) input TVS
TVS0500DRV on both inputs: VRWM 5V, VBR 7.5-8.4V, flat clamp 9.2V at 43A. They take surge and
ESD only. Their clamp is above the TPS2116 6V abs max, so a long overvoltage from the
powerboard reaches the muxes and the 3V3 loads; the powerboard has to regulate (M1).

Both sit at J15. D4 is directly on the connector pins (+3V3_RAW). D3 sits right after Q1
(+5V_PROT), not before it: the TVS0500 is unidirectional, so on a reversed input it would
conduct forward and short the supply before Q1 could block it.

### F5 (5V) and F6 (3V3) fuses
Bourns MF-MSMF125/16X-2, 1812. Hold 1.25A and trip 2.50A at 23°C; hold 1.00A at 40°C and
0.95A at 50°C; 0.04-0.14Ω; max 0.4s to trip at 8A; 16V (MF-MSMF Rev BD tables). The same
part on both rails keeps the BOM short.

Sizing rule: the trip current must sit at or below what the protected parts and the source
can carry, or the fuse never opens. The trip current equals the TPS2116's 2.5A rating and is
below J15's 3A per contact. The powerboard must be able to source more than 2.5A per rail into
a fault, otherwise its own current limit acts first (M3). The hold current at 50°C still
covers the rail budget below.

| Rail load | +5V | +3V3 |
|---|---|---|
| DotStars (capped by firmware, §10) | 250mA | - |
| Motor modules J4-J8 | 0 (no supply pins, §11) | 0 (no supply pins, §11) |
| J10-J12 via F2/F3/F4 | 0.55A combined allocation at 50°C; not 0.55A per port simultaneously | - |
| Radio (TX peak 408mA) | - | 408mA peak |
| MCU, SD, IMU, OLED | - | about 0.35A (§4) |
| Fuse hold at 50°C | 0.95A | 0.95A |

The motor modules are not powered from this board: J4-J8 carry SPI and GND only, so their
logic draw (encoder, Hall, STSPIN32G0) is off this budget (M3).

- A PTC is slow. It opens on a short or a heavy overload. Current between the hold and trip
  values may flow indefinitely.
- 3V3 drop: 0.14Ω × 1A = 0.14V worst case (M2).
- No UVLO: the muxes see the powerboard rail as it ramps. TPS2116 priority switching (§4)
  still decides the source.
- No fault output. PA4 is now unused.

---

## 4. Power mux, USB power and LDO

### U8 (5V) and U9 (3V3) TPS2116 muxes
Priority mode (MODE tied to VIN1). VIN1 is the powerboard rail, VIN2 the USB side. VREF is
0.92/1.00/1.08V with no built-in hysteresis.

| | U8 5V | U9 3V3 |
|---|---|---|
| PR1 divider | R36 100k / R37 36k | R38 100k / R39 68k |
| Hysteresis | R40 1M from ST | R41 1M from ST |
| Switchover (VREF typ) | ~3.55V falling / 3.88V rising | ~2.34V falling / 2.57V rising |

- ST is open drain. R42/R43 10k pull it up to 3V3. PWR_SRC_5V goes through R44 10k to PA2;
  PWR_SRC_3V3 goes to PA3. High means the powerboard is selected.
- R44: ROM bootloaders before V9.3 drive USART2 TX (PA2) push-pull (AN2606 V9.3 change
  note). With USB power ST is low, and R44 limits that contention to 0.33mA.
- While VIN1 is selected it stays tied to VOUT until PR1 drops below VREF (SLVSFG1A §7.6.1).
  With USB attached and the powerboard removed, the rail therefore sags to the switchover
  voltage first. See M7 for why this is accepted.
- C33/C34 10uF at VIN1 (5V/3V3), C35 10uF (5V) and C36 2.2uF (3V3) at VIN2, C37/C38 22uF and
  C39/C40 100nF at the outputs.
- No diodes on the mux outputs. The TPS2116 blocks reverse current: an input is disconnected
  once VOUT exceeds it by 42mV (SLVSFG1A §7.3.4), so the powerboard rail cannot back-feed USB
  and USB cannot back-feed the powerboard. A diode would also cost 0.3-0.5V on the 3V3 rail.
- Layout per SLVSFG1A §10: VIN1, VIN2, VOUT and GND short and wide; both VOUT pins (2, 7)
  bridged under the package; MODE (5) tied to VIN1 (3) under the package; the PR1 divider at
  pin 4; input and output capacitors at the pins.
- Footprint `ControlBoard2027:TI_TPS2116_DRL0008A` uses extended 1.00 x 0.30mm pads for hand
  soldering, with paste apertures matching TI's land pattern.

### Jumpers J14/J16 (5V) and J17/J18 (3V3)
- J14 (5V) and J17 (3V3) are 2x2 mux-input jumpers. Row 1-2 connects the powerboard rail
  (+5V_PB / +3V3_PB) to VIN1; row 3-4 connects the USB side (VBUS / +3V3_LDO) to VIN2. One
  shunt per row, placed horizontally.
- J16 (5V) and J18 (3V3) are 2x3 load-select jumpers onto +5V / +3V3: 1-2 the mux output,
  3-4 the powerboard rail directly, 5-6 VBUS / +3V3_LDO directly. Fit exactly one shunt,
  horizontal.
- Silkscreen legend. The four jumpers sit in one row above the muxes, 8.8mm apart, in the
  order J18, J17, J16, J14 from west to east. Each has a title above it and a label table to
  its right, with one cell per pin row:
  - J18 "3V3 RAIL" and J16 "5V RAIL" choose what feeds the rail. Rows: "LDO" (J18) or "USB"
    (J16) takes the USB-side supply directly, "PB" takes the powerboard directly, "MUX" takes
    the automatic mux output. Fit exactly one shunt ("RAIL: FIT 1").
  - J17 and J14 "MUX IN" connect the two sources to the mux inputs. Rows: "PB" (powerboard)
    and "LDO" (J17) or "USB" (J14). Fit both shunts ("MUX IN: BOTH").
  - A thick bar under a label marks the normal position: "MUX" on the two RAIL jumpers and
    both rows on the two MUX IN jumpers ("BAR = NORMAL"), six shunts in total.
  - Shunts always lie across a row, joining the two pins side by side ("SHUNT ACROSS"). A shunt
    fitted along a column would tie two sources together (for example VBUS to the powerboard
    5V) and must never be fitted.

### USB VBUS input
VBUS from J2 goes through F1 to U8 VIN2 (via J14), U7 and the J16 direct option. There is no
eFuse or load switch.

- F1 Bourns MF-MSMF075/16X-2 (sheet 03), see §7.
- D1 TVS0500DRV sits on VBUS at J2, before F1.
- C30 2.2uF X5R 16V at the input. The USB Device Capacitance ECN requires 1-10µF on VBUS;
  2.2µF stays above 1µF after DC bias.
- No inrush limit. Everything on +5V and, through U7, on +3V3 charges straight from the host
  at attach: well over the 10µF that USB 2.0 §7.2.4.1 allows (m18).
- With the cable out, R20/R21 (115k, §5) pull VBUS to 0V, so U8 VIN2 does not float.

### U7 AP7361C-33E LDO
1A, 360mV dropout at 1A, stable with ≥2.2µF MLCC (DS37274). SOT-223: 1 IN, 2 GND, 3 OUT.
On USB alone it carries the MCU, SD, IMU and OLED, about 0.35A: (5.0 - 3.3) × 0.35 = 0.6W.
The radio adds Wi-Fi TX peaks of 313mA at 2.4GHz and 403mA at 5GHz (ESP32-C5-WROOM-1U datasheet
v1.3, Tables 6-4/6-5), so the LDO sees up to about 0.75A peak and 1.3W. Its average is far lower,
but check the SOT-223 copper area on the layout.
C31 4.7uF in, C32 10uF out.

Layout: U7 sits in the power block between the USB connector and the 3V3 jumpers, next to the
VBUS feed. Its GND tab and pin have vias into the GND plane.

### Rail LEDs and test points
D5/D6 Kingbright APT1608EC red: VF 2.0V typ, 30mA max. R45 3.3k → 0.9mA on 5V, R46 1.5k →
0.87mA on 3V3. Around 1mA is plenty for an indicator; the earlier 3mA was too bright. TP13
(+5V_PROT) and TP14 (+3V3_RAW) with TP16/TP17 (+5V/+3V3) measure the fuse plus mux drop. TP3
(VBUS), TP15 (+3V3_LDO) and TP12 (GND) cover the USB side. TP10/TP11 give logic-analyser
access to the powerboard UART. All test points are `TestPoint_Pad_1.5x1.5mm`. On the board each test point is labelled with its signal name
(for example "UART TX", "MOT SCK", "3V3 LDO", "GND") instead of its TP number.

---

## 5. MCU, clock and supply pins

### U2 STM32H723ZGT6
LQFP144, LDO supply only (the H723 has no SMPS): PWR_LDO_SUPPLY in CubeMX.

### Why an external 25MHz crystal
USB full speed needs 12Mb/s ±0.25% (USB 2.0 §7.1.11), and the same PLL output clocks SDMMC
and SPI.

- HSI48 alone is ±1.04% untrimmed (DS13313 Table 35), four times too loose. CRS trimming needs
  USB SOF packets from a host and does nothing for SPI or SDMMC.
- ABM8-25.000MHZ-10-B1U-T: ±10ppm tolerance, ±10ppm stability, ±2ppm first-year aging, about
  22ppm worst case. The rev-2026 control board already uses this part.
- 25MHz rather than 48MHz: the oscillator only guarantees start-up below Gmcritmax 1.5mA/V
  (DS13313 Table 33). gm_crit = 4 × ESR × (2πF)² × (C0 + CL)². At 25MHz (ESR 50Ω, C0 3pF,
  CL 10pF) that is 0.83mA/V typ, 1.08mA/V worst case. At 48MHz it is 2.15mA/V, over the limit.
- 8MHz ABM8 parts have ESR up to 400Ω and do not divide as cleanly into 48MHz.

C18/C19 12pF C0G: CL = (12 + 5)(12 + 5) / 34 + 1-2pF board = 9.5-10.5pF, with 5pF pin
capacitance (DS13313). Raise them if the measured frequency is high, lower them if low.

R12 (0Ω) sits in series with OSC_OUT (PH1). The ABM8 drive limit is 100µW; the estimate is
53µW at 1.0Vpp but 103µW at 1.4Vpp. Measure on the first board and fit a few hundred ohms if
needed (m9).

### Supply pins
- C3, C4, C6, C8-C10, C12, C14-C17 and C21 100nF: one at each of the 11 VDD pins and VBAT.
  C5 10uF and C7 4.7uF bulk.
- C11 4.7uF + C13 100nF at VDD33USB (pin 95).
- VDDA (pin 33) and VREF+ (pin 32) go straight to +3V3 without a ferrite, as on the Nucleo:
  C24 1uF + C25 100nF at VDDA, C26 1uF + C27 100nF at VREF+.
- PDR_ON (pin 143) to +3V3 enables the internal reset. VBAT (pin 6) to +3V3, no battery.
- VCAP pins 71 and 106 are joined with C22 and C23 2.2µF (X7R ±10%, ≥6.3V, ESR under 100mΩ).
  DS13313 Table 14 note 3 treats the VCAP pins as one node, and the Nucleo ties them. KiCad
  ERC flags the tie because the symbol types both pins as power output (m21).
- Each decoupling capacitor has a text label naming its pin; place it beside that pin.

### Reset and boot
R11 10k BOOT0 pull-down holds 0.15V at worst-case leakage against a 0.73V input-low limit.
C20 100nF on NRST. DS13313 Rev 5 §6.3.17, Table 57 specifies a permanent internal
30–50k pull-up (40k typical); Figure 18 shows the 100nF capacitor. NRST therefore is
not floating and no extra pull-up is required here. SW2 pulls BOOT0 to 3V3 for DFU.

### Other MCU-side parts
- R15/R16 30Ω in series with PA5/PA7 (motor SPI SCK/MOSI) at the MCU. MISO has none.
  Standardized from 22Ω to the same initial assembly value as R6 after the follow-up
  review. DS13313 Rev 5 Tables 52/54 specify output voltage/timing by load and drive
  setting, not a constant 25Ω driver resistance; they do not prescribe a 30Ω resistor.
  These are initial damping values, not guaranteed source matches. The stackup's 50Ω
  single-ended geometry is 0.36mm (§2); tune series resistance using the actual driver,
  cable and loads.
  The multidrop motor bus and point-to-point SD clock may ultimately need different
  values. Qualify SCK ringing and MOSI setup/hold at all five motor connectors.
- R65/R66 30Ω in series with PB3/PD6 (radio SPI SCK/MOSI) at the MCU, same initial
  damping value as R15/R16. MISO has none.
- R20 47k / R21 68k divide VBUS to PA9, which firmware reads as a GPIO. The divider ratio is
  0.591: 2.60V at 4.4V VBUS (input-high threshold 2.31V, DS13313 Table 51), 3.10V at 5.25V.
  The pin's 4.0V abs max (with VDD off) is only reached at 6.77V VBUS. The divider sits on
  VBUS after F1; allow its specified resistance and hot operating drop in the margin
  calculation (0.45Ω × 0.45A is already about 0.20V, before thermal changes).
- R13 10k pull-up on PA15. The bootloader runs SPI3 as a slave on PC10-PC12 (the SD bus) with
  NSS on PA15 and no pull (AN2606 Table 111). Holding NSS high keeps SD activity from
  selecting SPI3 instead of USB DFU.

---

## 6. I2C pull-ups

All buses run at 400kHz. One pull-up pair per bus, all on sheet 02. Different original
values traded lower current on short on-board buses against faster rise time on cables.
2.2k is a common workable starting value, not evidence that all buses have equal capacitance.

| Bus | Pins | Pull-ups | Notes |
|---|---|---|---|
| IMU (I2C5) | PF0/PF1 | R9 (SDA) / R7 (SCL) 2.2k | Short on-board bus; standardized value |
| Kicker (I2C2) | PB10/PB11 | R18 (SCL) / R19 (SDA) 2.2k | Cabled |
| Expansion (I2C4) | PF14/PF15 | R10 (SCL) / R8 (SDA) 2.2k | Cabled, J11 and J12 share it |
| OLED (I2C1) | PB8/PB9 | R14 (SCL) / R17 (SDA) 2.2k | Module adds 10k; effective pull-up about 1.8k |

Fast mode requires a 300ns maximum rise time. For devices guaranteeing 3mA sink at
0.4V, TI SLVA689 equations 1 and 6 give Rp(min) = (VDD(max) - 0.4V) / 3mA and
tr = 0.8473 × Rp × Cb. At 3.6V maximum, Rp(min) = 1.067k. Standardizing at 2.2k
gives 153pF capacitance budget with +5% resistor tolerance. The OLED module's assumed
10k parallel pull-up gives about 1.8k nominal, still above that lower limit even at
-5% tolerance. Verify the purchased module and every external slave's sink rating;
measure actual rise times before approving 400kHz operation.

The kicker and expansion buses may need 1.5k (236pF budget) once real cables are fitted.
Measure SCL rise time at TP7 (kicker) / TP8 (expansion) and change only if it exceeds 300ns. Expansion boards
must not add their own pull-ups.

---

## 7. USB and debug

- J2 GCT USB4110-GF-A, USB 2.0 Type-C: VBUS 5A total, 0.25A per signal pin. A6/B6 and A7/B7
  join at the connector with stubs under 3.5mm.
- R23/R22 5.1k on CC1/CC2 set the sink role (Type-C Rd ±20%).
- U3 USBLC6-2SC6 on D+/D- (pins 1↔6 D-, 3↔4 D+), 3.5pF max. Its rail pin (5) goes to +3V3,
  not VBUS. On VBUS, the D+ 1.5k pull-up back-feeds VBUS to about 2.8V through the internal
  diode when the cable is unplugged, and the board cannot see the detach. Full-speed
  signalling stays under 3.6V, so a 3V3 rail reference is enough.
- No series resistors on D+/D-: the STM32 full-speed driver is already 28-44Ω.
- J2 shield (SH) is tied to GND. A6/B6 and A7/B7 join at the connector. The receptacle face is
  flush with the board edge (the footprint's "PCB Edge" line sits on the outline).
- D1 TVS0500DRV on VBUS right at J2, before F1, with a short via to GND.
- USB D+/D- are routed as a 90Ω pair: 0.30mm traces, 0.20mm gap, about 23mm on F.Cu with no
  vias (§2).
- F1 Bourns MF-MSMF075/16X-2 (1812): hold 0.75A / trip 1.50A at 23°C, 0.60A hold at 40°C and
  0.55A at 50°C, 0.11-0.45Ω, max 0.2s to trip at 8A, 16V. The plain MF-MSMF075 used before is
  marked not recommended for new designs in the Rev BD datasheet; the /16X version is current.
  This is NOT sufficient to approve unrestricted USB operation: estimated base 0.35A +
  LED cap 0.10A + radio TX 0.403A is about 0.85A before motor/extension loads. Peak duration
  and duty cycle affect PTC heating; a burst above hold does not prove immediate tripping.
  Sustained full load exceeds the 0.55A hot hold rating and legacy USB 500mA allowance.
  F1 remains unchanged for restricted bench use: disable radio TX and external loads,
  enforce the source's allowed current, and measure base load/inrush first. CC pull-downs
  alone do not detect an advertised 1.5A/3A source. A larger fuse alone is not a fix;
  full USB operation requires source-current detection, enforced load/inrush budget and
  LDO thermal qualification. Use the powerboard for full operation.
- J3 SWD: 1 VTref, 2 SWCLK, 3 SWDIO, 4 GND, 5 NRST. Pins 1-4 match the motor-module cable.
  VTref ties straight to +3V3. Probes only sense VTref, so the series diode was removed. J3
  must be keyed: reversed, VTref and GND land on NRST.
- The former SWD series resistors were removed and their nets wired directly. AN5419's SWJ reference connection does
  not require series resistors. Damping can help particular cables, but is not mandatory
  impedance matching. Use a short ground-referenced cable, start at 1MHz and qualify the
  intended probe/speed. SWCLK's source is the probe; a board-side resistor is not its
  source termination. J3 still has no protection against a mis-plugged 5V probe.
- NRST has the STM32H7 internal pull-up and C20 (100nF) to GND. No external pull-up is fitted:
  ST H7 guidance recommends the capacitor and cautions that an external pull-up is unnecessary.
- SW1 reset. SW2 BOOT0 to 3V3. The ROM DFU uses HSI48 with CRS, so it needs neither the
  crystal nor VBUS sensing.

---

## 8. SD card

- J1 XKTF-015-N microSD socket on the custom `ControlBoard2027:XKB_XKTF-015-N` footprint.
  SH is tied to GND. The card-detect terminal (pin 9) is left unconnected: the drawing does
  not give the detect return path, and that path likely runs through the shell. Firmware
  finds a card by initialising it.
- R1-R5 47k pull-ups on DAT0-3 and CMD, inside the SD range of 10-100k. Idle high is at
  least 2.79V against the card's 2.06V and the MCU's 2.31V input thresholds. CLK has none.
- R6 30Ω in series with SDMMC_CK at the MCU (PC12), an initial clock-damping value.
  The STM32 output is not a guaranteed fixed 25Ω resistor, so 30Ω does not establish a
  verified source match. Use the selected GPIO drive setting/IBIS model and measured
  waveforms to tune it; no numerical edge-time or setup-margin guarantee is made here.
- U1 TPD6E05U06RVZR on CLK (card side of R6), CMD and DAT0-3: VRWM 5.5V, 10nA leakage max,
  0.47pF per line (SLVSBO7O Table 4-3). Place at J1. Its NC pads are tied in the schematic
  to the opposite I/O pad so each line can pass straight through (flow-through, as in §11).
- C1 10uF + C2 100nF at the card supply. Card VDD is not switchable (M18).
- Clock: SDMMC kernel = PLL1Q = 48MHz, f = 48 / (2 × CLKDIV). CLKDIV 3 gives 8MHz for bring-up,
  CLKDIV 1 gives 24MHz, the fastest Default Speed setting (25MHz max).
- All SIX SD traces (CLK, CMD, DAT0-3) are specified at 55Ω single-ended, with an unbroken
  ground reference and length mismatch within 1mm. This is a PCB geometry requirement,
  not a 55Ω resistor value. AN5419 Rev 3 §9.4.1 specifies 50Ω ±10%, less than 10mm skew,
  and less than 120mm length before termination. 55Ω is the upper boundary, so a fab's
  nominal 55Ω ±10% process would not guarantee ST's range. The chosen stackup
  (JLC04161H-7628, §2) gives 50Ω at 0.36mm on the outer layers, the centre of ST's range;
  confirm the delivered tolerance with the fabricator before release.
- TP1 measures clock at the card. CMD and DAT0-3 retain direct connections and 47k
  pull-ups for the proposed short, 24MHz bus. Pull-ups are NOT AC terminations. These
  bidirectional lines can also need damping; direction alone is no reason to forbid it.
  Qualify read AND write edges with actual lengths/loading and the selected card. Add/tune
  series damping if that analysis needs it; blindly copying the clock resistor onto all
  five lines is not a validated match. Qualify on the routed board.
- Routed result: all six lines on F.Cu over the In1 GND plane at 0.36mm, straight through U1
  with no stubs, matched within 0.7mm (table in §2). DAT2 and DAT3 must cross CMD and CLK
  between the MCU pin order and the socket pin order; each does so with one short B.Cu hop
  beside the MCU (5.0mm and 3.7mm, two vias each). The pull-ups R1-R5 sit in line on their
  traces. J1 sits 2.5mm in from its first position so the socket body ends 0.55mm inside the
  board edge.

---

## 9. IMU, DIP switch and buttons

### U11 LSM6DSK320X
ST LSM6DSK320XTR in LGA-14L 2.5 x 3.0mm, which replaces the BMI088. It combines a low-g accelerometer
(±16g), a high-g accelerometer (±32 to ±320g) and a ±4000dps gyroscope. The high-g channel captures
collisions and kicks that saturate a ±16g part.

Mode 1 (I2C target) per DS15060 Fig. 27 and Table 1:
- CS (12) to VDDIO selects I2C.
- SDO/TA0 (1) to GND gives address 0x6A (0xD4 write, 0xD5 read); 0x6B would need TA0 high.
- SDx/SCx (2/3) to GND, because the controller interface is unused.
- OCS_aux/SDO_aux (10/11) left unconnected; they have internal pull-ups.
- SCL (13)/SDA (14) on I2C5 (PF1/PF0) with the existing 2.2k pull-ups R7/R9. ST's figure shows 10k; 2.2k gives
  faster edges for 400kHz/1MHz.
- C48 100nF at VDDIO (5) and C49 100nF at VDD (8).

INT1 (4) -> ACCEL_EXTI (PF3) and INT2 (9) -> GYRO_EXTI (PF2). Both are push-pull and driven low from
power-up (Table 25), so the old BMI088 pull-downs are gone. The four BMI088 straps and pull-downs
(10k SDO1/SDO2, 100k INT) were removed. The net names ACCEL_EXTI/GYRO_EXTI are kept for firmware
continuity. Route any event to either pin with INT1_CTRL/INT2_CTRL. The part has no reset pin (m16).

Layout: U11 at (73.75, 51.5), top side, north of the MCU, uses
`ControlBoard2027:ST_LGA-14L_2.5x3mm_P0.5mm`. That is the KiCad LGA-14 3x2.5 land pattern with
0.30mm pads (package pads 0.25 ±0.05mm) to keep 0.2mm gaps. SDA and SCL run straight up from
PF0/PF1; INT1 and INT2 loop around the north side of the package on F.Cu. C48/C49 sit directly
above the package and R7/R9 between it and the MCU.

### SW3 DIP switch
Six positions for robot ID on PF7-PF10, PC0, PC1; closed reads 0. R53-R58 100k pull-ups. Input
leakage is ±250nA max (DS13313 Table 51) against a 2.31V input-high threshold:

| Pull-up | Current per closed switch | Worst-case high |
|---|---|---|
| 10k | 330µA | 3.30V |
| 100k (used) | 33µA | 3.28V |
| 1M | 3.3µA | 3.05V, still valid but slow and noise-prone |

100k gives a solid high at low current and still enough wetting current for gold contacts.
Read at boot; add 100nF per pin if read continuously. The part is a CTS 209-6MS through-hole
slide DIP (2.54mm pitch, 7.62mm rows). Pins 1-6 carry DIP0-DIP5 and pins 7-12 go to GND.

### SW4-SW6 user buttons
Active low. R59-R61 10k pull-ups, R62-R64 10k series, C50-C52 100nF at the MCU pin, no
inductor.

| | Path | Nominal | 1% R, 10% C | 5% R, 20% C |
|---|---|---|---|---|
| Press | C discharges through R62: τ = R62 × C50 | 1.0ms | 0.89-1.11ms | 0.76-1.26ms |
| Release | C charges through R59 + R62: τ = 20k × C50 | 2.0ms | 1.78-2.22ms | 1.5-2.5ms |

The pin settles in about 5τ. The RC removes sub-millisecond bounce; firmware ignores
re-triggers for about 10ms. Peak switch current is 0.76mA and the pin stays inside the rails.
The same numbers are on the buttons sheet. SW1, SW2 and SW4-SW6 are APEM MJTP1243 through-hole
tactiles (6 x 3.5mm, two pins at 6.5mm), so the pin mapping is direct and the GND/3V3 pins tie
straight into the planes.

---

## 10. DotStar LEDs

- Power comes from +5V, the U8 mux output (J16 1-2), so the LEDs work on USB as well as the
  powerboard. The chain can draw 500mA at full white. Firmware caps the total LED current to
  about 250mA on the powerboard, keeping +5V inside F5's hold current (§3), and to about 100mA
  on USB (PWR_SRC_5V low). This LED cap alone does not keep the whole board inside F1's hold
  current when Wi-Fi transmits (§7). On USB, +5V can sit below the LEDs' 4.5V minimum (VBUS may be 4.40V
  at the device, before F1 and U8), so colours and data are only guaranteed on the powerboard.
- U10 shares +5V with the LEDs, so it is powered whenever the MCU is. Its inputs are rated
  -0.5 to 7V regardless of VCC (SCLS264R).
- D7-D11 BB-2020BGR-TRB (APA102-2020 compatible): VDD 4.5-5.5V, input high 0.7 × VDD = 3.5V,
  clock 15MHz abs and under 10MHz operating (p6), 70°C max ambient (p3). The power-on state is
  not specified, so firmware sends an all-off frame first.
- The stock KiCad APA102-2020 footprint does not fit; build one from the BB-2020BGR-TRB land
  pattern (C1).
- U10 SN74AHCT125 shifts 3.3V to 5V. It must be AHCT (TTL input high 2.0V); AHC needs 3.5V.
  Gate 1 buffers LED_SPI_SCK: 1A (pin 2) → 1Y (3) → D7 CKI, 1OE (1) to GND. Gate 4 buffers
  LED_SPI_MOSI: 4A (12) → 4Y (11) → D7 SDI, 4OE (13) to GND. Gates 2 and 3 are unused and
  disabled: 2OE (4) and 3OE (10) to +5V, 2A (5) and 3A (9) to GND, 2Y (6) and 3Y (8) open.
  Propagation delay is 6.5ns max at 15pF, 2% of a 333ns bit at 3Mbit/s.
- R48 (SCK) / R47 (MOSI) 100k pull-downs on LED_SPI_SCK/MOSI hold the inputs at 0.13V (vs
  0.8V input-low limit) while the MCU pins are Hi-Z at reset. AHCT has no bus hold.
- C41 and C43-C47 100nF (one at U10, one beside each LED), C42 22uF X5R 16V where +5V
  enters. Each LED can draw 0.5W (BB2020 p3), so 500mA for the chain.
- TP20/TP21 on D11 SDO/CKO: valid data at the end of the chain proves all five LEDs pass it.
- TP18/TP19 at D7 SDI/CKI, after U10's level shifting. Compare beginning data/clock
  against TP20/TP21 at the end to separate upstream drive faults from a broken chain.
  Keep pad stubs short and use 5V-tolerant probes (BB2020 and SCLS264R).

---

## 11. Connectors

### Motor connectors J4-J8 (interface still open)
JST B6B-PH-K-S (vertical, 6-pin, 2.00mm), 2A per contact with AWG24. Pinout: 1 GND, 2 SCK,
3 GND, 4 MOSI, 5 MISO, 6 CS. SCK has GND on both sides and MOSI has GND beside it, so the
cable carries a return next to each fast edge. The connectors carry motor SPI only; no supply
reaches the motor boards from here. This no longer matches motor-module J2 (8-pin); that
board's connector must be changed to the same 6-pin pinout before the two are cabled (M19).
J4-J7 are wheels 0-3, J8 is the dribbler; they sit in a column on the west edge. R24-R28 10k CS pull-ups hold the modules deselected through reset. R30
100k pull-down on SCK. TP4/TP5/TP6 on SCK/MOSI/MISO.

Each connector has its own TPD4E05U06 array: U4 (J4), U5 (J5), U12 (J6), U13 (J7), U14 (J8).
Each is placed flow-through per TI SLVSBO7 layout guidance: the signals pass across the pads,
the NC pads are tied in the schematic to the opposite I/O pad so the array routes straight
through, and the GND pads are bridged with vias on both sides.

### I2C connectors J10-J12 and independent F2/F3/F4
- J10 kicker I2C, J11/J12 expansion I2C (JST PH B4B-PH-K-S, 4-pin, 2.00mm): 1 separately
  fused 5V, 2 GND, 3 SCL, 4 SDA. U6 TPD4E05U06 protects kicker and expansion SCL/SDA (same flow-through NC ties)
  and must sit at the connectors, so J10-J12 stay together (m8).
- F2 feeds J10.1 on +5V_KICKER; F3 feeds J11.1 on +5V_EXT1; F4 feeds J12.1
  on +5V_EXT2. Each input goes to +5V, with no shared downstream fused rail.
- All three are Bourns MF-MSMF075/16X-2 (same as F1): hold 0.75A at 23°C, 0.55A at
  50°C, trip 1.50A at 23°C, max 0.2s at the specified 8A test current. See MF-MSMF
  electrical/thermal tables. Independent protection does not increase the total source
  budget: retain 0.55A COMBINED external-load allocation pending M3 measurements.
- A single tripped branch no longer directly removes power from the other two ports.
  However PTC selectivity is not guaranteed by nominal trip currents or maximum trip
  times alone; an upstream current limit, F5, or USB F1 may act first. Test hot/cold
  shorts on each port with real source/cables. Rail sag can still reset healthy loads.
  Guaranteed uninterrupted operation needs coordinated active per-port limiting.
  J11/J12 also share I2C: a signal short can still block both even with separate fuses.

### J13 OLED (Adafruit 326)
1 SDA, 2 SCL, 3 DC/SA0 to GND, 4 RST NC, 5 CS to GND, 6 3V3 out NC, 7 Vin +3V3, 8 GND. The
STEMMA QT and v2.1 boards use the same pin numbers, but the header is rotated 180° and the
holes differ. The schematic assumes STEMMA QT, which has its own reset chip (M5). Address 0x3C;
SA0 goes through a diode on the module, so firmware also probes 0x3D. The module is held by its
header pins only; there are no mounting holes on this board.

Layout: the module sits fully on the board in the north-west area (J13 at 43.9, 39.1, rotated
90°). The silkscreen outline marks the module's 29.21 × 31.75mm size; nothing is screwed down.
Keep the header tall enough that the module clears any small passives under its outline.
Because the header runs along the module's side, the 128x64 image is rotated 90°; set the u8g2
rotation (U8G2_R1 or U8G2_R3) to match the mounting.

### J9 radio link
Cable to RadioBoard2027 J2 (ESP32-C5-WROOM-1U, ESP-Hosted over SPI; see that project's
DESIGN_NOTES.md). Both boards use the same JST GH 1.25mm 15-pin vertical header,
BM15B-GHS-TBT(LF)(SN), with a straight 1:1 cable (housing GHR-15V-S, terminal SSHL-002T-P0.2,
26 AWG).

JST GH was chosen because its datasheet is the only one of the candidates that states a positive
latch ("large outer latch for positive lock", JST eGH), it is rated 1.0A per contact at 26 AWG,
and footprints exist in KiCad 10. 2.54mm headers came loose in competition (radio design doc).

| Pin | Net | Pin | Net |
|---|---|---|---|
| 1 | +3V3 | 9 | GND |
| 2 | +3V3 | 10 | ESP_SPI_CS |
| 3 | GND | 11 | GND |
| 4 | ESP_SPI_SCK | 12 | ESP_HANDSHAKE |
| 5 | GND | 13 | ESP_DATA_READY |
| 6 | ESP_SPI_MOSI | 14 | ESP_RST (radio EN) |
| 7 | GND | 15 | GND |
| 8 | ESP_SPI_MISO | MP | GND |

- SCK, MOSI, MISO and CS each have GND on both sides. The slow lines (HANDSHAKE, DATA_READY,
  RESET) are grouped; a fully interleaved layout would need 17 pins, which GH does not offer.
- Power: two pins at 1.0A each carry the radio's 403mA TX peak with margin.
- The radio runs from the muxed +3V3, so it is powered whenever the MCU is. The radio board has its
  own TPS2116, which blocks its USB supply from back-feeding this board.
- MCU pins: SCK PB3, MISO PB4, MOSI PD6, CS PB5 (pin 135), HANDSHAKE PB6 (pin 136),
  DATA_READY PB7 (pin 137), RST PE1 (pin 142). These moved from the earlier PG15/PB5/PB6/PB7
  assignment; PG15 (pin 132) is now unconnected. R65 (SCK) and R66 (MOSI) 30Ω sit in series
  at the MCU end. SCK crosses MOSI on F.Cu by passing between the pads of R66 (0805), so
  neither needs a via. The four SPI lines are length-matched within 0.5mm on this board (§2);
  the cable and the radio board add their own mismatch.
- R29 10k ESP_SPI_CS pull-up to +3V3 keeps the radio deselected while PB5 floats at reset.
- R31/R32 100k pull-downs on HANDSHAKE/DATA_READY stop false interrupts with the radio absent or
  in reset. On the C5 these are GPIO3 (MTDI) and GPIO4 (MTCK). GPIO3 is a strapping pin, but it only
  sets the SDIO clock edge; boot mode is set by GPIO26-28 (ESP32-C5 datasheet v1.5 §3).
- ESP_RST (PE1) drives the radio EN open-drain. The radio board holds EN up with 10k/1µF and
  has 470Ω in series.
- C28 22uF + C29 100nF local decoupling on +3V3 at J9.

---

## 12. Firmware configuration

The board does not match the CubeMX V0.3 settings in several places. Where this section
differs from V0.3, this section is correct.

### Clock tree

| Setting | Value | Reason |
|---|---|---|
| HSE_VALUE | 25000000 | X1 is 25MHz (V0.3 says 48MHz, C2) |
| PLL1 DIVM | /5 | 5MHz PLL input (2-16MHz range), PLL1RGE 4-8MHz |
| PLL1 DIVN | ×96 | 480MHz VCO (192-836MHz, DS13313 Table 39) |
| PLL1 DIVP | /2 | SYSCLK 240MHz |
| PLL1 DIVQ | /10 | 48.000MHz for USB, SDMMC1, SPI1-3 |
| Voltage scaling | VOS1 with HPRE /2, or VOS0 | AHB max 200MHz at VOS1, 275MHz at VOS0 (Table 12); VOS0 limits TJ to 105°C (Table 13) |
| Supply | PWR_LDO_SUPPLY | H723 has no SMPS |
| BOR | Set a level in option bytes | Rail sags reset the MCU instead of browning out peripherals (M7) |
| CRS | Off | USB is clocked from PLL1Q |
| LSE / RTC | Off | No 32.768kHz crystal (PC14 is USER_EXTI2) |

240MHz is the closest value to the design doc's 250MHz that keeps PLL1Q at exactly 48MHz with
integer dividers while USB, SDMMC and SPI stay on PLL1Q. The ROM bootloader uses its own
clocking (AN2606 Table 111), so DFU does not depend on these settings.

### Peripherals

- **SPI1 motor bus** (PA5 SCK, PA6 MISO, PA7 MOSI, CS on GPIO): 48MHz / 8 = 6Mbit/s, 8-bit
  frames (V0.3 shows 4-bit). The design doc's 15.625Mbit/s needs a 125MHz kernel clock and a
  PLL rework (m4).
- **All SPI masters**: Master Keep IO State = Enable. V0.3 disables it; the HAL turns SPI off
  after each transfer and the clock pins would float (M17).
- **SPI2 DotStars** (PB13 SCK, PB15 MOSI), TX only, mode 0: V0.3 puts SCK on PA9, which is
  VBUS_SENSE on this board; re-pin to PB13 (M11). 48MHz / 16 = 3Mbit/s. /8 = 6Mbit/s is the
  nearest setting to the design doc's 7.815Mbit/s. Send an all-off frame at start-up.
- **SPI3 radio** (PB3 SCK, PB4 MISO, PD6 MOSI, PB5 CS on GPIO): 3Mbit/s, mode 3 as in V0.3. Hardware
  CRC off and 8-bit frames: ESP-Hosted uses fixed 1600-byte frames with its own checksum, and
  STM32 CRC would add a phase the slave never sends (M4). Enable the internal pull-up on PB4.
- **SDMMC1** (PC8-PC12, PD2), 4-bit: CLKDIV 3 (8MHz) for bring-up, then CLKDIV 1 (24MHz) after
  checking the clock at TP1. No card-detect pin: make the FATFS/BSP detect function report a
  card as present and treat an init failure as "no card". Recover a hung card with CMD0 (M18).
- **I2C1 OLED, I2C2 kicker, I2C4 expansion, I2C5 IMU**: 400kHz. Let CubeMX recompute the Timing
  value after the clock change; never copy V0.3's hex value. Enter measured rise/fall times.
  Internal pull-ups off. Run bus recovery (up to 9 SCL clocks, then STOP) before each init.
- **IMU**: after any PWR_SRC change or I2C error, re-read the configuration registers and
  re-initialise if they changed (m16).
- **UART4 powerboard** (PA0 TX, PA1 RX): 115200 8N1. Drive TX only once PWR_SRC shows the
  powerboard is present, so R34 does not back-feed an unpowered powerboard (§3).
- **USB** (OTG_HS in FS mode, PA11/PA12): read PA9 as a GPIO and call HAL_PCD_DevConnect /
  DevDisconnect on its edges. The OTG_HS comparator threshold is not in DS13313, and the
  divider is sized for the GPIO threshold. USB 2.0 §7.1.5 requires the D+ pull-up to be off
  without VBUS. Keep LPM consistent between the peripheral and the middleware (V0.3 has them
  different).

### GPIO

| Pin | Net | Mode | Why |
|---|---|---|---|
| PA2 | PWR_SRC_5V | Input, polled | R42 pull-up on U8 ST via R44; high = powerboard 5V. EXTI2 belongs to PF2 (m11) |
| PA3 | PWR_SRC_3V3 | Input, polled | R43 pull-up on U9 ST; high = powerboard 3V3. EXTI3 belongs to PF3 |
| PA9 | VBUS_SENSE | GPIO input | R20/R21 divider on cable VBUS |
| PA15 | (unused) | Reset / analog | R13 holds bootloader SPI3 NSS high |
| PC5, PB0, PB1, PB2 | MOTOR0-3_SPI_CS | Output PP, init high | R24-R27 hold CS high through reset |
| PF11 | DRIBBLER_SPI_CS | Output PP, init high | R28 |
| PB5 (pin 135) | ESP_SPI_CS | Output PP, init high | R29 pull-up to +3V3 (was PG15) |
| PE1 (pin 142) | ESP_RST | Open drain, init released | ESP EN pull-up is on the radio board; never drive high (was PB7) |
| PB6 (pin 136) | ESP_HANDSHAKE | EXTI rising | R31 pull-down (was PB5) |
| PB7 (pin 137) | ESP_DATA_READY | EXTI rising | R32 pull-down (was PB6) |
| PF3 | ACCEL_EXTI | EXTI rising | LSM6DSK320X INT1 (push-pull, active high by default) |
| PF2 | GYRO_EXTI | EXTI rising | LSM6DSK320X INT2 (push-pull, active high by default) |
| PE4, PC13, PC14 | USER_EXTI0-2 | EXTI falling | Buttons pull low; ~1ms RC debounce. V0.3 uses rising |
| PF7-PF10, PC0, PC1 | DIP0-5 | Input | R53-R58 pull-ups; closed = 0 |
| PA4, PG7, PG15 | (unused) | Analog | Were PWR_FAULT, SD_DETECT and ESP_SPI_CS; all removed |

- PC13: keep RTC tamper and wake-up disabled.
- Set "Set all free pins as analog" to Yes (V0.3: No).
- OLED: probe 0x3C and 0x3D (M5).
- Power-source changes: poll PA2/PA3. On any change, re-initialise SD, IMU and OLED (M7).
- The radio shares +3V3 with the MCU, so no pin holding is needed for it. After a PWR_SRC change
  or brown-out, pulse ESP_RST and restart ESP-Hosted. Resend the LED frame after any PWR_SRC
  change.
- Cap total LED current to about 250mA on the powerboard and about 100mA while PWR_SRC_5V is
  low (USB power) (§10).
- The motor modules must release MISO while their CS is high (M9).

### Bootloader (DFU)
BOOT0 high at reset starts the ROM bootloader, which answers the first interface that shows
activity (AN2606). Board nets on bootloader pins (AN2606 Table 111):

| Pins | Bootloader use | Board net | Effect |
|---|---|---|---|
| PA2/PA3 | USART2 | PWR_SRC_5V / PWR_SRC_3V3 | Static levels, cannot send 0x7F |
| PB10/PB11 | USART3 | Kicker I2C | Idle high |
| PA9/PA10 | USART1 | VBUS_SENSE / unconnected | Static |
| PA4-PA7 | SPI1 | Unconnected (NSS) + motor SPI | NSS floats, but no clock edges arrive on SCK (m12) |
| PC10-PC12 | SPI3 | SD DAT2/DAT3/CLK | NSS on PA15 held high by R13 |
| PB6/PB9 | I2C1 | ESP_HANDSHAKE / OLED SDA | SDA stays high, so no start condition |
| PF0/PF1 | I2C2 | IMU bus | Idle high |
| PA8/PC9 | I2C3 | Unconnected / SD DAT1 | Static |
| PA11/PA12 | USB DFU | USB connector | Used |

Bootloaders before V9.3 drive USART TX push-pull (AN2606 V9.3 change note): PA2 into U8 ST
through R44 (0.33mA) and PA9 into the VBUS divider. Both are harmless. Those versions also lock
PWR_CR3 until power-off, so power-cycle after DFU before running the application.

---

## 13. Open issues

IDs stay fixed. Closed items are removed, not renumbered.

### Critical (release blockers)

**C1 DotStar footprint.** D7-D11 now use `ControlBoard2027:AmericanBright_BB-2020BGR-TRB`, built
from the BB2020 p2 2x3 land pattern: CO/VCC/CI over DO/GND/DI. The stock APA102-2020 footprint did
not match; it put CO on +5V and CI on GND. The drawing does not say whether it is a top or bottom
view. The footprint assumes top view, because it labels the corners the same way as the p2 die
bonding diagram. Confirm with the vendor or a sample before ordering boards. If it turns out to be
a bottom view, mirror the pads left-right.

**C2 CubeMX HSE setting.** V0.3 sets HSE to 48MHz with PLL1 /3 ×12. With the 25MHz crystal the VCO
lands at 100MHz, below the 192MHz minimum. Apply the clock tree in §12.

**C3 Footprints, MPNs and ratings.** Partly resolved: every part now has a footprint, the bulk
capacitors carry voltage and dielectric in their values (C42 22uF 16V, C28 22uF 10V, C30 2.2uF 16V,
all X5R; C36 2.2uF 10V X7R). A "Rating" field carries the rest: every 100nF is 16V X7R,
C18/C19 are 50V C0G, and the resistors that set thresholds or time constants (R20/R21,
R36-R41, R59-R64) are 1%. U10 carries
the SN74AHCT125DR MPN (the SOIC-14 that matches its footprint; the PW TSSOP part does not fit and
the D tube option is obsolete). J3 is Samtec TSW-105-07-G-S; J4-J8 and J10-J12 have Digi-Key PNs.
Still open: no MPN on D7-D11 or J13, and the generic passives have no MPN or vendor PN.

### Major

**M1 No overvoltage protection on the powerboard inputs.** With the eFuses gone, nothing between
J15 and the loads limits voltage except the TVS diodes, which only start at 7.5V.
- +5V (pin 2) sits next to +3V3 (pin 3). A crimp fault puts 5V through F6 and U9 onto +3V3 and
  destroys the MCU (4.0V abs max), SD card, IMU and radio. A GND pin between the rails fixes
  it; needs agreement with the powerboard. This is now a release blocker for J15.
- A powerboard fault above 6V damages U8/U9 (TPS2116 abs max) and everything after them.
- The 3V3 input has no reverse protection: a mirrored cable puts -3.3V on the 3V3 loads.
The powerboard has to regulate and J15 has to be keyed and pinned so these cannot happen.

**M2 3V3 margin.** At 1A, F6 (140mΩ max) + U9 (59mΩ) + J15 (20mΩ) drop 0.22V, so a 3.30V
powerboard gives about 3.08V on +3V3, before the J17/J18 shunt contacts. The radio module (3.0V minimum) sits behind a further cable
and mux drop (m3). 3.4V ±3% is still the preferred setpoint; with no clamp,
the powerboard must never exceed 3.6V (STM32 VDD max).

**M3 Rail budget.** F5 and F6 hold 0.95A at 50°C and trip at 2.5A (§3). On 5V, the DotStars
(capped at 250mA) plus J10-J12 combined (up to 0.55A) must stay under 0.95A. The motor-module
logic is no longer on this budget: J4-J8 have no supply pins (§11), so that part of M3 is
resolved. If the budget does not fit, lower the LED cap or combined external-load allowance
before choosing a larger fuse, because a larger fuse would no longer trip below the TPS2116
rating. The powerboard must source more than 2.5A per rail into a fault, or F5/F6 never trip
and the powerboard's own limit is the protection.

**M4 SPI3 configuration.** V0.3 has hardware CRC on and 4-bit frames. Set CRC off and 8-bit.

**M5 OLED variant.** The schematic assumes the STEMMA QT board (reset chip, J13.4 NC). The v2.1 board
has no reset chip, and the SSD1306 needs RES# held low ≥3µs after power-up. SA0 reaches the chip
through a diode (about 0.5-0.6V against 0.66V max low), so probe both addresses. Order STEMMA QT
and take J13 from its board file.

**M6 Connector parts.** J10-J12 use JST PH B4B-PH-K-S (friction lock, 455-1706-ND). J15 JST-XH is friction lock and rated 3A only with AWG22. J3 needs a keyed header.
J9 is now a latching JST GH (§11); a
premade 15-pin GH cable could not be confirmed at a distributor, so plan on crimping or a
custom harness.

**M7 Mux switchover sag (bench only).** With USB attached, removing the powerboard lets +3V3 sag to
2.13-2.55V and +5V to about 3.2-3.9V (36k PR1 resistor, VREF 0.92-1.08V) before the mux switches, because VIN1 stays tied to VOUT until
PR1 falls. On the robot there is no USB, so this never happens. Handled with a BOR level and
firmware re-initialisation. The radio and DotStars both see the sag; firmware resets the radio
and resends the LED frame after any PWR_SRC change.

**M9 Shared motor MISO.** All five modules share MISO. It works only if each module releases MISO
while deselected. Add a 100k pull-down if they do not.

**M10 No mating kicker design.** The only kicker in the repo (v3.4) uses SPI with RESET over 8
pins, not I2C. Freeze J10 before layout. The radio side is now RadioBoard2027 (this board's J9
matches its J2 pinout); keep both projects in step if either connector changes.

**M11 SPI2 pin.** V0.3 puts SPI2_SCK on PA9; the board uses PB13. Re-pin in the .ioc.

**M16 Voltage scaling.** 240MHz SYSCLK exceeds the 200MHz AHB limit at VOS1. Use HPRE /2 at VOS1,
or VOS0 with its 105°C junction limit.

**M17 SPI clock float.** With Keep IO State disabled, PB3 floats between transfers and can add a
clock edge. Enable Keep IO State on SPI1-3.

**M18 SD card power.** Card VDD is hard-wired to +3V3. A hung card is recovered with CMD0; a card
that ignores CMD0 needs a board power cycle. Accepted to keep the circuit simple (logging only).

**M19 Motor-module connector.** J4-J8 are 6-pin JST PH (1 GND, 2 SCK, 3 GND, 4 MOSI, 5 MISO,
6 CS). The motor-module board's J2 is still the older 8-pin pinout and was not changed. Change
it to the same 6-pin pinout, or build an adapter cable, before connecting the boards.

**M20 Layout warnings before ordering.** The routed board passes DRC with no errors, no
unconnected nets and no schematic-parity differences. Every footprint is the current library
version (KiCad stock or the project library). The only warnings left are two where the OLED
outline on the silkscreen crosses the pads of R34 (the fab clips silkscreen on pads).

### Minor

- **m1** RadioBoard2027 firmware must set the ESP-Hosted pins explicitly: its C5 defaults are CLK
  GPIO3 and HANDSHAKE GPIO1, but the board uses CLK GPIO6 and HANDSHAKE GPIO3. GPIO4 (DATA_READY)
  has a weak internal pull-up at reset; R32 100k against about 45k gives 2.28V, below the 2.475V
  input-high threshold, so no false interrupt until the firmware takes the pin. ESP_RST has no
  pull on this board (the radio board has it).
- **m2** DotStar and U10 VDD is 4.5-5.5V. On the powerboard, Q1 (60mΩ) + F5 (140mΩ max) + U8
  (59mΩ) drop about 0.25V at 1A, so a 5.0V powerboard gives about 4.75V. On USB, +5V can fall below
  4.5V. LEDs are rated to 70°C ambient; cap brightness in firmware.
- **m3** The radio sees +3V3 minus the J9 cable and its own mux: roughly 0.05V more at a 403mA
  TX peak (two GH contacts in parallel, a short 26 AWG pair, TPS2116 on-resistance). Added to
  M2's worst case this leaves about 3.03V at the module from a 3.30V powerboard, just above the
  module's 3.0V minimum. Measure on the first boards.
- **m4** Motor SPI termination and speed (motorboard scope): R15/R16, 6 vs 15.625Mbit/s.
- **m5** J10-J12 pin order is not Qwiic. 3.3V pull-ups do not suit 5V-logic slaves, and a far-side
  5V pull-up is only safe while the MCU is powered (DS13313 Table 9).
- **m6** Cabled I2C: 2.2k allows 153pF. Measure at TP7/TP8.
- **m8** U6 serves J10 and J11/J12 and must sit at the connectors, so keep them together.
- **m9** Crystal drive level may reach 103µW at 1.4Vpp (max 100µW). Measure and fit R12 if
  needed. ABM8 is rated -20 to 70°C.
- **m11** PA2/PA3 share EXTI lines with PF2 and PF3; poll them.
- **m12** PA4 (bootloader SPI1 NSS) is unconnected and floats in DFU. Nothing drives the motor
  SCK (R30 pull-down), so no SPI frame arrives and DFU still answers on USB.
- **m14** J3 has no protection against a 5V mis-plug; the SWD series resistors have been removed.
- **m15** Resolved: all switches are through-hole (APEM MJTP1243 buttons SW1/SW2/SW4-SW6, CTS 209-6MS DIP SW3) with MPNs set.
- **m16** The LSM6DSK320X has no reset pin. Firmware uses the SW_RESET/BOOT bits after a brown-out and runs I2C bus recovery.
- **m17** AN2867, RM0468 and AN4879 were not available from st.com. VBUS is read as a GPIO, so the
  OTG threshold is not needed.
- **m18** No USB inrush limit. Over 100µF charges straight from VBUS at attach, against the 10µF
  in USB 2.0 §7.2.4.1. Most hosts ride through it, but a port may drop out or reset other
  devices on the hub. Bench only; check with the laptops the team uses.
- **m19** No test points on +5V_PB or +3V3_PB.
- **m20** SWCLK sheet pin is "input" on both sheets (cosmetic). Sheet 07 uses global labels named
  +3V3/+5V/GND next to power symbols.
- **m21** KiCad ERC reports the VCAP pin tie as power output to power output. The tie is correct;
  exclude the violation in KiCad.
- **m22** USB unrestricted operation is NOT qualified. Estimated concurrent load is ~0.85A
  before peripherals versus F1's 0.55A hot hold, and may exceed USB limits before/after
  enumeration. Disable radio TX/external loads for restricted bench use; use the powerboard
  for full operation. Resolve source-current detection, enforcement, inrush and thermal
  budget before claiming compliant USB bus-powered operation (§7).
- **m23** Resolved: the J2 (USB) and J1 (microSD) shells are now tied to GND in the schematic.
  U3, U1 and D1 still clamp the pins.
- **m24** No fault reporting: a tripped F2-F6 is only visible as a missing rail
  (PWR_SRC low or a dead connector supply).
