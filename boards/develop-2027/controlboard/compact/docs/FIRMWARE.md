# Compact set: firmware pin map and bring-up notes

For firmware engineers working on ControlBoard2027_C (STM32H723ZGT6) and the 30 x 40 mm radio (ESP32-C5-WROOM-1U,
both variants). Pins were read from the schematic netlists on 2026-11-07. Where this file and the CubeMX V0.3
project disagree, this file is correct; where this file and the schematic disagree, the schematic wins.

The board-to-board link is specified in [INTERFACE.md](INTERFACE.md). Positions are in mm from each board's
outline top-left corner, x right, y down (robot front at the top of the CB).

## 1. STM32H723ZGT6 (controlboard)

### 1.1 Clock tree

| Setting | Value | Reason |
|---|---|---|
| HSE_VALUE | 25000000 | X1 is a 25 MHz crystal (V0.3 says 48 MHz: wrong) |
| PLL1 | DIVM /5, DIVN x96, DIVP /2, DIVQ /10 | 5 MHz input, 480 MHz VCO, SYSCLK 240 MHz, PLL1Q 48.000 MHz |
| PLL1Q users | USB, SDMMC (SDMMCSEL), SPI1-3 (SPI123SEL) | 48 MHz exactly from integer dividers |
| Voltage scaling | VOS1 with HPRE /2, or VOS0 | AHB max 200 MHz at VOS1; VOS0 limits TJ to 105 °C |
| Supply | PWR_LDO_SUPPLY | the H723 has no SMPS |
| BOR | set a level in the option bytes | rail sags reset the MCU instead of browning out peripherals |
| CRS | off | USB runs from PLL1Q |
| LSE / RTC | off | no 32.768 kHz crystal; PC14 is USER_EXTI2, keep RTC tamper / wake-up off on PC13 |

The ROM bootloader uses its own clocking, so DFU does not depend on these settings.

### 1.2 Peripherals

| Peripheral | Pins (LQFP pin) | AF | Connects to | Settings |
|---|---|---|---|---|
| SPI1, left wheels | PA5 SCK (41), PA6 MISO (42), PA7 MOSI (43) | AF5 | R15 / R16 30R -> J4 MOTOR 0 (FL), J5 MOTOR 1 (BL) | 48 MHz / 8 = 6 Mbit/s, 8-bit; OSPEEDR LOW or MEDIUM (§1.4) |
| SPI2, right wheels | PB13 SCK (74), PB14 MISO (75), PB15 MOSI (76) | AF5 | R67 / R68 30R -> J6 MOTOR 2 (BR), J7 MOTOR 3 (FR) | as SPI1; OSPEEDR LOW or MEDIUM |
| SPI4, dribbler | PE2 SCK (1), PE5 MISO (4), PE6 MOSI (5) | AF5 | R70 / R71 30R -> J8 | point to point; SPI45SEL cannot use PLL1Q: HSE 25 MHz / 4 = 6.25 Mbit/s, or PLL2Q / PLL3Q |
| SPI3, radio | PB3 SCK (133), PB4 MISO (134), PB5 MOSI (135) | AF6, AF6, **AF7** | R65 / R66 30R -> J9 | mode 3, 8-bit, hardware CRC off; 3 MHz bring-up, 24 MHz (PLL1Q / 2) normal, 40 MHz only after a scope check (§1.5). **No pull on PB4 (MISO)**: the ESP32-C5 slave tri-states MISO while CS is high and the radio holds it with its pull-down; a host pull-up would fight it to mid-rail |
| SPI6, DotStars | PG13 SCK (128), PG14 MOSI (129) | AF5 | U10 level shifter, R48 / R47 100k pull-downs | TX only, mode 0, SPI6SEL = HSE 25 MHz / 8 = 3.125 Mbit/s. D3 domain: BDMA, buffers in SRAM4 |
| SDMMC2, microSD | PD6 CK (122), PD7 CMD (123), PG9-PG12 D0-D3 (124-127) | AF11 (CK, CMD, D0, D1), **AF10** (D2, D3) | R6 30R on CK, U1 ESD, R1-R5 47k pull-ups, J1 | 4-bit; kernel PLL1Q 48 MHz; CLKDIV 3 (8 MHz) bring-up, CLKDIV 1 (24 MHz) after checking CK at TP1 |
| USB FS (OTG_HS in FS mode) | PA11 DM (103), PA12 DP (104) | AF10 | U3 ESD, J2 | device; VBUS sense on PA9 as a GPIO |
| I2C1, OLED | PB8 SCL (139), PB9 SDA (140) | AF4 | R14 / R17 2.2k, J13 | 400 kHz; SSD1306 at 0x3C (probe 0x3D too) |
| I2C2, kicker | PB10 SCL (69), PB11 SDA (70) | AF4 | R18 / R19 2.2k, U17, J10 | 400 kHz |
| I2C4, expansion | PF14 SCL (54), PF15 SDA (55) | AF4 | R10 / R8 2.2k, U6 / U16, J11 / J12 | 400 kHz |
| I2C5, IMU | PF1 SCL (11), PF0 SDA (10) | AF6 | R7 / R9 2.2k, U11 | 400 kHz; LSM6DSV320X at 0x6A |
| UART4, powerboard | PA0 TX (34), PA1 RX (35) | AF8 | R34 / R33 1k, J15 pin 2 (TX) / pin 1 (RX) | 115200 8N1 |
| SWD | PA13 SWDIO (105), PA14 SWCLK (109), NRST (25) | AF0 | J3 STDC14 | start at 1 MHz; no SWO (PB3 is the radio SCK) |

All I2C: let CubeMX recompute the Timing value for the new clock tree (never copy V0.3's value), internal pull-ups
off, bus recovery (up to 9 SCL pulses, then STOP) before each init. All SPI masters: Master Keep IO State = Enable,
so SCK does not float between transfers.

### 1.3 GPIO

| Pin (LQFP pin) | Net | Mode | Notes |
|---|---|---|---|
| PC5 (45) | MOTOR0_SPI_CS (J4) | output PP, init high, LOW / MEDIUM speed | R24 10k pull-up |
| PB0 (46) | MOTOR1_SPI_CS (J5) | output PP, init high, LOW / MEDIUM | R25 |
| PB12 (73) | MOTOR2_SPI_CS (J6) | output PP, init high, LOW / MEDIUM | R26 |
| PD8 (77) | MOTOR3_SPI_CS (J7) | output PP, init high, LOW / MEDIUM | R27 |
| PE3 (2) | DRIBBLER_SPI_CS (J8) | output PP, init high | R28 |
| PG15 (132) | ESP_SPI_CS | output PP, init high, LOW / MEDIUM | R29 10k pull-up |
| PE1 (142) | ESP_RST | open drain, init released | never drive high; the radio pulls EN up |
| **PB6 (136)** | **ESP_DATA_READY** | EXTI6, rising | R32 10k pull-down |
| **PB7 (137)** | **ESP_HANDSHAKE** | EXTI7, rising | R31 100k pull-down |
| PF3 (13) | ACCEL_EXTI | EXTI3, rising | IMU INT1, push-pull |
| PF2 (12) | GYRO_EXTI | EXTI2, rising | IMU INT2, push-pull |
| PE4 (3), PC13 (7), PC14 (8) | USER_EXTI0-2 (SW4-SW6, BTN0-2) | EXTI, falling | active low, RC debounce about 1 ms press / 2 ms release; ignore re-triggers for 10 ms |
| PF7-PF10 (19-22), PC0 (26), PC1 (27) | DIP0-DIP5 (SW3, ROBOT ID bits 1-6) | input | R53-R58 100k pull-ups; a switch that is on reads 0; read at boot |
| PA2 (36) | PWR_SRC_5V | input, polled | U8 ST via R44 10k; high = powerboard 5 V selected |
| PA3 (37) | PWR_SRC_3V3 | input, polled | U9 ST; high = powerboard 3.3 V selected |
| PA9 (101) | VBUS_SENSE | input | R20 / R21 divider (0.591) on cable VBUS; HAL_PCD_DevConnect / DevDisconnect on its edges |
| PA15 (110) | (R13 only) | analog | R13 holds the bootloader SPI3 NSS high |
| BOOT0 (138) | BOOT0 | | R11 10k pull-down; SW2 (BOOT) pulls it to 3.3 V |
| all others | unconnected | analog | "Set all free pins as analog" |

**PB6 / PB7.** On the compact board PB6 is DATA_READY and PB7 is HANDSHAKE, the opposite of the prototype. Swap the
pin defines and the EXTI lines when porting prototype firmware.

### 1.4 GPIO speed (OSPEEDR) requirements

- **Motor buses SPI1 / SPI2: LOW or MEDIUM only, never HIGH / VERY_HIGH.** Each bus is a star: one MCU-side via
  feeds two connector arms of unequal length (J4 86.9 mm / J5 65.1 mm on SPI1, J6 62.9 mm / J7 57.0 mm on SPI2),
  with no termination at the arm ends. With edges slower than about 3 ns the arms act as lumped loads; with sub-ns
  edges each arm rings. Applies to PA5, PA7, PB13, PB15 and the CS pins PC5, PB0, PB12, PD8.
- Dribbler SPI4 is point to point; MEDIUM is enough at 6 Mbit/s.
- Radio SPI3: SCK / MOSI MEDIUM up to 24 MHz, HIGH only at 40 MHz. CS (PG15) LOW or MEDIUM.
- SDMMC2: start at MEDIUM; raise only if the 24 MHz eye at TP1 needs it.

### 1.5 Radio link (host side)

- ESP-Hosted SPI full-duplex host on SPI3, mode 3, software CS on PG15.
- HANDSHAKE (PB7) and DATA_READY (PB6) are EXTI inputs without internal pulls (R31 / R32 are on the board), active
  high, idle low; mask them while the radio initialises.
- MISO (PB4): no internal pull. MISO has exactly one pull, the radio-side pull-down that ESP-Hosted enables on GPIO2;
  the slave tri-states MISO while CS is high.
- Reset: pull PE1 low for 10 ms, release, then wait 500 ms before trusting HANDSHAKE / DATA_READY.
- Clock: SPI123SEL = PLL1Q 48 MHz gives 24 MHz at /2. 40 MHz (the ESP32-C5 slave maximum) needs an 80 MHz SPI123
  kernel clock (PLL2P or PLL3P) and a scope measurement of the MISO valid delay at J9 first.
- Keep the ESP-Hosted frame checksum on.

### 1.6 IMU (U11, LSM6DSV320X)

- I2C5 at address 0x6A (SDO/TA0 to GND; CS tied high selects I2C). Use the LSM6DSV320X driver and check WHO_AM_I
  (the design started with the LSM6DSK320X; the fitted part is the DSV).
- INT1 -> PF3 (ACCEL_EXTI), INT2 -> PF2 (GYRO_EXTI), both push-pull. Route any event to either pin with
  INT1_CTRL / INT2_CTRL. The part has no reset pin: after a PWR_SRC change or an I2C error, re-read the configuration
  registers and re-initialise if they changed.
- **Orientation.** U11 is on the bottom side, inside the MCU pad ring, at (48.6, 20.6), KiCad rotation 270 (-90).
  Seen from above through the board, pin 1 is at the north-west corner of the package (47.85, 19.44).
  - Z: the package top faces down, so the sensor +Z axis points out of the board's bottom face: z_robot = -z_sensor
    (with the board mounted top side up).
  - X / Y: derive from the datasheet pin-1 / axis drawing, mirrored for the bottom side and rotated 270 degrees.
    This is still open. Confirm on the bench: with the board flat and its top side up, the sensor Z axis must read
    about -1 g (it reads +1 g along the board's up axis only after the remap). Then tilt the robot front down, and
    then its right side down, and record which sensor axis responds and with which sign. Put the resulting remap in firmware and in the CB TODO.
- The prototype had the IMU on the top side at 180 degrees: its remap does not apply.

### 1.7 Power-source handling

- Rails: +5V and +3V3 are TPS2116 mux outputs (U8, U9). The powerboard (J15) has priority; USB is the bench fallback.
- U8 (5 V) switches to USB at about 3.55 V falling and back at about 3.88 V rising; U9 (3.3 V) at about 2.34 V
  falling and 2.57 V rising (PR1 dividers with 1M hysteresis, VREF typical).
- With USB attached, unplugging the powerboard lets +3V3 sag to 2.13-2.55 V and +5V to about 3.2-3.9 V before the
  mux switches. Set a BOR level, and on any PWR_SRC_5V / PWR_SRC_3V3 change: re-initialise SD, IMU and OLED, pulse
  ESP_RST and restart ESP-Hosted, resend the LED frame. On the robot there is no USB, so this is a bench case.
- Drive the UART4 TX only once PWR_SRC shows the powerboard.
- LEDs: cap the DotStar chain at about 250 mA on the powerboard and about 100 mA while PWR_SRC_5V is low (USB). Send
  an all-off frame at start-up (power-on state is not specified).
- USB power alone is for restricted bench use (radio TX off, external loads off): F1 holds 0.55 A at 50 °C.

### 1.8 Other

- SD: no card-detect pin. Report "present", treat an init failure as "no card", recover a hung card with CMD0; card
  VDD is not switchable.
- OLED: the 128 x 64 image is rotated 90 degrees by the mounting; set the u8g2 rotation (U8G2_R1 or U8G2_R3) to
  match. Check rise times before running 400 kHz.
- DFU: hold BOOT (SW2) and press RESET (SW1). The ROM DFU uses HSI48 with CRS, so it needs neither the crystal nor
  VBUS sensing. Bootloaders before V9.3 lock PWR_CR3 until power-off: power-cycle after DFU.
- Motor modules must release MISO while their CS is high (shared MISO on each bus).

## 2. ESP32-C5 (radio, both variants)

The Inboard and Overhang schematics are identical, so everything below applies to both.

### 2.1 Pin map

| Signal | GPIO | Module pad | Notes |
|---|---|---|---|
| SPI CLK | 6 | 8 | IO_MUX FSPICLK |
| SPI MOSI | 7 | 9 | IO_MUX FSPID; strapping pin (JTAG source), ignored with default eFuses |
| SPI MISO | 2 | 4 | IO_MUX FSPIQ; strapping pin (MTMS), not a boot-mode pin; R4 33R at the pad |
| SPI CS | 10 | 12 | IO_MUX FSPICS0 |
| HANDSHAKE | 1 | 7 | also XTAL_32K_N |
| DATA_READY | 0 | 6 | also XTAL_32K_P |
| Status LED (STAT, green D1) | 8 | 10 | active high, R8 1.5k |
| PWR_SRC_HOST | 9 | 11 | U3 ST; high = powered by the controlboard |
| USB D- / D+ | 13 / 14 | 13 / 14 | USB Serial/JTAG, Full Speed, R5 / R6 22R |
| UART0 TX / RX | 11 / 12 | 25 / 24 | TP1 (via R7 499R) / TP2, GND on TP3; bottom side, reachable only with the radio unmounted |
| BOOT | 28 | 15 | R3 10k pull-up, SW2 to GND |
| Reset | EN | 3 | R1 10k / C3 1 uF, R2 470R from the CB ESP_RST, SW1 to GND |
| PSRAM CS (do not use) | 15 | 19 | N8R8 module internal, left unconnected |
| Unused | 3, 4, 5, 23, 24, 25, 26, 27 | | not connected |

### 2.2 ESP-Hosted (co-processor) configuration

- Transport: SPI full duplex, SPI2 (FSPI) on the IO_MUX pins, mode 3.
- Set every pin explicitly in menuconfig: CLK = GPIO6, MOSI = GPIO7, MISO = GPIO2, CS = GPIO10,
  **HANDSHAKE = GPIO1, DATA_READY = GPIO0**, reset = EN. Do not rely on the C5 Kconfig defaults (the default CLK is
  GPIO3, which is not connected).
- Clock: up to 40 MHz (ESP32-C5 SPI slave maximum); bring the link up at 3-10 MHz with the checksum on.
- Keep the RTC slow clock on an internal source. Selecting an external 32 kHz crystal takes GPIO0 / GPIO1 away
  from DATA_READY / HANDSHAKE.
- While PWR_SRC_HOST (GPIO9) is low the radio runs from USB and the controlboard may be unpowered: keep MISO,
  HANDSHAKE and DATA_READY as inputs without pulls, and enable the link outputs only when GPIO9 is high.

### 2.3 Strapping, boot and USB

- Boot mode is set by GPIO26-28 only. GPIO28 = 1 at reset (R3 pull-up) boots from flash; holding BOOT (GPIO28 low,
  GPIO27 high by its internal pull-up) while pressing or releasing RESET enters ROM download mode, over USB or UART0.
- C4 (15 pF on GPIO28) is not fitted: fitting it can force download mode.
- USB-C J1 carries the native USB Serial/JTAG: flashing, console, JTAG. Full Speed only, no USB OTG. If the
  application disables the USB PHY or reuses GPIO13 / 14, auto-download stops working; use BOOT + RESET.
- RF test firmware supports UART only: use UART0 on TP1 / TP2.

### 2.4 Power, switchover and brownout

- The radio runs from the controlboard +3V3 (+3V3_HOST, through J2) when present, else from USB-C through its
  AP7361C LDO. U3 (TPS2116, priority mode) selects; U7 (TPS3840PL29 supervisor) drives its PR1 input.
- Thresholds (TPS3840PL29, -40 to 125 °C): the host is selected above 2.932-3.069 V rising (3.00 V typical) and
  dropped below 2.857-2.944 V falling (2.90 V typical), within 15-30 us. Below the falling threshold U3 switches to
  USB, or turns off if USB is absent.
- The module needs at least 3.0 V. Between the falling threshold and 3.0 V it stays on a sagging host rail even with
  USB plugged in. **Keep the ESP32-C5 brownout detector enabled** (CONFIG_ESP_BROWNOUT_DET) at the highest level
  that the nominal 3.3 V rail does not trip, and do not expect USB to rescue a low controlboard rail.
- Peak current 313 mA (2.4 GHz TX) / 403 mA (5 GHz TX).
- With USB only and the controlboard attached but unpowered, the module still comes out of reset (EN about 3.2 V,
  PE1 is a 5 V-tolerant pin that does not clamp).

### 2.5 Antenna

- Primary build: WROOM-1U-N8R8 with an external antenna on the module's u.FL (Taoglas FXP831.07.0100C, ANT1).
- Fallback: WROOM-1-N8R8 (PCB antenna) on the same footprint. It needs a stencil without paste on U1 pads 30-32.
  Inboard: the antenna lies over the controlboard; Overhang: it sticks out past the controlboard front edge.

## 3. Bench bring-up checklist

Controlboard:
1. Power from the powerboard only, then USB only: check +5V / +3V3 at TP16 / TP17, the PWR_SRC pins, and the U7 LDO
   (TP15). Check the USB attach inrush on the team's laptops.
2. HSE: start-up and drive level at R12 (fit a few hundred ohms if the drive exceeds 100 uW).
3. SWD at 1 MHz on J3, then DFU over USB.
4. Motor buses: SCK at J4 and J7 on a scope at the chosen GPIO speed (no ringing at the arm ends).
5. SD: CK at TP1 at 8 MHz, then 24 MHz.
6. I2C: SCL rise time at TP7 (kicker) and TP8 (expansion) with real cables; under 300 ns for 400 kHz.
7. OLED at 0x3C / 0x3D; IMU WHO_AM_I and the axis remap (§1.6).
8. Unplug the powerboard with USB attached and check that firmware recovers (§1.7).
9. LED chain: all-off frame, then data at TP20 / TP21 (end of chain).

Radio (fitted on the CB):
1. Radio supply at the module during 5 GHz TX.
2. EN with the CB attached but unpowered and the radio on USB (expect about 3.2 V).
3. Link at 3 MHz, then 24 MHz; scope MISO valid delay at J9 before trying 40 MHz.
4. PWR_SRC_HOST (GPIO9) follows the CB rail; switchover at the U7 thresholds.
5. Range test of the WROOM-1U with the external antenna (5 GHz gain), and of a WROOM-1 build if one is made.

Related documents: [../README.md](../README.md), [INTERFACE.md](INTERFACE.md),
[ControlBoard2027_C DESIGN_NOTES](../ControlBoard2027_C/DESIGN_NOTES.md),
[Inboard DESIGN_NOTES](../RadioBoard2027_C_Inboard/DESIGN_NOTES.md),
[Overhang DESIGN_NOTES](../RadioBoard2027_C_Overhang/DESIGN_NOTES.md).
