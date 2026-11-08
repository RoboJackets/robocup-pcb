# Prototype to compact: every change

This file lists every difference between the prototype set in `../../prototype/` (ControlBoard2027 and
RadioBoard2027) and the compact set (ControlBoard2027_C, RadioBoard2027_C_Inboard, RadioBoard2027_C_Overhang), with
the reason for each change.

**How the part lists were made.** The schematic netlists of all five boards were exported with
`kicad-cli sch export netlist` on 2026-11-07. A script compared them reference by reference: parts present on one
side only, changed value / MPN / footprint / LCSC / rating fields, and changed pin-to-net connections of the parts
present on both sides. The positions come from the board files. The two compact radios have identical netlists,
so the radio diff applies to both.

**Coordinates** are in mm from each board's outline top-left corner, x right, y down.

## 1. Controlboard: ControlBoard2027 -> ControlBoard2027_C

### 1.1 Board

| Item | Prototype | Compact | Reason |
|---|---|---|---|
| Outline | 100 x 100 mm | 120 x 60 mm | compact-set target outline; connectors on the edges they serve |
| Layers / stackup | 4, JLC04161H-7628 (L1 signal, L2 GND, L3 +3V3, L4 signal) | 6, JLC06161H-3313E (L1 signal, L2 GND, L3 +3V3 with a +5V region, L4 signal, L5 GND, L6 signal and pours) | two signal layers with a solid GND reference each (L1 over L2, L4 over L5), needed for three motor buses, SD and the radio link on a smaller board |
| 50 ohm width | 0.36 mm (outer) | 0.15 mm outer, 0.12 mm on L4 | thinner prepreg (0.0994 mm 3313) |
| USB pair | outer, 7628 geometry | 0.14 / 0.15 mm on L1, 90 ohm | same reason |
| Mounting | four M3 holes at (4, 4) ... (96, 96) | four M3 holes at (3.5, 3.5), (116.5, 3.5), (3.5, 56.5), (116.5, 56.5) | new outline |
| Radio | radio hung off the east edge on J9 at (95.45, 26.95), held only by the connector | radio sits over the MCU on J9 at (39.70, 6.03) plus two M2 standoffs HR1 (50.0, 37.5), HR2 (63.4, 37.5) | mechanical support; the radio no longer sticks out of the board |
| OLED | Adafruit 326 module on its header at the north-west | generic SSD1306 module raised over the east service edge on a 1 x 4 socket | space; generic module |
| IMU U11 | top side at (53.75, 31.5), rotation 180 | bottom side inside the MCU pad ring at (48.6, 20.6), rotation 270 | only place its four nets reach the MCU without crossing the crystal keep-out. Firmware axis remap changes (see [FIRMWARE.md](FIRMWARE.md) §1.6) |

### 1.2 Parts removed

| Ref | Value | MPN | Why |
|---|---|---|---|
| J14 | 5V_MUX_INPUTS, 2 x 2 header | Samtec TSW-102-07-G-D | power-mux jumpers removed: the muxes connect directly (no manual source override) |
| J16 | 5V_LOAD_SELECT, 2 x 3 header | Samtec TSW-103-07-G-D | as J14 |
| J17 | 3V3_MUX_INPUTS, 2 x 2 header | Samtec TSW-102-07-G-D | as J14 |
| J18 | 3V3_LOAD_SELECT, 2 x 3 header | Samtec TSW-103-07-G-D | as J14 |
| SH1-SH6 | shunts | Samtec SNT-100-BK-G | went with J14 / J16-J18 |
| SK1 | 1 x 8 socket | Sullins PPTC081LFBN-RC | the Adafruit 326 header socket; J13 is now its own 1 x 4 socket |

### 1.3 Parts added

| Ref | Value | MPN | Why |
|---|---|---|---|
| R67, R68 | 30R 0402 | Stackpole RMCF0402FT30R0 | source series resistors on the new right-wheel SPI2 SCK / MOSI |
| R70, R71 | 30R 0402 | Stackpole RMCF0402FT30R0 | source series resistors on the new dribbler SPI4 SCK / MOSI |
| R69 | 100k 0402 | Yageo RC0402FR-07100KL | SCK pull-down on SPI2 (as R30 on SPI1) |
| R72 | 100k 0402 | Yageo RC0402FR-07100KL | SCK pull-down on SPI4 |
| U16 | TPD4E05U06DQA | TI TPD4E05U06DQAR | ESD at J12; every external I2C pin now has its own protector at its own connector |
| U17 | TPD4E05U06DQA | TI TPD4E05U06DQAR | ESD at J10 (kicker), flow-through; U6 now serves J11 only |

### 1.4 Parts changed

| Ref | Prototype | Compact | Why |
|---|---|---|---|
| J3 | 1 x 5 2.54 mm SWD header (Samtec TSW-105-07-G-S) | STDC14, 2 x 7 1.27 mm keyed (Samtec FTSH-107-01-L-DV-K, LCSC C5307809) | takes the STLINK-V3 cable directly; keyed |
| J4-J8 | JST PH B6B-PH-K-S, vertical, 2.0 mm | JST GH SM06B-GHS-TB, right angle, 1.25 mm (LCSC C133065) | smaller, cable leaves along the board edge |
| J4-J7 values | MOTOR0_WHEEL ... MOTOR3_WHEEL | MOTOR0 ... MOTOR3 | position moved into the Description |
| J9 | stock LSHM footprint | paste-in-hole LSHM footprint (2.00 mm stencil apertures on the shield pins) | Samtec recommended layout rev G: the shield tails are soldered paste-in-hole |
| J10 | JST PH B3B-PH-K-S, 3 pins vertical | JST GH SM04B-GHS-TB, 4 pins right angle (LCSC C189895) | matches the kicker cable family; second GND |
| J11, J12 | JST PH B4B-PH-K-S, 4 pins | JST GH SM08B-GHS-TB, 8 pins (LCSC C265111); values EXP_1 / EXP_2 | two 5 V pins and four GND pins per port |
| J13 | Adafruit 326 header footprint | BOOMELE 2.54-1*4P socket (LCSC C2718488), generic SSD1306 module, footprint with four M2 standoff holes | generic module, JLC-stocked socket |
| J15 | JST XH B8B-XH-A, 8 pins vertical | JST PH S7B-PH-K-S, 7 pins right angle (LCSC C157917), value "PB 7P" | powerboard cable family; GND between the two rails |
| R16 | 30R 0805 (Yageo RC0805FR-0730RL) | 30R 0402 (Stackpole RMCF0402FT30R0) | same as R15; no track needs to pass between its pads any more |
| TP6 | 1.5 x 1.5 mm pad | 1.0 mm round pad | sits in line on the MOTOR_SPI_MISO run, no stub |
| U3 (USB ESD) | ST USBLC6-2SC6 (SOT-23-6) | TI TPD4E05U06DQAR (USON-10) | one flow-through channel per USB-C data contact (A6, A7, B6, B7), no rail pin, so nothing back-feeds VBUS |

All other parts keep their reference, value, MPN and footprint.

### 1.5 Pinout and net changes

**Motor connectors J4-J8** (prototype PH order 1 GND, 2 SCK, 3 GND, 4 MOSI, 5 MISO, 6 CS):

| Pin | 1 | 2 | 3 | 4 | 5 | 6 | MP |
|---|---|---|---|---|---|---|---|
| Compact | MOSI | GND | MISO | SCK | GND | CS | GND |

The ESD arrays U4, U5, U12, U13, U14 were rewired so each line passes its channel in connector pin order (MOSI
1->10, MISO 2->9, SCK 4->7, CS 5->6; before: SCK, MOSI, MISO, CS). The motor-module connector must change to match.

**Motor buses.** Prototype: one SPI1 bus to all five connectors (CS PC5, PB0, PB1, PB2, PF11). Compact: three
buses, because one trunk to connectors on three edges would be over 150 mm with long stubs:
- SPI1 (PA5 / PA6 / PA7): J4 MOTOR 0 (CS PC5), J5 MOTOR 1 (CS PB0), net names MOTOR_SPI_* unchanged;
- SPI2 (PB13 / PB14 / PB15): J6 MOTOR 2 (CS PB12), J7 MOTOR 3 (CS PD8), nets MOTOR_R_SPI_*;
- SPI4 (PE2 / PE5 / PE6): J8 dribbler (CS PE3), nets DRIB_SPI_*.

**J10 kicker**: prototype 1 GND, 2 SCL, 3 SDA. Compact 1 SDA, 2 GND, 3 SCL, 4 GND, MP GND.

**J11 / J12 expansion**: prototype 1 +5V_EXT, 2 GND, 3 SCL, 4 SDA. Compact 1 GND, 2 GND, 3-4 +5V_EXT, 5 GND, 6 SCL,
7 GND, 8 SDA, MP GND.

**J13 OLED**: prototype Adafruit 326 8-pin header (1 SDA, 2 SCL, 3 GND, 4 NC, 5 GND, 6 NC, 7 +3V3, 8 GND).
Compact 1 GND, 2 +3V3, 3 SCL, 4 SDA.

**J15 powerboard**: prototype XH 8P: 1-2 +5V_RAW, 3-4 +3V3_RAW, 5-6 GND, 7 TX (via R34), 8 RX (via R33). Compact
PH 7P: 1 RX (via R33), 2 TX (via R34), 3 GND, 4 +3V3_RAW, 5 GND, 6 +5V_RAW, 7 GND. One contact per rail (2 A each).

**J3 SWD**: prototype 1 +3V3, 2 SWCLK, 3 SWDIO, 4 GND, 5 NRST. Compact STDC14: 3 +3V3, 4 SWDIO, 5 GND, 6 SWCLK, 7 GND,
11 GND, 12 NRST, others not connected.

**J9 radio link** (CB pin: prototype -> compact):

| J9 pin | Prototype | Compact |
|---|---|---|
| 1, 3, 5 | +3V3 | GND |
| 2 | ESP_RST | ESP_SPI_CS |
| 4 | ESP_DATA_READY | ESP_SPI_MOSI |
| 6 | ESP_HANDSHAKE | GND |
| 8 | ESP_SPI_MISO | ESP_SPI_SCK |
| 10 | GND | ESP_HANDSHAKE |
| 12 | ESP_SPI_SCK | ESP_DATA_READY |
| 15, 17, 19 | GND | +3V3 |
| 16 | ESP_SPI_MOSI | ESP_SPI_MISO |
| 20 | ESP_SPI_CS | ESP_RST |
| 7, 9, 11, 13, 14, 18 | GND | GND |

The compact order follows the radio module's pad order, so no radio link line crosses another (radio side) and
the CB takes the order on L4 with the PB6 / PB7 assignment. Full table: [INTERFACE.md](INTERFACE.md) §2.

**USB**: the prototype joined A6/B6 and A7/B7 at the connector (USB_DP_CON / USB_DM_CON) ahead of a 2-channel
USBLC6. The compact board passes every contact through its own U3 channel before the duplicates join.

**Power muxes**: U8 / U9 VIN1, VIN2 and VOUT were on jumper nets (M5_PB, M5_USB, M5_OUT, M3_PB, M3_USB, M3_OUT).
Now VIN1 = +5V_PB / +3V3_PB, VIN2 = VBUS / +3V3_LDO, VOUT = +5V / +3V3 directly.

### 1.6 MCU pin assignment changes (U2)

| Function | Prototype | Compact | Why |
|---|---|---|---|
| Radio SPI3 MOSI | PD6 (via R66) | PB5 (AF7, via R66) | keeps all radio pins on the north side next to J9 |
| Radio CS | PB5 | PG15 | as above |
| Radio HANDSHAKE | PB6 | **PB7** | so HS / DR reach J9 in its pin order without crossing |
| Radio DATA_READY | PB7 | **PB6** | as above |
| Radio SCK / MISO / RST | PB3 / PB4 / PE1 | unchanged | |
| microSD | SDMMC1 (PC8-PC12, PD2) | SDMMC2: PD6 CK, PD7 CMD, PG9-PG12 D0-D3 (D2 / D3 AF10) | pins face the microSD on the east edge |
| DotStar LEDs | SPI2 PB13 / PB15 | SPI6 PG13 / PG14 (BDMA, SRAM4) | SPI2 became the right-wheel bus |
| Motor CS 2 / 3 | PB1 / PB2 | PB12 / PD8 | moved with SPI2 |
| Dribbler | SPI1, CS PF11 | SPI4 PE2 / PE5 / PE6, CS PE3 | own bus on the west edge |

Firmware ported from the prototype must change these pins and swap the PB6 / PB7 defines and EXTI lines.

### 1.7 Power path and protection

- Mux jumpers and shunts removed (above). A failed TPS2116 now has to be replaced; there is no bypass.
- VBUS capacitance now permanently connected: C30 + C31 + C35 = 9.1 uF (USB limit 10 uF).
- Every external I2C pin has its own flow-through ESD array at its connector (U6 J11, U16 J12, U17 J10).
- USB ESD: TPD4E05U06 per contact instead of USBLC6.
- Input protection otherwise unchanged: Q1 AO3401A reverse-polarity FET on 5 V, D3 / D4 TVS0500 on the 5 V / 3.3 V
  inputs, F5 / F6 PTC fuses, F1 on VBUS, F3 / F4 on the expansion 5 V.

## 2. Radio: RadioBoard2027 -> RadioBoard2027_C_Inboard / _Overhang

### 2.1 Board

| Item | Prototype | Compact (both variants) | Reason |
|---|---|---|---|
| Outline | 36 x 54 mm | 30 x 40 mm | sits over the CB MCU inside the CB outline |
| Layers / stackup | 4, JLC04161H-7628 | 4, JLC04161H-3313 (0.0994 mm prepreg) | 50 ohm at 0.15 mm, room for the link and USB routing |
| Mounting | J2 only (hung off the CB east edge); four board-only M2 holes at the corners | J2 plus two M2 standoffs: H1 (14.0, 37.5), H2 (27.4, 37.5) | mechanical support |
| J2 | bottom, (18.8, 50.2), rotation 0, stock footprint | bottom, (3.70, 6.03), rotation 90, paste-in-hole footprint | shared interface position: no J2 shield pin under the module; Samtec rev G shield soldering |
| Module U1 | (18.0, 12.2), WROOM-1U footprint | Inboard (19.85, 17.9): WROOM-1 antenna area inside the board. Overhang (19.85, 11.5): WROOM-1 antenna past the north edge. Dual WROOM-1 / WROOM-1U footprint | either module fits; two antenna options for the fallback WROOM-1 build |
| USB-C J1 | (3.68, 31.0) | Inboard (3.70, 33.50), Overhang (3.70, 28.20), west edge | |

### 2.2 Parts removed

| Ref | Value | MPN | Why |
|---|---|---|---|
| R11 | 100k | Yageo RC0402FR-07100KL | PR1 divider top, replaced by the U7 supervisor |
| R14 | 1M | Yageo RC0402FR-071ML | PR1 hysteresis from ST, not needed with U7 |

### 2.3 Parts added

| Ref | Value | MPN | Why |
|---|---|---|---|
| U7 | TPS3840PL29 (SOT-23-5) | TI TPS3840PL29DBVR | drives U3 PR1: the host rail is selected only above 2.93-3.07 V and dropped below 2.86-2.94 V (the prototype R11 / R12 / R14 divider switched at about 2.34 V falling and 2.57 V rising). The module needs 3.0 V |
| C10 | 100nF 16V 0402 | Samsung CL05B104KO5NNNC | U7 VDD bypass |
| D5 | TVS0500DRV | TI TVS0500DRVR | second VBUS TVS: the USB pair runs between the two VBUS contact groups, so each group gets its own clamp |
| TP3 | GND test pad 1.0 mm | | GND next to the UART0 pads TP1 / TP2 |

### 2.4 Parts changed

| Ref | Prototype | Compact | Why |
|---|---|---|---|
| D4 | TI TVS0500DRV (WSON-6) on +3V3_HOST | Bourns CDSOD323-T03S (SOD-323, LCSC C3702214), 3.3 V VRWM, 4.0 V VBR min | the TVS0500 (6.5 V VBR min) let the TPS2116 (6 V abs max) and the module (3.6 V abs max) exceed their limits before it conducted |
| U2 (USB ESD) | ST USBLC6-2SC6 | TI TPD4E05U06DQAR | one flow-through channel per USB-C data contact; no supply pin |
| R12 | 68k | 100k | now only the PR1 pull-down that holds PR1 low while U7 is unpowered |
| U1 footprint | `ESP32-C5-WROOM-1U` | `ESP32-C5-WROOM-1_1U_DUAL` | accepts WROOM-1U (primary) and WROOM-1 (fallback) |
| J2 footprint | stock LSHM | paste-in-hole LSHM | as the CB J9 |
| C1, C8 | 22uF 16V | 22uF 25V (Samsung CL21A226MAQNNNE) | voltage margin |
| C2, C9, C3, C5 | 100nF / 1uF / 4.7uF without rating in the value | ratings in the value (16 V / 25 V / 25 V); C5 now Samsung CL21A475KAQNNNE | ratings reach the BOM |
| C6, C7 | Taiyo Yuden LMK107BBJ106MALT | Samsung CL10A106KP8NNNC | JLC-stocked |
| R1-R6, R8-R10, R13, R15 | Yageo / Panasonic | UNI-ROYAL 0402WGF equivalents | JLC basic parts; values unchanged |

### 2.5 Pin and net changes

**ESP32-C5 GPIO map.**

| Signal | Prototype | Compact | Why |
|---|---|---|---|
| HANDSHAKE | GPIO3 (pad 5) | GPIO1 (pad 7) | all link pads in one run of the module's west pad column |
| DATA_READY | GPIO4 (pad 17) | GPIO0 (pad 6) | as above |
| Status LED | GPIO24 (pad 23) | GPIO8 (pad 10) | moved off the link side; visible from above |
| SPI CLK / MOSI / MISO / CS, EN, BOOT, USB, UART0, PWR_SRC_HOST | GPIO6 / 7 / 2 / 10, EN, GPIO28, 13 / 14, 11 / 12, GPIO9 | unchanged | |

GPIO0 / GPIO1 double as the 32 kHz crystal pins: keep the RTC slow clock internal.

**J2** (radio pin: prototype -> compact):

| J2 pin | Prototype | Compact |
|---|---|---|
| 1 | ESP_EN | ESP_SPI_CS |
| 3 | ESP_DATA_READY | ESP_SPI_MOSI |
| 5 | ESP_HANDSHAKE | GND |
| 7 | ESP_SPI_MISO | ESP_SPI_SCK |
| 9 | GND | ESP_HANDSHAKE |
| 11 | ESP_SPI_SCK | ESP_DATA_READY |
| 15 | ESP_SPI_MOSI | ESP_SPI_MISO |
| 19 | ESP_SPI_CS | ESP_EN |
| 2, 4, 6 | +3V3_HOST | GND |
| 16, 18, 20 | GND | +3V3_HOST |
| 8, 10, 12, 13, 14, 17 | GND | GND |

**Link ESD.** U5 now carries EN, MISO, DATA_READY and U6 carries SCK, HANDSHAKE, MOSI, CS (before: U5 MISO, SCK,
MOSI, CS; U6 EN, DATA_READY, HANDSHAKE), so each line meets its protector in J2 pin order.

**USB.** The duplicate contacts were joined at the connector (USB_DP_CON / USB_DN_CON) ahead of a USBLC6; now all
four contacts pass U2 before they join. The J1 shield is tied to GND (was not connected).

### 2.6 Power path

- PR1 of U3 (TPS2116) is driven by U7 (TPS3840PL29) instead of the R11 / R12 divider with R14 hysteresis.
  Prototype switchover (R11 100k / R12 68k, R14 1M from ST): about 2.34 V falling and 2.57 V rising at VREF 1.00 V;
  2.15-2.53 V falling and 2.37-2.78 V rising over VREF 0.92-1.08 V (resistor tolerance not included). Compact: 2.857-2.944 V falling, 2.932-3.069 V rising.
- D4 changed to a 3.3 V TVS (above).
- Second VBUS TVS D5 added.

## 3. What did not change

- MCU (STM32H723ZGT6), crystal (25 MHz ABM8), IMU part (LSM6DSV320X), microSD socket (Hirose DM3AT-SF-PEJM5), USB-C
  connector (GCT USB4110-GF-A), power muxes (TPS2116), fuses, the radio module (ESP32-C5-WROOM-1U
  N8R8) and the mezzanine part (Samtec LSHM-110-02.5-L-DV-A-S-K-TR).
- The LDOs (CB U7, radio U4) were Diodes AP7361C-33E-13 in the prototype; the compact boards fit the Microchip
  MCP1826S-3302E/DB (LCSC C638624) because the AP7361C was out of stock everywhere on 2026-11-07. Same SOT-223
  pinout and footprint; the AP7361C stays as `MPN_ALT`.
- ESP-Hosted SPI pins on the ESP32-C5 (GPIO6 / 7 / 2 / 10), the radio reset and boot circuits, the radio power mux.
- CB I2C bus assignment (I2C1 OLED, I2C2 kicker, I2C4 expansion, I2C5 IMU), UART4 to the powerboard, DIP, buttons
  and their pins.

Related documents: [../README.md](../README.md), [INTERFACE.md](INTERFACE.md), [FIRMWARE.md](FIRMWARE.md).
