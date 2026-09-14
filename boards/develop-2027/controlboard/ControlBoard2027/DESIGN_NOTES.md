# ControlBoard2027 Design Notes - Super Clauded. !!!NOT AUTHORITATIVE!!!

Why each part and value on this board was chosen, the firmware settings the hardware
depends on, and the issues still open. Schematic notes point to sections here by number
(for example "DESIGN_NOTES §3") and to open issues by ID (for example "M7").

Datasheets are the reference for every number. Where a value comes from a calculation,
the inputs and the source table are given.

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
| RM0468 | STM32H723 reference manual (st.com did not serve it during the audit) |
| AN2606 | STM32 system bootloader, Rev 61, STM32H72x section (Tables 111/112) |
| SLVSFG1A | TI TPS2116 power mux |
| DS37274 | Diodes AP7361C LDO |
| TVS0500 | TI TVS0500 flat-clamp TVS |
| AO3401A | AOS AO3401A P-FET |
| MF-MSMF | Bourns MF-MSMF PTC, Rev BD 06/26 |
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
| +5V_PB | Powerboard, after Q1 and F2 | U1 VIN1 |
| +3V3_PB | Powerboard, after F3 | U2 VIN1 |
| VBUS | USB, after F1 | U1 VIN2, U3 |
| +3V3_LDO | U3 from VBUS | U2 VIN2 |
| +5V | U1 output (powerboard, else USB) | DotStars, U7, motor connectors, F4 (+5V_EXT) |
| +3V3 | U2 output (powerboard, else USB) | MCU, SD, IMU, OLED, pull-ups, motor 3V3, radio (J14) |

The radio board (RadioBoard2027) and the DotStars run from the mux outputs, so both also work
on USB alone. Firmware caps LED brightness on USB (§10). The radio adds up to about 0.4A of Wi-Fi
TX peaks to the USB budget (§4, m22).

Protection is kept simple: a TVS and a PTC fuse on each input. There are no eFuses, so the
board has no undervoltage lockout, no overvoltage clamp, no fast current limit, no fault
signal and no USB inrush limit. The consequences are listed in M1, M3 and m18.

---

## 3. Power input and fuses

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
TVS0500DRV on both inputs: VRWM 5V, VBR 7.5-8.4V, flat clamp 9.2V at 43A. They take surge and
ESD only. Their clamp is above the TPS2116 6V abs max, so a long overvoltage from the
powerboard reaches the muxes and the 3V3 loads; the powerboard has to regulate (M1).

Both sit at J1. D10 is directly on the connector pins. D9 sits right after Q1, not before it:
the TVS0500 is unidirectional, so on a reversed input it would conduct forward and short the
supply before Q1 could block it.

### F2 (5V) and F3 (3V3) fuses
Bourns MF-MSMF125/16X-2, 1812. Hold 1.25A and trip 2.50A at 23°C; hold 1.00A at 40°C and
0.95A at 50°C; 0.04-0.14Ω; max 0.4s to trip at 8A; 16V (MF-MSMF Rev BD tables). The same
part on both rails keeps the BOM short.

Sizing rule: the trip current must sit at or below what the protected parts and the source
can carry, or the fuse never opens. The trip current equals the TPS2116's 2.5A rating and is
below J1's 3A per contact. The powerboard must be able to source more than 2.5A per rail into
a fault, otherwise its own current limit acts first (M3). The hold current at 50°C still
covers the rail budget below.

| Rail load | +5V | +3V3 |
|---|---|---|
| DotStars (capped by firmware, §10) | 250mA | - |
| Motor modules J5-J9, logic only (motor power is separate) | not documented, measure | not documented, measure |
| +5V_EXT (J10-J12, F4) | up to F4's 0.55A hold at 50°C | - |
| Radio (TX peak 408mA) | - | 408mA peak |
| MCU, SD, IMU, OLED | - | about 0.35A (§4) |
| Fuse hold at 50°C | 0.95A | 0.95A |

The motor modules put the encoder receiver, Hall and encoder supplies and a power LED on
+5V, and the STSPIN32G0 MCU, Hall buffers and LEDs on +3V3. Their draw is not in the module
design files; measure one module before the budget is final (M3).

- A PTC is slow. It opens on a short or a heavy overload. Current between the hold and trip
  values may flow indefinitely.
- 3V3 drop: 0.14Ω × 1A = 0.14V worst case (M2).
- No UVLO: the muxes see the powerboard rail as it ramps. TPS2116 priority switching (§4)
  still decides the source.
- No fault output. PA4 is now unused.

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
- No diodes on the mux outputs. The TPS2116 blocks reverse current: an input is disconnected
  once VOUT exceeds it by 42mV (SLVSFG1A §7.3.4), so the powerboard rail cannot back-feed USB
  and USB cannot back-feed the powerboard. A diode would also cost 0.3-0.5V on the 3V3 rail.

### USB VBUS input
VBUS from J2 goes through F1 straight to U1 VIN2 and U3. There is no eFuse or load switch.

- F1 Bourns MF-MSMF075/16X-2 (sheet 03), see §7.
- D12 TVS0500DRV sits on VBUS at J2, before F1.
- C55 2.2uF X7R ≥10V at the input. The USB Device Capacitance ECN requires 1-10µF on VBUS;
  2.2µF stays above 1µF after DC bias.
- No inrush limit. Everything on +5V and, through U3, on +3V3 charges straight from the host
  at attach: well over the 10µF that USB 2.0 §7.2.4.1 allows (m18).
- With the cable out, R61/R62 (115k, §5) pull VBUS to 0V, so U1 VIN2 does not float.

### U3 AP7361C-33E LDO
1A, 360mV dropout at 1A, stable with ≥2.2µF MLCC (DS37274). SOT-223: 1 IN, 2 GND, 3 OUT.
On USB alone it carries the MCU, SD, IMU and OLED, about 0.35A: (5.0 - 3.3) × 0.35 = 0.6W.
The radio adds Wi-Fi TX peaks of 313mA at 2.4GHz and 403mA at 5GHz (ESP32-C5-WROOM-1U datasheet
v1.3, Tables 6-4/6-5), so the LDO sees up to about 0.75A peak and 1.3W. Its average is far lower,
but check the SOT-223 copper area on the layout.
C5/C6 10uF in and out.

### Rail LEDs and test points
D1/D2 Kingbright APT1608EC red: VF 2.0V typ, 30mA max. R5 3.3k → 0.9mA on 5V, R6 1.5k → 0.87mA
on 3V3. Around 1mA is plenty for an indicator; the earlier 3mA was too bright. TP7 (+5V_PROT)
and TP8 (+3V3_RAW) with TP1/TP2 measure the fuse plus mux drop. TP9/TP10 give logic-analyser
access to the powerboard UART.

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
  The pin's 4.0V abs max (with VDD off) is only reached at 6.77V VBUS. The divider sits on
  VBUS after F1; F1 drops under 0.1V at normal load, well inside the threshold margin.
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
- J2 shield (SH) is left floating by choice. A6/B6 and A7/B7 still join at the connector.
- D12 TVS0500DRV on VBUS right at J2, before F1, with a short via to GND.
- F1 Bourns MF-MSMF075/16X-2 (1812): hold 0.75A / trip 1.50A at 23°C, 0.60A hold at 40°C and
  0.55A at 50°C, 0.11-0.45Ω, max 0.2s to trip at 8A, 16V. The plain MF-MSMF075 used before is
  marked not recommended for new designs in the Rev BD datasheet; the /16X version is current.
  The hold current matches the 0.5A a USB 2.0 port supplies. The USB-only load is about 0.35A
  plus the LEDs capped at 100mA (§10) plus the radio's Wi-Fi TX bursts (m22). A 1.5A trip opens on a board or cable short from any
  port that can source it; a port with a lower limit shuts itself off first. Running motor
  modules from USB can exceed the hold current and trip F1, which is intended: use the
  powerboard for that.
- J3 SWD: 1 VTref, 2 SWCLK, 3 SWDIO, 4 GND, 5 NRST. Pins 1-4 match the motor-module cable.
  VTref ties straight to +3V3. Probes only sense VTref, so the series diode was removed. J3
  must be keyed: reversed, VTref and GND land on NRST.
- R39/R40 22Ω on SWCLK/SWDIO damp cable ringing. They do not protect against a mis-plugged
  5V probe. 0Ω also works.
- SW1 reset. SW2 BOOT0 to 3V3. The ROM DFU uses HSI48 with CRS, so it needs neither the
  crystal nor VBUS sensing.

---

## 8. SD card

- J4 XKTF-015-N microSD socket. SH floats and the card-detect terminal is left unconnected.
  The drawing does not give the detect return path, and that path likely runs through the
  shell, so floating the shell rules detect out. Firmware finds a card by initialising it.
  J4 needs a custom footprint.
- R10-R14 47k pull-ups on DAT0-3 and CMD, inside the SD range of 10-100k. Idle high is at
  least 2.79V against the card's 2.06V and the MCU's 2.31V input thresholds. CLK has none.
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
Active low. R24-R26 10k pull-ups, R27-R29 10k series, C37-C39 100nF at the MCU pin, no
inductor.

| | Path | Nominal | 1% R, 10% C | 5% R, 20% C |
|---|---|---|---|---|
| Press | C discharges through R27: τ = R27 × C37 | 1.0ms | 0.89-1.11ms | 0.76-1.26ms |
| Release | C charges through R24 + R27: τ = 20k × C37 | 2.0ms | 1.78-2.22ms | 1.5-2.5ms |

The pin settles in about 5τ. The RC removes sub-millisecond bounce; firmware ignores
re-triggers for about 10ms. Peak switch current is 0.76mA and the pin stays inside the rails.
The same numbers are on the buttons sheet. The PTS820 datasheet could not be retrieved, so the
4-pad to 2-pin mapping is unverified (m15).

---

## 10. DotStar LEDs

- Power comes from +5V, the U1 mux output, so the LEDs work on USB as well as the powerboard.
  The chain can draw 500mA at full white. Firmware caps the total LED current to about 250mA
  on the powerboard, keeping +5V inside F2's hold current (§3), and to about 100mA on USB
  (PWR_SRC_5V low), keeping the board inside F1's hold current (§7). On USB, +5V can sit below the LEDs' 4.5V minimum (VBUS may be 4.40V
  at the device, before F1 and U1), so colours and data are only guaranteed on the powerboard.
- U7 shares +5V with the LEDs, so it is powered whenever the MCU is. Its inputs are rated
  -0.5 to 7V regardless of VCC (SCLS264R).
- D3-D7 BB-2020BGR-TRB (APA102-2020 compatible): VDD 4.5-5.5V, input high 0.7 × VDD = 3.5V,
  clock 15MHz abs and under 10MHz operating (p6), 70°C max ambient (p3). The power-on state is
  not specified, so firmware sends an all-off frame first.
- The stock KiCad APA102-2020 footprint does not fit; build one from the BB-2020BGR-TRB land
  pattern (C1).
- U7 SN74AHCT125 shifts 3.3V to 5V. It must be AHCT (TTL input high 2.0V); AHC needs 3.5V.
  Gates 1/2: pin 2→3 CKI, 5→6 SDI, OE pins 1/4 to GND. Gates 3/4: inputs 9/12 to GND, OE 10/13
  to +5V (disabled), outputs open. Propagation delay is 6.5ns max at 15pF, 2% of a 333ns
  bit at 3Mbit/s.
- R66/R67 100k pull-downs on LED_SPI_SCK/MOSI hold the inputs at 0.13V (vs 0.8V input-low
  limit) while the MCU pins are Hi-Z at reset. AHCT has no bus hold.
- C45 100nF at U7, C40-C44 100nF one beside each LED, C51 22uF X5R/X7R ≥10V where +5V
  enters. Each LED can draw 0.5W (BB2020 p3), so 500mA for the chain.
- TP18/TP19 on D7 SDO/CKO: valid data at the end of the chain proves all five LEDs pass it.

---

## 11. Connectors

### Motor connectors J5-J9 (interface still open)
JST S8B-PH-K-S, 2A per contact with AWG24. Order matches motor-module J2: 1 +5V, 2 GND, 3 +3V3,
4 GND, 5 SCK, 6 MOSI, 7 MISO, 8 CS. J9 is the dribbler. R68-R72 10k CS pull-ups hold the modules
deselected through reset. R74 100k pull-down on SCK. U10/U11 TPD4E05U06 ESD at the connectors.

### I2C connectors J10-J12 and F4
- J10 kicker I2C, J11/J12 expansion I2C: +5V_EXT, GND, SCL, SDA. U12 TPD4E05U06 protects SCL/SDA
  and must sit at the connectors, so J10-J12 stay together (m8).
- F4 Bourns MF-MSMF075/16X-2 (same part as F1) feeds +5V_EXT from +5V: hold 0.75A (0.55A at
  50°C), trip 1.50A. Its trip current is well below F2's 2.50A, so an overload between 1.5A
  and 2.5A opens F4 and never F2. On a hard short F4 also trips faster (0.2s against 0.4s max
  at 8A). +5V still dips while F4 heats, so a hard short can reset the board once before F4
  opens. Expansion loads must stay under 0.55A total.

### J13 OLED (Adafruit 326)
1 SDA, 2 SCL, 3 DC/SA0 to GND, 4 RST NC, 5 CS to GND, 6 3V3 out NC, 7 Vin +3V3, 8 GND. The
STEMMA QT and v2.1 boards use the same pin numbers, but the header is rotated 180° and the
holes differ. The schematic assumes STEMMA QT, which has its own reset chip (M5). Address 0x3C;
SA0 goes through a diode on the module, so firmware also probes 0x3D. H1-H4 are the M2 mounting
holes.

### J14 radio link
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
- R73 10k ESP_SPI_CS pull-up to +3V3 keeps the radio deselected while PG15 floats at reset.
- R75/R76 100k pull-downs on HANDSHAKE/DATA_READY stop false interrupts with the radio absent or
  in reset. On the C5 these are GPIO3 (MTDI) and GPIO4 (MTCK). GPIO3 is a strapping pin, but it only
  sets the SDIO clock edge; boot mode is set by GPIO26-28 (ESP32-C5 datasheet v1.5 §3).
- ESP_RST (PB7) drives the radio EN open-drain. The radio board holds EN up with 10k/1µF and
  has 470Ω in series.
- C47 22uF + C48 100nF local decoupling on +3V3 at J14.

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
  checking the clock at TP11. No card-detect pin: make the FATFS/BSP detect function report a
  card as present and treat an init failure as "no card". Recover a hung card with CMD0 (M18).
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
| PA9 | VBUS_SENSE | GPIO input | R61/R62 divider on cable VBUS |
| PA15 | (unused) | Reset / analog | R81 holds bootloader SPI3 NSS high |
| PC5, PB0, PB1, PB2 | MOTOR0-3_SPI_CS | Output PP, init high | R68-R71 hold CS high through reset |
| PF11 | DRIBBLER_SPI_CS | Output PP, init high | R72 |
| PG15 | ESP_SPI_CS | Output PP, init high | R73 pull-up to +3V3 |
| PB7 | ESP_RST | Open drain, init released | ESP EN pull-up is on the radio board; never drive high |
| PB5 | ESP_HANDSHAKE | EXTI rising | R75 pull-down |
| PB6 | ESP_DATA_READY | EXTI rising | R76 pull-down |
| PF3 | ACCEL_EXTI | EXTI rising | R64 pull-down; set INT1 push-pull active high (BMI088 5.3.16) |
| PF2 | GYRO_EXTI | EXTI rising | R65 pull-down; set INT3 push-pull active high (BMI088 5.5.10) |
| PE4, PC13, PC14 | USER_EXTI0-2 | EXTI falling | Buttons pull low; ~1ms RC debounce. V0.3 uses rising |
| PF7-PF10, PC0, PC1 | DIP0-5 | Input | R18-R23 pull-ups; closed = 0 |
| PA4, PG7 | (unused) | Analog | Were PWR_FAULT and SD_DETECT; both removed |

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

**C3 Footprints, MPNs and ratings.** 17 of 188 parts have a footprint and the PCB file is empty.
Capacitors need voltage and dielectric ratings (C51, C47, C55 X5R/X7R ≥10V). U7 must be ordered
as SN74AHCT125PWR or DR; the D (tube) option is obsolete.

### Major

**M1 No overvoltage protection on the powerboard inputs.** With the eFuses gone, nothing between
J1 and the loads limits voltage except the TVS diodes, which only start at 7.5V.
- +5V (pin 2) sits next to +3V3 (pin 3). A crimp fault puts 5V through F3 and U2 onto +3V3 and
  destroys the MCU (4.0V abs max), SD card, IMU and radio. A GND pin between the rails fixes
  it; needs agreement with the powerboard. This is now a release blocker for J1.
- A powerboard fault above 6V damages U1/U2 (TPS2116 abs max) and everything after them.
- The 3V3 input has no reverse protection: a mirrored cable puts -3.3V on the 3V3 loads.
The powerboard has to regulate and J1 has to be keyed and pinned so these cannot happen.

**M2 3V3 margin.** At 1A, F3 (140mΩ max) + U2 (59mΩ) + J1 (20mΩ) drop 0.22V, so a 3.30V
powerboard gives about 3.08V on +3V3. The radio module (3.0V minimum) sits behind a further cable
and mux drop (m3). 3.4V ±3% is still the preferred setpoint; with no clamp,
the powerboard must never exceed 3.6V (STM32 VDD max).

**M3 Rail budget.** F2 and F3 hold 0.95A at 50°C and trip at 2.5A (§3). On 5V, the DotStars
(capped at 250mA) plus +5V_EXT (up to 0.55A) plus the motor-module logic must stay under 0.95A.
The module logic draw is undocumented; measure one module. If the budget does not fit, lower
the LED cap or +5V_EXT allowance before choosing a larger fuse, because a larger fuse would no
longer trip below the TPS2116 rating. The powerboard must source more than 2.5A per rail into
a fault, or F2/F3 never trip and the powerboard's own limit is the protection.

**M4 SPI3 configuration.** V0.3 has hardware CRC on and 4-bit frames. Set CRC off and 8-bit.

**M5 OLED variant.** The schematic assumes the STEMMA QT board (reset chip, J13.4 NC). The v2.1 board
has no reset chip, and the SSD1306 needs RES# held low ≥3µs after power-up. SA0 reaches the chip
through a diode (about 0.5-0.6V against 0.66V max low), so probe both addresses. Order STEMMA QT
and take J13 and H1-H4 from its board file.

**M6 Connector parts.** J10-J12 are generic, unkeyed and have no MPN. J1 JST-XH is friction lock
and rated 3A only with AWG22. J3 needs a keyed header. J14 is now a latching JST GH (§11); a
premade 15-pin GH cable could not be confirmed at a distributor, so plan on crimping or a
custom harness.

**M7 Mux switchover sag (bench only).** With USB attached, removing the powerboard lets +3V3 sag to
2.13-2.55V and +5V to 3.42-4.20V before the mux switches, because VIN1 stays tied to VOUT until
PR1 falls. On the robot there is no USB, so this never happens. Handled with a BOR level and
firmware re-initialisation. The radio and DotStars both see the sag; firmware resets the radio
and resends the LED frame after any PWR_SRC change.

**M9 Shared motor MISO.** All five modules share MISO. It works only if each module releases MISO
while deselected. Add a 100k pull-down if they do not.

**M10 No mating kicker design.** The only kicker in the repo (v3.4) uses SPI with RESET over 8
pins, not I2C. Freeze J10 before layout. The radio side is now RadioBoard2027 (same J14/J2
pinout); keep both projects in step if either connector changes.

**M11 SPI2 pin.** V0.3 puts SPI2_SCK on PA9; the board uses PB13. Re-pin in the .ioc.

**M16 Voltage scaling.** 240MHz SYSCLK exceeds the 200MHz AHB limit at VOS1. Use HPRE /2 at VOS1,
or VOS0 with its 105°C junction limit.

**M17 SPI clock float.** With Keep IO State disabled, PB3 floats between transfers and can add a
clock edge. Enable Keep IO State on SPI1-3.

**M18 SD card power.** Card VDD is hard-wired to +3V3. A hung card is recovered with CMD0; a card
that ignores CMD0 needs a board power cycle. Accepted to keep the circuit simple (logging only).

### Minor

- **m1** RadioBoard2027 firmware must set the ESP-Hosted pins explicitly: its C5 defaults are CLK
  GPIO3 and HANDSHAKE GPIO1, but the board uses CLK GPIO6 and HANDSHAKE GPIO3. GPIO4 (DATA_READY)
  has a weak internal pull-up at reset; R76 100k against about 45k gives 2.28V, below the 2.475V
  input-high threshold, so no false interrupt until the firmware takes the pin. ESP_RST has no
  pull on this board (the radio board has it).
- **m2** DotStar and U7 VDD is 4.5-5.5V. On the powerboard, Q1 (60mΩ) + F2 (140mΩ max) + U1
  (59mΩ) drop about 0.25V at 1A, so a 5.0V powerboard gives about 4.75V. On USB, +5V can fall below
  4.5V. LEDs are rated to 70°C ambient; cap brightness in firmware.
- **m3** The radio sees +3V3 minus the J14 cable and its own mux: roughly 0.05V more at a 403mA
  TX peak (two GH contacts in parallel, a short 26 AWG pair, TPS2116 on-resistance). Added to
  M2's worst case this leaves about 3.03V at the module from a 3.30V powerboard, just above the
  module's 3.0V minimum. Measure on the first boards.
- **m4** Motor SPI termination and speed (motorboard scope): R41/R42, 6 vs 15.625Mbit/s.
- **m5** J10-J12 pin order is not Qwiic. 3.3V pull-ups do not suit 5V-logic slaves, and a far-side
  5V pull-up is only safe while the MCU is powered (DS13313 Table 9).
- **m6** Cabled I2C: 2.2k allows 153pF. Measure at TP16/TP17.
- **m8** U12 serves J10 and J11/J12 and must sit at the connectors, so keep them together.
- **m9** Crystal drive level may reach 103µW at 1.4Vpp (max 100µW). Measure and fit R86 if
  needed. ABM8 is rated -20 to 70°C.
- **m11** PA2/PA3 share EXTI lines with PF2 and PF3; poll them.
- **m12** PA4 (bootloader SPI1 NSS) is unconnected and floats in DFU. Nothing drives the motor
  SCK (R74 pull-down), so no SPI frame arrives and DFU still answers on USB.
- **m14** R39/R40 do not protect against a 5V mis-plug on J3.
- **m15** SW4-SW6 pad mapping is unverified (PTS820 datasheet unavailable). SW3 has no MPN.
- **m16** BMI088 has no reset pin; firmware re-checks it after brown-out and runs I2C recovery.
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
- **m22** On USB alone the board draws more than the 100mA allowed before enumeration, and with
  the radio transmitting it can exceed a USB 2.0 port's 500mA in bursts. Bench only; disable
  Wi-Fi or use the powerboard if a port drops out.
- **m23** J2 and J4 shells float. ESD that hits a shell has no direct path to GND and couples
  into nearby traces. Keep signal copper away from the shell pads; U5, U14 and D12 still clamp
  the pins.
- **m24** No fault reporting: a tripped F2/F3/F4 is only visible as a missing rail (PWR_SRC low
  or dead +5V_EXT loads).
