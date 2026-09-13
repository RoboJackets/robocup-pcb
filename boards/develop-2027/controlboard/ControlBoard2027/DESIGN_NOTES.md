# ControlBoard2027 Design Notes - Super Clauded. !!!NOT AUTHORITATIVE!!!

Why each part and value on this board was chosen, the firmware settings the hardware
depends on, and the issues still open. Schematic notes point to sections here by number
(for example "DESIGN_NOTES §3") and to open issues by ID (for example "M7").

Datasheets are the reference for every number. Where a value comes from a calculation,
the inputs and the source table are given.

**Contents**

1. [Sources](#1-sources)
2. [Power architecture](#2-power-architecture)
3. [Power input and eFuses](#3-power-input-and-efuses)
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
| RM0468 | STM32H723 reference manual (st.com did not serve it during the audit) |
| AN2606 | STM32 system bootloader, Rev 61, STM32H72x section (Tables 111/112) |
| SLVSET8A | TI TPS2596 / TPS25962x / TPS25963x eFuse |
| SLVSFG1A | TI TPS2116 power mux |
| DS37274 | Diodes AP7361C LDO |
| TVS0500 | TI TVS0500 flat-clamp TVS |
| AO3401A | AOS AO3401A P-FET |
| MF-MSMF | Bourns MF-MSMF PTC |
| SCLS264R | TI SN74AHCT125 |
| BMI088 | Bosch BST-BMI088-DS001 Rev 1.9 |
| BB2020 | American Bright BB-2020BGR-TRB |
| ABM8 | Abracon ABM8 crystal |
| SLVA689 | TI I2C pull-up resistor calculation |
| SLVSBO7O | TI TPD6E05U06 |
| USBLC6 | ST USBLC6-2 |
| USB 2.0 | USB 2.0 spec plus the VBUS Max Limit and Device Capacitance ECNs |
| Type-C | USB Type-C specification |
| XKTF-015 | microSD socket drawing |
| OLED326 | Adafruit 326 guide and Eagle board files (STEMMA QT and v2.1) |
| SSD1306 | Solomon Systech SSD1306 |
| ESP32-C5 | Espressif ESP32-C5 and ESP32-C5-WROOM datasheets |
| ESP-Hosted | Espressif esp-hosted-mcu, SPI full-duplex design |
| V0.3 | ControlBoard_TestingV0.3 CubeMX report and clock tree |

Backup references in the repo: `nucleo/MB1364` (ST Nucleo-144 H7), `rev-2026/control-v4.1-stm32`,
`drive-motorboard/motor-module`, `rev-2026/kicker-v3.4`, `daughterboard`.

---

## 2. Power architecture

The powerboard supplies 5V and 3V3 on J1. USB supplies 5V as a bench fallback.

| Rail | Source | Loads |
|---|---|---|
| +5V_PB | Powerboard, after Q1 and U8 | DotStars, U7, U1 VIN1 |
| +3V3_PB | Powerboard, after U9 | Radio (J14), U2 VIN1 |
| VBUS_SW | USB, after U13 | U1 VIN2, U3 |
| +3V3_LDO | U3 from VBUS_SW | U2 VIN2 |
| +5V | U1 output (powerboard, else USB) | Motor connectors, U15 (+5V_EXT) |
| +3V3 | U2 output (powerboard, else USB) | MCU, SD, IMU, OLED, pull-ups, motor 3V3 |

The radio and DotStars sit on the powerboard-only rails on purpose. On USB alone they stay
unpowered, which keeps USB current under U13's 0.5A limit without a load switch.

---

## 3. Power input and eFuses

### J1 powerboard connector
JST B8B-XH-A. Pins 1-2 +5V, 3-4 +3V3, 5-6 GND, 7 PWR_UART_TX, 8 PWR_UART_RX. 3A per contact
with AWG22 (JST XH). UART4 on PA0/PA1 (FT pins), 115200, 3.3V logic.

R46/R47 (1k) sit in series with the UART lines. They limit current into an unpowered
powerboard and injection into PA0/PA1 (DS13313 Table 10 allows -5/+0mA).

### Q1 reverse polarity (5V only)
AO3401A P-FET: -30V, -4A, Vgs abs max ±12V. Drain to the input, source to the load, gate to
GND through R43 100k. D11 (10V zener) keeps Vgs inside ±12V. RDS(on) ≤60mΩ at -4.5V, so 135mW
at 1.5A. The 3V3 input has no series FET: its drop would take the radio below 3.0V (see M2).

### D9, D10 input TVS
TVS0500DRV on both inputs: VRWM 5V, VBR 7.5-8.4V, flat clamp 9.2V at 43A. They handle surge
and ESD only; the eFuse clamp handles overvoltage. The eFuse inputs are rated to 21V. Using
the same part on the 3V3 input means it stays off if 5V lands on the 3V3 pins (M1).

### U8 (5V) and U9 (3V3) eFuses
TPS259621DDA: 2.7-19V, 89mΩ typ (143mΩ hot), current limit 0.125-2A, auto-retry, output
overvoltage clamp.

The clamp variant was chosen over TPS25963x (adjustable overvoltage lockout). The lockout
releases 95mV below its trip point at the pin, and the divider multiplies that. With the
dividers needed here the output re-enabled only below 3.25-3.49V (3V3) and 4.96-5.36V (5V),
which overlaps normal supply voltages. One overshoot could leave a rail off. The clamp has no
latched state.

| | U8 (5V) | U9 (3V3) |
|---|---|---|
| UVLO divider (1.2V at EN) | R48 121k / R49 47k → 4.29V | R53 61.9k / R54 47k → 2.78V |
| OVCSEL | R50 402k to GND | tied to GND |
| Clamp starts | 5.54-5.83V | 3.75-3.92V |
| Output held at | 5.28-5.61V | 3.47-3.70V |
| RILM | R51 604Ω → 1.51A | R56 453Ω → 2.01A |
| dVdt cap | C52 22nF → 2.0V/ms | C53 22nF → 2.0V/ms |

- Current limit: RILM = 903 / (ILIM - 0.0112) (SLVSET8A Eq. 7).
- OVCSEL: SLVSET8A §7.5 specifies 400k for the 5.7V option; 402k is the nearest E96 value.
- Slew rate: 2.11µA × 20.93 / C (SLVSET8A). Rate dVdt capacitors for at least 4V.
- VIN must stay below the selected clamp in normal operation (SLVSET8A rating note). The
  3V3 clamp keeps +3V3_PB under the STM32 4.0V abs max.
- FLT (open drain) outputs are wired together with R52 10k to +3V3 → PWR_FAULT (PA4). FLT is
  asserted on thermal shutdown, not on current limit or clamping (SLVSET8A Table 3).
- C56/C57 100nF at the IN pins (SLVSET8A §9.2).

---

## 4. Power mux, USB power and LDO

### U1 (5V) and U2 (3V3) TPS2116 muxes
Priority mode (MODE tied to VIN1). VIN1 is the powerboard rail, VIN2 the USB side. VREF is
0.92/1.00/1.08V with no built-in hysteresis.

| | U1 5V | U2 3V3 |
|---|---|---|
| PR1 divider | R1 100k / R2 33k | R3 100k / R4 68k |
| Hysteresis | R58 1M from ST | R60 1M from ST |
| Switchover (VREF typ) | ~3.80V falling / 4.13V rising | ~2.24V falling / 2.57V rising |

- ST is open drain. R57/R59 10k pull it up to 3V3. PWR_SRC_5V goes through R83 1k to PA2;
  PWR_SRC_3V3 goes to PA3. High means the powerboard is selected.
- R83: ROM bootloaders before V9.3 drive USART2 TX (PA2) push-pull (AN2606 V9.3 change
  note). With USB power ST is low, and R83 limits that contention to 3.3mA.
- While VIN1 is selected it stays tied to VOUT until PR1 drops below VREF (SLVSFG1A §7.6.1).
  With USB attached and the powerboard removed, the rail therefore sags to the switchover
  voltage first. See M7 for why this is accepted.
- C1, C7 10uF at VIN1, C2 10uF at VIN2, C3/C8 22uF and C4/C9 100nF at the outputs.

### U13 USB VBUS eFuse
TPS259621DDA between VBUS and VBUS_SW.

- Inrush: USB 2.0 §7.2.4.1 limits attach capacitance to 10µF, including capacitance visible
  through regulators. About 107µF sits behind VBUS_SW, so U13 soft-starts it with C54 47nF
  (0.82-1.07V/ms).
- UVLO R77 110k / R78 47k → 4.01V. USB guarantees 4.40V at the device.
- R79 402k on OVCSEL: the clamp starts at 5.54-5.83V, so a 5.50V VBUS (USB 2.0 VBUS Max Limit
  ECN) passes.
- R80 1.82k → 0.455-0.560A. FLT joins PWR_FAULT.
- C55 2.2uF X7R ≥10V at the connector side. The USB Device Capacitance ECN requires 1-10µF on
  VBUS and SLVSET8A §9.2 asks for ≥1µF; 2.2µF stays above 1µF after DC bias.
- R45 100k bleeds VBUS_SW to 0V while U13 is off (50µA), so U1 VIN2 does not float.

### U3 AP7361C-33E LDO
1A, 360mV dropout at 1A, stable with ≥2.2µF MLCC (DS37274). SOT-223: 1 IN, 2 GND, 3 OUT.
On USB alone it carries the MCU, SD, IMU and OLED, about 0.35A: (5.0 - 3.3) × 0.35 = 0.6W.
C5/C6 10uF in and out.

### Rail LEDs and test points
D1/D2 Kingbright APT1608EC red: VF 2.0V typ, 30mA max. R5 1k → 3.0mA on 5V, R6 470Ω → 2.8mA on
3V3. TP7 (+5V_PROT) and TP8 (+3V3_RAW) with TP1/TP2 measure the eFuse plus mux drop. TP9/TP10
give logic-analyser access to the powerboard UART.

---

## 5. MCU, clock and supply pins

### U4 STM32H723ZGT6
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

C49/C50 12pF C0G: CL = (12 + 5)(12 + 5) / 34 + 1-2pF board = 9.5-10.5pF, with 5pF pin
capacitance (DS13313). Raise them if the measured frequency is high, lower them if low.

R86 (0Ω) sits in series with OSC_OUT (PH1). The ABM8 drive limit is 100µW; the estimate is
53µW at 1.0Vpp but 103µW at 1.4Vpp. Measure on the first board and fit a few hundred ohms if
needed (m9).

### Supply pins
- C10-C20 and C23 100nF: one at each of the 11 VDD pins and VBAT. C21 10uF and C22 4.7uF bulk.
- C24 4.7uF + C25 100nF at VDD33USB (pin 95).
- VDDA (pin 33) and VREF+ (pin 32) go straight to +3V3 without a ferrite, as on the Nucleo:
  C28+C29 at VDDA, C30+C31 at VREF+.
- PDR_ON (pin 143) to +3V3 enables the internal reset. VBAT (pin 6) to +3V3, no battery.
- VCAP pins 71 and 106 are joined with C26 and C27 2.2µF (X7R ±10%, ≥6.3V, ESR under 100mΩ).
  DS13313 Table 14 note 3 treats the VCAP pins as one node, and the Nucleo ties them. KiCad
  ERC flags the tie because the symbol types both pins as power output (m21).
- Each decoupling capacitor has a text label naming its pin; place it beside that pin.

### Reset and boot
R7 10k BOOT0 pull-down holds 0.15V at worst-case leakage against a 0.73V input-low limit.
C32 100nF on NRST. SW2 pulls BOOT0 to 3V3 for DFU.

### Other MCU-side parts
- R41/R42 22Ω in series with PA5/PA7 (motor SPI SCK/MOSI) at the MCU. MISO has none.
- R61 47k / R62 68k divide VBUS to PA9, which firmware reads as a GPIO. The divider ratio is
  0.591: 2.60V at 4.4V VBUS (input-high threshold 2.31V, DS13313 Table 51), 3.10V at 5.25V.
  The pin's 4.0V abs max (with VDD off) is only reached at 6.77V VBUS. The divider sits
  upstream of U13 so it senses the cable itself.
- R81 10k pull-up on PA15. The bootloader runs SPI3 as a slave on PC10-PC12 (the SD bus) with
  NSS on PA15 and no pull (AN2606 Table 111). Holding NSS high keeps SD activity from
  selecting SPI3 instead of USB DFU.

---

## 6. I2C pull-ups

All buses run at 400kHz. One pull-up pair per bus, all on sheet 02.

| Bus | Pins | Pull-ups | Notes |
|---|---|---|---|
| IMU (I2C5) | PF0/PF1 | R16/R17 4.7k | Short on-board bus |
| Kicker (I2C2) | PB10/PB11 | R30/R31 2.2k | Cabled |
| Expansion (I2C4) | PF14/PF15 | R32/R33 2.2k | Cabled, J11 and J12 share it |
| OLED (I2C1) | PB8/PB9 | R34/R35 3k | Module adds 10k |

Fast mode allows a 300ns rise time and 3mA sink at 0.4V. Rise time = 0.8473 × Rp × Cb
(SLVA689). With resistors at +5%, maximum bus capacitance is 72pF for 4.7k, 112pF for 3k and
153pF for 2.2k. Minimum Rp = (3.66V - 0.4V) / 3mA = 1.09k.

The kicker and expansion buses may need 1.5k (236pF budget) once real cables are fitted.
Measure SCL rise time at TP16/TP17 and change only if it exceeds 300ns. Expansion boards
must not add their own pull-ups.

---

## 7. USB and debug

- J2 GCT USB4110-GF-A, USB 2.0 Type-C: VBUS 5A total, 0.25A per signal pin. A6/B6 and A7/B7
  join at the connector with stubs under 3.5mm.
- R8/R9 5.1k on CC1/CC2 set the sink role (Type-C Rd ±20%).
- U5 USBLC6-2SC6 on D+/D- (pins 1↔6 D+, 3↔4 D-), 3.5pF max. Its rail pin (5) goes to +3V3,
  not VBUS. On VBUS, the D+ 1.5k pull-up back-feeds VBUS to about 2.8V through the internal
  diode when the cable is unplugged, and the board cannot see the detach. Full-speed
  signalling stays under 3.6V, so a 3V3 rail reference is enough.
- No series resistors on D+/D-: the STM32 full-speed driver is already 28-44Ω.
- F1 Bourns MF-MSMF075-2 (1812): hold 0.75A / trip 1.50A at 23°C, 0.60A hold at 50°C,
  0.11-0.45Ω. It holds above U13's 0.56A limit when warm, so U13 limits first and F1 only
  backs up a U13 failure or cable short. The MF-MSMF050 held only 0.40A at 50°C.
- J3 SWD: 1 VTref, 2 SWCLK, 3 SWDIO, 4 GND, 5 NRST. Pins 1-4 match the motor-module cable.
  D8 BAT54 on VTref stops a probe from back-powering +3V3; VTref reads 2.98-3.06V. J3 must be
  keyed: reversed, VTref and GND land on NRST.
- R39/R40 22Ω on SWCLK/SWDIO damp cable ringing. They do not protect against a mis-plugged
  5V probe. 0Ω also works.
- SW1 reset. SW2 BOOT0 to 3V3. The ROM DFU uses HSI48 with CRS, so it needs neither the
  crystal nor VBUS sensing.

---

## 8. SD card

- J4 XKTF-015 microSD socket. The drawing shows a card-detect terminal but not its return path
  or polarity. SH goes to GND on the assumption that detect returns through the shell; check
  a sample before release (m13). J4 needs a custom footprint.
- R10-R14 47k pull-ups on DAT0-3 and CMD, inside the SD range of 10-100k. Idle high is at
  least 2.79V against the card's 2.06V and the MCU's 2.31V input thresholds. CLK has none.
- R15 10k card-detect pull-up on PG7 (net SD_DETECT, CubeMX label Detect_SDIO).
- R63 22Ω in series with SDMMC_CK at the MCU (PC12). The pin's ~25Ω plus 22Ω matches a 50Ω
  trace, so reflections are absorbed at the source instead of ringing into a false clock edge.
  Edge time is about 1.9ns with about 26ns setup margin at 24MHz.
- U14 TPD6E05U06RVZR on CLK (card side of R63), CMD and DAT0-3: VRWM 5.5V, 10nA leakage max,
  0.47pF per line (SLVSBO7O Table 4-3). Place at J4.
- C33 10uF + C34 100nF at the card supply. Card VDD is not switchable (M18).
- Clock: SDMMC kernel = PLL1Q = 48MHz, f = 48 / (2 × CLKDIV). CLKDIV 3 gives 8MHz for bring-up,
  CLKDIV 1 gives 24MHz, the fastest Default Speed setting (25MHz max).
- TP11 is the SD clock at the card.

---

## 9. IMU, DIP switch and buttons

### U6 BMI088
I2C mode. All 16 pins follow BMI088 Table 14 and Figure 9: PS and CSB1 to VDDIO, CSB2, INT2 and
INT4 open. R37/R38 10k SDO straps give accelerometer 0x18 and gyro 0x68. C35/C36 100nF at VDD and
VDDIO. VDD range 2.4-3.6V.

R64/R65 100k pull-downs on ACCEL_EXTI (PF3) and GYRO_EXTI (PF2). INT1 is off at power-up. INT3
resets to open drain, so firmware writes 0x16 = 0x01 (push-pull, active high) or the gyro
interrupt never appears. The IMU has no reset pin (m16).

### SW3 DIP switch
Six positions for robot ID on PF7-PF10, PC0, PC1; closed reads 0. R18-R23 100k pull-ups. Input
leakage is ±250nA max (DS13313 Table 51) against a 2.31V input-high threshold:

| Pull-up | Current per closed switch | Worst-case high |
|---|---|---|
| 10k | 330µA | 3.30V |
| 100k (used) | 33µA | 3.28V |
| 1M | 3.3µA | 3.05V, still valid but slow and noise-prone |

100k gives a solid high at low current and still enough wetting current for gold contacts.
Read at boot; add 100nF per pin if read continuously.

### SW4-SW6 user buttons
Active low. R24-R26 10k pull-ups, R27-R29 10k series, C37-C39 100nF at the MCU pin. Press time
constant 0.76-1.26ms (R27 × C37), release 1.5-2.5ms ((R24 + R27) × C37). Peak switch current is
0.76mA and the pin stays inside the rails. The PTS820 datasheet could not be retrieved, so the
4-pad to 2-pin mapping is unverified (m15).

---

## 10. DotStar LEDs

- Power comes from +5V_PB, so the LEDs never load USB. U7 inputs are rated -0.5 to 7V
  independent of VCC and leak ±1µA at VCC = 0V (SCLS264R), so MCU drive is safe while U7 is off.
- D3-D7 BB-2020BGR-TRB (APA102-2020 compatible): VDD 4.5-5.5V, input high 0.7 × VDD = 3.5V,
  clock 15MHz abs and under 10MHz operating (p6), 70°C max ambient (p3). The power-on state is
  not specified, so firmware sends an all-off frame first.
- The stock KiCad APA102-2020 footprint does not fit; build one from the BB-2020BGR-TRB land
  pattern (C1).
- U7 SN74AHCT125 shifts 3.3V to 5V. It must be AHCT (TTL input high 2.0V); AHC needs 3.5V.
  Gates 1/2: pin 2→3 CKI, 5→6 SDI, OE pins 1/4 to GND. Gates 3/4: inputs 9/12 to GND, OE 10/13
  to +5V_PB (disabled), outputs open. Propagation delay is 6.5ns max at 15pF, 2% of a 333ns
  bit at 3Mbit/s.
- R66/R67 100k pull-downs on LED_SPI_SCK/MOSI hold the inputs at 0.13V (vs 0.8V input-low
  limit) while the MCU pins are Hi-Z at reset. AHCT has no bus hold.
- C45 100nF at U7, C40-C44 100nF one beside each LED, C51 22uF X5R/X7R ≥10V where +5V_PB
  enters. Each LED can draw 0.5W (BB2020 p3), so 500mA for the chain.
- TP18/TP19 on D7 SDO/CKO: valid data at the end of the chain proves all five LEDs pass it.

---

## 11. Connectors

### Motor connectors J5-J9 (interface still open)
JST S8B-PH-K-S, 2A per contact with AWG24. Order matches motor-module J2: 1 +5V, 2 GND, 3 +3V3,
4 GND, 5 SCK, 6 MOSI, 7 MISO, 8 CS. J9 is the dribbler. R68-R72 10k CS pull-ups hold the modules
deselected through reset. R74 100k pull-down on SCK. U10/U11 TPD4E05U06 ESD at the connectors.

### I2C connectors J10-J12 and U15
- J10 kicker I2C, J11/J12 expansion I2C: +5V_EXT, GND, SCL, SDA. U12 TPD4E05U06 protects SCL/SDA
  and must sit at the connectors, so J10-J12 stay together (m8).
- U15 TPS259621DDA feeds +5V_EXT from +5V. A PTC could not trip before U8's 1.51A limit, so a
  shorted cable would have dropped all of +5V. R82 1.13k sets 0.81A (SLVSET8A Eq. 7). R84 100k
  pulls EN to VIN (allowed below 6V by the SLVSET8A rating note). C58 100nF at IN. OVCSEL open
  (13.8V clamp; the input is already clamped by U8), dVdT open, FLT unused.

### J13 OLED (Adafruit 326)
1 SDA, 2 SCL, 3 DC/SA0 to GND, 4 RST NC, 5 CS to GND, 6 3V3 out NC, 7 Vin +3V3, 8 GND. The
STEMMA QT and v2.1 boards use the same pin numbers, but the header is rotated 180° and the
holes differ. The schematic assumes STEMMA QT, which has its own reset chip (M5). Address 0x3C;
SA0 goes through a diode on the module, so firmware also probes 0x3D. H1-H4 are the M2 mounting
holes.

### J14 radio mezzanine
2x10: +3V3_PB on pins 1/3/19, GND on every even pin (one opposite each signal), ESP SPI (SPI3),
HANDSHAKE, DATA_READY and RST.

- Three power pins carry 217mA each against a 408mA TX peak (m3).
- +3V3_PB leaves the radio unpowered on USB alone. Firmware then holds its pins low or Hi-Z.
- R73 10k ESP_SPI_CS pull-up goes to +3V3_PB, so no current flows into an unpowered ESP.
- R75/R76 100k pull-downs on HANDSHAKE/DATA_READY stop false interrupts with the radio absent.
  The daughterboard must keep these off ESP32-C5 strapping pins (m1).
- C47 22uF + C48 100nF local decoupling on +3V3_PB.

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
- **SPI3 radio** (PB3 SCK, PB4 MISO, PD6 MOSI, PG15 CS): 3Mbit/s, mode 3 as in V0.3. Hardware
  CRC off and 8-bit frames: ESP-Hosted uses fixed 1600-byte frames with its own checksum, and
  STM32 CRC would add a phase the slave never sends (M4). Enable the internal pull-up on PB4.
- **SDMMC1** (PC8-PC12, PD2), 4-bit: CLKDIV 3 (8MHz) for bring-up, then CLKDIV 1 (24MHz) after
  checking the clock at TP11. Card detect PG7, no internal pull, low = card present. Recover a
  hung card with CMD0 (M18).
- **I2C1 OLED, I2C2 kicker, I2C4 expansion, I2C5 IMU**: 400kHz. Let CubeMX recompute the Timing
  value after the clock change; never copy V0.3's hex value. Enter measured rise/fall times.
  Internal pull-ups off. Run bus recovery (up to 9 SCL clocks, then STOP) before each init.
- **IMU**: after any PWR_SRC change or I2C error, re-read the configuration registers and
  re-initialise if they changed (m16).
- **UART4 powerboard** (PA0 TX, PA1 RX): 115200 8N1. Drive TX only once PWR_SRC shows the
  powerboard is present, so R46 does not back-feed an unpowered powerboard.
- **USB** (OTG_HS in FS mode, PA11/PA12): read PA9 as a GPIO and call HAL_PCD_DevConnect /
  DevDisconnect on its edges. The OTG_HS comparator threshold is not in DS13313, and the
  divider is sized for the GPIO threshold. USB 2.0 §7.1.5 requires the D+ pull-up to be off
  without VBUS. Keep LPM consistent between the peripheral and the middleware (V0.3 has them
  different).

### GPIO

| Pin | Net | Mode | Why |
|---|---|---|---|
| PA2 | PWR_SRC_5V | Input, polled | R57 pull-up on U1 ST via R83; high = powerboard 5V. EXTI2 belongs to PF2 (m11) |
| PA3 | PWR_SRC_3V3 | Input, polled | R59 pull-up on U2 ST; high = powerboard 3V3. EXTI3 belongs to PF3 |
| PA4 | PWR_FAULT | Input, polled | R52 pull-up, low = eFuse thermal fault. EXTI4 belongs to PE4 |
| PA9 | VBUS_SENSE | GPIO input | R61/R62 divider on cable VBUS |
| PA15 | (unused) | Reset / analog | R81 holds bootloader SPI3 NSS high |
| PC5, PB0, PB1, PB2 | MOTOR0-3_SPI_CS | Output PP, init high | R68-R71 hold CS high through reset |
| PF11 | DRIBBLER_SPI_CS | Output PP, init high | R72 |
| PG15 | ESP_SPI_CS | Output PP, init high | R73 to +3V3_PB; drive low while PWR_SRC_3V3 is low |
| PB7 | ESP_RST | Open drain, init released | ESP EN pull-up is on the daughterboard; never drive high |
| PB5 | ESP_HANDSHAKE | EXTI rising | R75 pull-down |
| PB6 | ESP_DATA_READY | EXTI rising | R76 pull-down |
| PF3 | ACCEL_EXTI | EXTI rising | R64 pull-down; set INT1 push-pull active high (BMI088 5.3.16) |
| PF2 | GYRO_EXTI | EXTI rising | R65 pull-down; set INT3 push-pull active high (BMI088 5.5.10) |
| PE4, PC13, PC14 | USER_EXTI0-2 | EXTI falling | Buttons pull low; ~1ms RC debounce. V0.3 uses rising |
| PF7-PF10, PC0, PC1 | DIP0-5 | Input | R18-R23 pull-ups; closed = 0 |
| PG7 | SD_DETECT | Input | R15 pull-up; low = card present |

- PC13: keep RTC tamper and wake-up disabled.
- Set "Set all free pins as analog" to Yes (V0.3: No).
- OLED: probe 0x3C and 0x3D (M5).
- Power-source changes: poll PA2/PA3/PA4. On any change, re-initialise SD, IMU and OLED (M7).
- While PWR_SRC_3V3 is low, hold PB3, PB4, PD6, PG15 and PB7 low or Hi-Z so the unpowered radio
  is not back-fed; restart ESP-Hosted when it goes high. Resend the LED frame after PWR_SRC_5V
  goes high.
- The motor modules must release MISO while their CS is high (M9).

### Bootloader (DFU)
BOOT0 high at reset starts the ROM bootloader, which answers the first interface that shows
activity (AN2606). Board nets on bootloader pins (AN2606 Table 111):

| Pins | Bootloader use | Board net | Effect |
|---|---|---|---|
| PA2/PA3 | USART2 | PWR_SRC_5V / PWR_SRC_3V3 | Static levels, cannot send 0x7F |
| PB10/PB11 | USART3 | Kicker I2C | Idle high |
| PA9/PA10 | USART1 | VBUS_SENSE / unconnected | Static |
| PA4-PA7 | SPI1 | PWR_FAULT (NSS) + motor SPI | NSS high except during an eFuse fault; no clock edges arrive (m12) |
| PC10-PC12 | SPI3 | SD DAT2/DAT3/CLK | NSS on PA15 held high by R81 |
| PB6/PB9 | I2C1 | ESP_DATA_READY / OLED SDA | SDA stays high, so no start condition |
| PF0/PF1 | I2C2 | IMU bus | Idle high |
| PA8/PC9 | I2C3 | Unconnected / SD DAT1 | Static |
| PA11/PA12 | USB DFU | USB connector | Used |

Bootloaders before V9.3 drive USART TX push-pull (AN2606 V9.3 change note): PA2 into U1 ST
through R83 (3.3mA) and PA9 into the VBUS divider. Both are harmless. Those versions also lock
PWR_CR3 until power-off, so power-cycle after DFU before running the application.

---

## 13. Open issues

IDs stay fixed. Closed items are removed, not renumbered.

### Critical (release blockers)

**C1 DotStar footprint.** D3-D7 have no footprint, and the stock APA102-2020 footprint does not
match the BB-2020BGR-TRB 2x3 land pattern (BB2020 p2). The drawing does not say whether it is a
top or bottom view. Confirm with the vendor or a sample, then build the footprint.

**C2 CubeMX HSE setting.** V0.3 sets HSE to 48MHz with PLL1 /3 ×12. With the 25MHz crystal the VCO
lands at 100MHz, below the 192MHz minimum. Apply the clock tree in §12.

**C3 Footprints, MPNs and ratings.** 17 of 211 parts have a footprint and the PCB file is empty.
Capacitors need voltage and dielectric ratings (dVdt caps ≥4V; C51, C47, C55 X5R/X7R ≥10V).

### Major

**M1 J1 pinout.** +5V (pin 2) sits next to +3V3 (pin 3). A crimp fault puts 5V on the 3V3 input.
U9 clamps its output, but sustained 5V on U9 IN violates the "VIN below the clamp" rating and
ends in thermal cycling. A GND pin between the rails fixes it; needs agreement with the
powerboard. The 3V3 input also has no reverse protection: a mirrored cable puts -3.3V on U9 IN
(abs min -0.3V).

**M2 3V3 margin.** At 1.25A hot, U9 (143mΩ) + U2 (59mΩ) + J1 (20mΩ) drop 0.28V. The radio sits
before U2, so it sees about 0.2V less than the powerboard: a 3.30V powerboard gives about 3.1V
against the ESP32-C5's 3.0V minimum. Ask for 3.4V ±3%, which stays under U9's 3.75V clamp.

**M3 Rail budget.** U9's 2.01A limit is the TPS2596 maximum. On 5V, U15 (0.81A) plus the DotStars
(500mA) plus the motor modules must fit under U8's ~1.35A minimum. Motor module current is not
yet known.

**M4 SPI3 configuration.** V0.3 has hardware CRC on and 4-bit frames. Set CRC off and 8-bit.

**M5 OLED variant.** The schematic assumes the STEMMA QT board (reset chip, J13.4 NC). The v2.1 board
has no reset chip, and the SSD1306 needs RES# held low ≥3µs after power-up. SA0 reaches the chip
through a diode (about 0.5-0.6V against 0.66V max low), so probe both addresses. Order STEMMA QT
and take J13 and H1-H4 from its board file.

**M6 Connector parts.** J10-J12 are generic, unkeyed and have no MPN. J14 needs a latching
mezzanine. J1 JST-XH is friction lock and rated 3A only with AWG22. J3 needs a keyed header.

**M7 Mux switchover sag (bench only).** With USB attached, removing the powerboard lets +3V3 sag to
2.13-2.55V and +5V to 3.42-4.20V before the mux switches, because VIN1 stays tied to VOUT until
PR1 falls. Sensing PR1 before the eFuse is not an option: MODE is tied to VIN1, and MODE low with
PR1 high turns the mux off (SLVSFG1A truth table), which would cut the rail during eFuse
soft-start. On the robot there is no USB, so this never happens. Handled with a BOR level and
firmware re-initialisation. The radio and DotStars are on the powerboard-only rails and never
see the mux.

**M9 Shared motor MISO.** All five modules share MISO. It works only if each module releases MISO
while deselected. Add a 100k pull-down if they do not.

**M10 No mating kicker or radio design.** The only kicker in the repo (v3.4) uses SPI with RESET
over 8 pins, not I2C. The in-repo daughterboard is the Seeed XIAO ESP32-C5 reference, not the
WROOM-1U design. Freeze J10 and J14 before layout.

**M11 SPI2 pin.** V0.3 puts SPI2_SCK on PA9; the board uses PB13. Re-pin in the .ioc.

**M16 Voltage scaling.** 240MHz SYSCLK exceeds the 200MHz AHB limit at VOS1. Use HPRE /2 at VOS1,
or VOS0 with its 105°C junction limit.

**M17 SPI clock float.** With Keep IO State disabled, PB3 floats between transfers and can add a
clock edge. Enable Keep IO State on SPI1-3.

**M18 SD card power.** Card VDD is hard-wired to +3V3. A hung card is recovered with CMD0; a card
that ignores CMD0 needs a board power cycle. Accepted to keep the circuit simple (logging only).

### Minor

- **m1** Daughterboard: diode-OR its own USB 3V3 so it does not drive +3V3_PB, pull ESP EN up, and
  keep HANDSHAKE/DATA_READY off ESP32-C5 strapping pins (GPIO7, 25-28, MTMS, MTDI). R75/R76 100k
  against a 45k internal pull-up gives 2.28V, below the 2.475V input-high threshold. ESP_RST has
  no pull on this board.
- **m2** DotStar VDD is 4.5-5.5V. +5V_PB drops about 0.1V through Q1 and U8 at 0.5A, so a 5.0V
  powerboard gives about 4.9V. LEDs are rated to 70°C ambient; cap brightness in firmware.
- **m3** J14 carries 217mA per power pin against a 408mA TX peak; check the mezzanine rating.
- **m4** Motor SPI termination and speed (motorboard scope): R41/R42, 6 vs 15.625Mbit/s.
- **m5** J10-J12 pin order is not Qwiic. 3.3V pull-ups do not suit 5V-logic slaves, and a far-side
  5V pull-up is only safe while the MCU is powered (DS13313 Table 9).
- **m6** Cabled I2C: 2.2k allows 153pF. Measure at TP16/TP17.
- **m8** U12 serves J10 and J11/J12 and must sit at the connectors, so keep them together.
- **m9** Crystal drive level may reach 103µW at 1.4Vpp (max 100µW). Measure and fit R86 if
  needed. ABM8 is rated -20 to 70°C.
- **m11** PA2/PA3/PA4 share EXTI lines with PF2, PF3 and PE4; poll them.
- **m12** PWR_FAULT low during a U13 thermal fault in DFU selects bootloader SPI1 NSS. No clock
  edges arrive, so DFU still works.
- **m13** J4 card detect return path and polarity are not in the drawing; check a sample. J4 needs
  a custom footprint.
- **m14** D8 has no MPN. R39/R40 do not protect against a 5V mis-plug.
- **m15** SW4-SW6 pad mapping is unverified (PTS820 datasheet unavailable). SW3 has no MPN.
- **m16** BMI088 has no reset pin; firmware re-checks it after brown-out and runs I2C recovery.
- **m17** AN2867, RM0468 and AN4879 were not available from st.com. VBUS is read as a GPIO, so the
  OTG threshold is not needed.
- **m18** U13 soft-start into ~107µF; host-side VBUS droop against USB 2.0 §7.2.4.1 not measured.
- **m19** No test points on +5V_PB, +3V3_PB or VBUS_SW.
- **m20** SWCLK sheet pin is "input" on both sheets (cosmetic). Sheet 07 uses global labels named
  +3V3/+5V/GND next to power symbols.
- **m21** KiCad ERC reports the VCAP pin tie as power output to power output. The tie is correct;
  exclude the violation in KiCad.
- **m22** On USB alone the board draws more than the 100mA allowed before enumeration. Bench only.
