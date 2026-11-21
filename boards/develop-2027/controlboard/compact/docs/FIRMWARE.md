# Compact set: firmware pin map and bring-up notes

This is the authoritative firmware reference for:
- the controlboard **ControlBoard2027_C4L2** (STM32H723ZGT6);
- the 30 x 40 mm radio (ESP32-C5-WROOM-1U), which has the same schematic on both the Inboard and Overhang variants.

Every pin in this file was read from the C4L2 and radio schematic netlists and re-checked on 2026-11-21. Where this
file and the schematic disagree, the schematic wins. Do not copy settings from the old CubeMX V0.3 project: it
assumes a 48 MHz crystal and the prototype pin map. Firmware ported from the prototype needs the pin changes listed
in [PROTOTYPE_TO_COMPACT.md](PROTOTYPE_TO_COMPACT.md).

The board-to-board link and the connector pinouts are in [INTERFACE.md](INTERFACE.md). Positions are in mm from the
board outline's top-left corner, x right, y down. The robot front is at the top of the controlboard.

## 1. STM32H723ZGT6 (controlboard)

### 1.1 Clock tree and supply

| Setting | Value | Reason |
|---|---|---|
| HSE | 25 MHz crystal (X1), crystal mode, not bypass. HSE_VALUE = 25000000 | |
| PLL1 | DIVM /5, DIVN x96, DIVP /2, DIVQ /10 | 5 MHz input, 480 MHz VCO, SYSCLK 240 MHz, PLL1Q 48.000 MHz |
| PLL1Q users | USB, SDMMC2 (SDMMCSEL), SPI1-SPI3 (SPI123SEL) | exactly 48 MHz from integer dividers |
| SPI6 kernel | SPI6SEL = HSE, /8 = 3.125 MHz | LEDs |
| Voltage scaling | VOS1 with AHB /2 and APB at most 100 MHz, or VOS0 | AHB max 200 MHz at VOS1; VOS0 limits TJ to 105 °C |
| Supply | PWR_LDO_SUPPLY | the H723 has no SMPS |
| BOR | option bytes, about 2.7 V | a rail sag resets the MCU instead of browning out peripherals (§1.9) |
| CRS | off | USB runs from PLL1Q |
| LSE / RTC | off | no 32.768 kHz crystal; PC13-PC15 are unconnected; keep RTC tamper / wake-up off |

The ROM bootloader uses its own clocking, so DFU does not depend on these settings.

### 1.2 Peripherals

| Peripheral | Pins (LQFP pin) | AF | Connects to | Settings |
|---|---|---|---|---|
| SPI3, front motors and dribbler | PC10 SCK (111), PC11 MISO (112), PC12 MOSI (113) | AF6 | R15 / R16 30R, ESD U4 / U14 / U13, J4 MOTOR 0, J8 DRIBBLER, J7 MOTOR 3 | one bus, three chip selects (§1.3); 48 MHz / 8 = 6 Mbit/s, 8-bit, mode 0 or 1 (SCK idles low, R30 pull-down) |
| SPI2, rear motors | PB13 SCK (74), PB14 MISO (75), PB15 MOSI (76) | AF5 | R67 / R68 30R, ESD U5 / U12, J5 MOTOR 1, J6 MOTOR 2 | as SPI3 (R69 SCK pull-down) |
| SPI1, radio | PB3 SCK (133), PB4 MISO (134), PB5 MOSI (135) | AF5 | R65 / R66 30R, J9 | mode 3, 8-bit, hardware CRC off; 3 MHz bring-up, 24 MHz (PLL1Q / 2) normal, 40 MHz only after a scope check (§1.7). **No pull on PB4** |
| SPI6, DotStars | PA5 SCK (41), PA7 MOSI (43) | AF8 | R70 / R71 30R, U10 level shifter (R48 / R47 100k pull-downs at its inputs) | TX only, mode 0, 3.125 Mbit/s. D3 domain: BDMA, buffers in SRAM4 |
| SDMMC2, microSD | PD6 CK (122), PD7 CMD (123), PG9-PG12 D0-D3 (124-127) | AF11 (CK, CMD, D0, D1), **AF10** (D2, D3) | R6 30R on CK, U1 ESD, R1-R5 47k pull-ups, J1 | 4-bit; kernel PLL1Q 48 MHz; card identification at 400 kHz or less, then CLKDIV 3 (8 MHz) for bring-up, CLKDIV 1 (24 MHz) after checking CK at TP1 |
| USB FS (OTG_HS core, internal FS PHY) | PA11 DM (103), PA12 DP (104) | none: OTG_HS_DM / DP are additional functions (DS13313 pin table) | U3 ESD, J2 | device; VBUS sense on PA9 as a GPIO (§1.5) |
| I2C1, kicker | PB8 SCL (139), PB9 SDA (140) | AF4 | R14 / R17 2.2k, U17 ESD, J10 | 400 kHz |
| I2C2, expansion | PF1 SCL (11), PF0 SDA (10) | AF4 | R7 / R9 2.2k, U6 / U16 ESD, J11 / J12 | 100 kHz until 400 kHz rise times are checked with the real cables |
| I2C3, OLED | PA8 SCL (100), PC9 SDA (99) | AF4 | R18 / R19 2.2k, J13 | 400 kHz; SSD1306 at 0x3C (probe 0x3D too) |
| I2C4, IMU | PD12 SCL (81), PD13 SDA (82) | AF4 | R10 / R8 2.2k, U11 | 400 kHz; LSM6DSV320X at 0x6A |
| USART10, powerboard | PE3 TX (2), PE2 RX (1) | **AF11 TX, AF4 RX** (DS13313 Table 8) | R33 / R34 1k, J15 pin 1 (TX) / pin 2 (RX) | 115200 8N1; internal pull-up on PE2 (floats with J15 unplugged) |
| USART6, debug VCP | PC6 TX (96), PC7 RX (97) | AF7 | J3 pin 14 (MCU TX) / pin 13 (MCU RX), STLINK-V3 virtual COM port | internal pull-up on PC7 (floats with no probe) |
| SWD | PA13 SWDIO (105), PA14 SWCLK (109), NRST (25) | AF0 | J3 STDC14 | start at 1 MHz; no SWO (PB3 is the radio SCK) |

Rules for every bus:
- **I2C:** let CubeMX compute the Timing value for this clock tree; never copy V0.3's value. Internal pull-ups off.
  Run bus recovery (up to 9 SCL pulses, then STOP) before each init.
- **SPI masters:** set Master Keep IO State = Enable, so SCK does not float between transfers.

### 1.3 GPIO

| Pin (LQFP pin) | Net | Mode | Notes |
|---|---|---|---|
| PD0 (114) | MOTOR0_SPI_CS (J4) | output PP, init high, LOW / MEDIUM speed | R24 10k pull-up |
| PB12 (73) | MOTOR1_SPI_CS (J5) | output PP, init high, LOW / MEDIUM | R25 |
| PD8 (77) | MOTOR2_SPI_CS (J6) | output PP, init high, LOW / MEDIUM | R26 |
| PD2 (116) | MOTOR3_SPI_CS (J7) | output PP, init high, LOW / MEDIUM | R27 |
| PD1 (115) | DRIBBLER_SPI_CS (J8) | output PP, init high, LOW / MEDIUM | R28 |
| PG15 (132) | ESP_SPI_CS | output PP, init high, LOW / MEDIUM | R29 10k pull-up |
| PE1 (142) | ESP_RST | open drain, init released | never drive high; the radio pulls EN up |
| PB6 (136) | ESP_DATA_READY | EXTI6, rising, no pull | R32 10k pull-down |
| PB7 (137) | ESP_HANDSHAKE | EXTI7, rising, no pull | R31 100k pull-down |
| PF3 (13) | ACCEL_EXTI | EXTI3, rising | IMU INT1, push-pull |
| PF2 (12) | GYRO_EXTI | EXTI2, rising | IMU INT2, push-pull |
| PD11 (80), PD14 (85), PD15 (86) | USER_EXTI0-2 (SW4-SW6, BTN0-2) | EXTI11 / 14 / 15, falling | active low; R59-R61 10k pull-ups, R62-R64 10k series, C50-C52 100 nF: debounce about 1 ms press / 2 ms release; ignore re-triggers for 10 ms |
| PE7 (58), PE8 (59), PE9 (60), PE10 (63), PE14 (67), PE15 (68) | DIP0-DIP5 (SW3, ROBOT ID) | input, read at boot | R53-R58 100k pull-ups; a switch that is on reads 0 |
| PE5 (4) | PWR_SRC_5V | input, polled, **no pull** | U8 ST via R44 10k; high = powerboard 5 V selected |
| PE4 (3) | PWR_SRC_3V3 | input, polled, **no pull** | U9 ST directly (it also drives the R41 hysteresis, so a pull would shift U9's thresholds); high = powerboard 3.3 V selected |
| PA9 (101) | VBUS_SENSE | input | R20 47k / R21 68k divider (0.591) on VBUS; HAL_PCD_DevConnect / DevDisconnect on its edges |
| PD5 (119) | SD_DET (microSD card detect) | input, no pull, EXTI5 both edges | R73 47k pull-up; low = card in; debounce about 50 ms before initialising the card |
| PA15 (110) | (R13 only) | analog | R13 holds the ROM bootloader's SPI3 NSS high (§1.4) |
| BOOT0 (138) | BOOT0 | | R11 10k pull-down; SW2 (BOOT) pulls it to 3.3 V |
| all others | unconnected | analog | including PE13, PG13 / PG14, PF14 / PF15, PB10 / PB11, PA0-PA4, PA6, PC5, PB0, PD9, PD10, PC13-PC15, PC3_C |

Interrupt sharing:
- PB6, PB7 and PD5 share the EXTI9_5 vector, so check the pending bits.
- PD11, PD14 and PD15 share EXTI15_10.
- Some polled pins share EXTI line numbers with interrupt pins: PE5 / PD5, PE14 / PD14, PE15 / PD15, PE7 / PB7 and
  PE9 / PA9. This is harmless as long as the polled pins stay plain inputs with no EXTI enabled.

### 1.4 ROM bootloader pins (AN2606 Rev 62, Table 114, STM32H72xxx/73xxx, bootloader V9.0)

USART1 is on PA9 / PA10, not PB14 / PB15, so the rear MISO pin PB14 is not a bootloader pin. These bootloader
peripherals touch board nets:
- **USART1 TX on PA9** is VBUS_SENSE (R20 / R21 divider). It stays an input until USART1 is detected.
- **USART3 TX on PD8** is MOTOR2_SPI_CS. It idles high, so the motor stays deselected.
- **I2C1 (PB6 / PB9), I2C2 (PF1 / PF0) and I2C3 (PA8 / PC9)** are open-drain slaves at address 0x57. Those pins are
  ESP_DATA_READY / kicker SDA, the expansion bus and the OLED bus.
- **SPI1 on PA5 / PA7** is the LED SCK / MOSI. These are inputs with R48 / R47 pull-downs; its MISO (PA6) and NSS (PA4)
  are unconnected.
- **SPI3 on PC10-PC12** is the front motor bus. R13 holds its NSS (PA15) high, so MISO (PC11) is never driven.
- **SPI4:**
  - PE14 is DIP4, an input.
  - PE13, its MISO output, is deliberately left unconnected.
  - NSS (PE11) has the bootloader's own pull-up.
- **FDCAN1:** PD0 (MOTOR0_SPI_CS) is an input, and PD1 (DRIBBLER_SPI_CS) is TX, which idles recessive high
  (deselected).

No bootloader output can fight a board driver.

Margin: in the bootloader, PD8 (USART3 TX, an input until detected) and PD0 (FDCAN1 RX) have internal pull-downs.
These pull the 10k-pulled-up chip selects down to about 2.5-2.75 V (estimated, internal pull-down 30-50k). That is
still above 0.7 x VDD, so the motor boards stay deselected, with about 0.2 V margin.

### 1.5 Settings the hardware depends on

- **Brown-out reset on** (option bytes, level about 2.7 V). See §1.9 for what to do when the power source changes.
- **USB:**
  - VDD33USB is tied to +3V3, so keep the internal USB regulator off.
  - Enable the USB voltage detector (`HAL_PWREx_EnableUSBVoltageDetector()`, PWR_CR3.USB33DEN) before starting the OTG
    core. Without it the FS PHY stays unpowered.
  - Turn the OTG core's own VBUS sensing off and read VBUS_SENSE (PA9) as a GPIO.
  - Enable the D+ pull-up only while VBUS_SENSE is high.
- **Internal pulls:**
  - none on PB4 (radio MISO), PE4 / PE5 or any I2C pin;
  - pull-ups on PC7 and PE2;
  - PE1 (ESP_RST) open drain only.
- **Motor MISO** (PC11, PB14) has no external pull: enable a weak internal pull-down so it does not float between
  transfers.
- **Motor SPI mode:** the motor SCK lines idle low (R30, R69), so use mode 0 or 1. The radio link is mode 3.
- **Current limits:** cap the LED current while on USB (PWR_SRC_5V low). The expansion ports supply at most 0.55 A
  combined.

### 1.6 GPIO speed (OSPEEDR)

- **Motor buses: LOW or MEDIUM only, never HIGH / VERY_HIGH.** This covers SCK / MOSI (PC10, PC12, PB13, PB15) and the
  chip selects (PD0, PD1, PD2, PB12, PD8).
  - Each bus is a trunk with unterminated drops to its connectors (front: J4, J8, J7; rear: J5, J6).
  - With edges slower than about 3 ns the drops act as lumped loads. With sub-ns edges each drop rings.
  - Check SCK at J4 and J7 on a scope.
- **Radio SPI1:** SCK / MOSI (PB3, PB5) at MEDIUM up to 24 MHz, HIGH only at 40 MHz. CS (PG15) LOW or MEDIUM.
- **SDMMC2:** start at MEDIUM; raise only if the 24 MHz eye at TP1 needs it.

### 1.7 Radio link (host side)

- ESP-Hosted SPI full-duplex host, mode 3, software CS on PG15, SPI1 on PB3 / PB4 / PB5 (AF5).
- HANDSHAKE (PB7) and DATA_READY (PB6) are EXTI inputs without internal pulls (R31 / R32 are on the board). They are
  active high and idle low. Mask them while the radio initialises.
- **MISO (PB4): no internal pull.**
  - PB4 comes out of reset as NJTRST with its internal pull-up on.
  - Configure it as SPI1 MISO (AF5) with no pull at init, before the radio is released from reset.
  - MISO has exactly one pull, the radio-side pull-down that ESP-Hosted enables on GPIO2. The slave tri-states MISO
    while CS is high.
- **Reset:** pull PE1 low for 10 ms, release, then wait 500 ms before trusting HANDSHAKE / DATA_READY.
- **Clock:** SPI123SEL = PLL1Q 48 MHz gives 24 MHz at /2. 40 MHz (the ESP32-C5 slave maximum) needs an 80 MHz SPI123
  kernel clock (PLL2P or PLL3P) and a scope measurement of the MISO valid delay at J9 first.
- Keep the ESP-Hosted frame checksum on.

### 1.8 IMU (U11, LSM6DSV320X)

- I2C4 (PD12 SCL / PD13 SDA, AF4), address 0x6A (SDO/TA0 to GND; CS tied high selects I2C). Use the LSM6DSV320X
  driver and check WHO_AM_I.
- INT1 goes to PF3 (ACCEL_EXTI) and INT2 to PF2 (GYRO_EXTI), both push-pull. Route any event to either pin with
  INT1_CTRL / INT2_CTRL.
- The part has no reset pin. After a PWR_SRC change or an I2C error, re-read the configuration registers and
  re-initialise if they changed.
- **Orientation.** U11 is on the bottom side, inside the MCU pad ring, at (48.6, 20.6), KiCad rotation 270 (-90).
  Seen from above through the board, pin 1 is at the north-west corner of the package (47.85, 19.44).
  - **Z:** the package top faces down, so the sensor +Z axis points out of the board's bottom face:
    z_robot = -z_sensor (with the board mounted top side up).
  - **X / Y: still open.** Derive them from the datasheet pin-1 / axis drawing, mirrored for the bottom side and
    rotated 270 degrees, then confirm on the bench:
    1. With the board flat and its top side up, the sensor Z axis must read about -1 g.
    2. Tilt the robot front down, then its right side down.
    3. Record which sensor axis responds and with which sign.
    4. Put the resulting remap in firmware and in the controlboard TODO.

### 1.9 Power source, LEDs and loads

- Rails: +5V and +3V3 are TPS2116 mux outputs (U8, U9). The powerboard (J15) has priority; USB is the bench fallback.
- U8 (5 V) switches to USB at about 3.55 V falling and back at about 3.88 V rising. U9 (3.3 V) switches at about
  2.34 V falling and 2.57 V rising.
- **Switching sources while USB is attached:**
  - Unplugging the powerboard lets +3V3 sag to 2.13-2.55 V and +5V to about 3.2-3.9 V before the mux switches.
  - Plugging the powerboard in also sags the rails briefly, because the mux waits until VOUT falls to the rising
    powerboard rail.
  - On any PWR_SRC_5V / PWR_SRC_3V3 change:
    - re-initialise the SD card, IMU and OLED;
    - pulse ESP_RST and restart ESP-Hosted;
    - resend the LED frame.
  - On the robot there is no USB, so this is a bench case.
- Drive the powerboard UART TX (PE3) only once PWR_SRC shows the powerboard.
- USB power alone is for restricted bench use (radio TX off, external loads off): F1 holds 0.55 A at 50 °C.
- **Load limit:** keep the total +3V3 load at about 0.8 A or less, including the radio. The radio starts on this
  rail only above 3.07 V and drops off it below about 2.9 V (§2.4).
- **LEDs (D7-D11, SK9822-EC20):**
  - Frames are APA102-style (SK9822 datasheet §10): a start frame of 32 zero bits, then per LED 0b111, a 5-bit current
    gain and three 8-bit colour bytes, MSB first.
  - **The datasheet does not settle the colour byte order.** Its frame table (p7) shows red, blue, green; the text
    says "RBG" (p7) and "GRB" (p8); the APA102 default is blue, green, red. Make the order a build option and set it
    on the first board by sending pure red, then green, then blue to one LED.
  - The datasheet's end frame is 32 one bits. Send at least 32 bits plus n/2 extra clocks; an SK9822-aware driver
    such as FastLED `SK9822` does this.
  - The 5-bit field sets the LED current (18 mA per colour at 31/31), not PWM. OPSCO recommends level 9/31 or lower
    (about 5.2 mA per colour) for heat in the 2020 package; use the 8-bit values for dimming.
  - Cap the chain at about 250 mA on the powerboard and about 100 mA while PWR_SRC_5V is low (USB).
  - Send an all-off frame at start-up: the power-on state is not specified.

### 1.10 Other

- **SD:** card detect on PD5 (low = card in). Still treat an init failure as "no card" and recover a hung card with
  CMD0; card VDD is not switchable.
- **OLED:** the module is mounted rotated 90 degrees. Set the u8g2 rotation (U8G2_R1 or U8G2_R3) on the first board.
  Check rise times before running 400 kHz.
- **DFU:**
  - Hold BOOT (SW2) and press RESET (SW1).
  - The ROM DFU uses HSI48 with CRS, so it needs neither the crystal nor VBUS sensing.
  - Bootloaders before V9.3 lock PWR_CR3 until power-off: power-cycle after DFU.
- **Motor modules** must release MISO while their CS is high, because each bus shares one MISO.
- **Motor cables:**
  - The four drive motors (J4-J7) use a reversed GH cable (pin n to 7-n); the dribbler (J8) uses a straight one
    (INTERFACE.md J4-J8).
  - A drive motor that never answers on a known-good bus is most likely on the wrong cable.

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
- **Set every pin explicitly in menuconfig:** CLK = GPIO6, MOSI = GPIO7, MISO = GPIO2, CS = GPIO10, **HANDSHAKE =
  GPIO1, DATA_READY = GPIO0**, reset = EN. Do not rely on the C5 Kconfig defaults: the default CLK is GPIO3, which is
  not connected.
- Clock: up to 40 MHz (the ESP32-C5 SPI slave maximum). Bring the link up at 3-10 MHz with the checksum on.
- Keep the RTC slow clock on an internal source. Selecting an external 32 kHz crystal takes GPIO0 / GPIO1 away from
  DATA_READY / HANDSHAKE.
- While PWR_SRC_HOST (GPIO9) is low, the radio runs from USB and the controlboard may be unpowered. Keep MISO,
  HANDSHAKE and DATA_READY as inputs without pulls, and enable the link outputs only when GPIO9 is high.
- **No internal pull-up on CS (GPIO10), ever.**
  - The controlboard's R29 10k already holds CS high whenever the controlboard is powered.
  - An ESP pull-up on CS is the only DC path from the radio's USB-derived 3.3 V into an unpowered controlboard
    (through R29 into its +3V3 rail, up to about 41 uA / 1.7 V).
  - With it disabled, the only remaining leakage is the TPS2116 reverse leakage (<= 0.15 uA) and the STM32 FT pin
    leakage (<= 1.5 uA per pin).
  - Stock ESP-Hosted turns it on in source: `coprocessor/eh_cp_transport/src/eh_cp_transport_spi.c` calls
    `gpio_set_pull_mode(GPIO_CS, GPIO_PULLUP_ONLY)` and sets `pull_up_en = 1` in the handshake-disable config. Patch
    both out.
- ESP-Hosted sets MISO to `GPIO_DRIVE_CAP_3`, but R4 33R assumes the default drive. Set drive cap 1-2 for GPIO2, or
  check MISO on a scope before going above 24 MHz.
- Never burn EFUSE_JTAG_SEL_ENABLE: GPIO7 (MOSI) would then select the JTAG source.

### 2.3 Strapping, boot and USB

- Boot mode is set by GPIO26-28 only.
  - GPIO28 = 1 at reset (R3 pull-up) boots from flash.
  - Holding BOOT (GPIO28 low, GPIO27 high by its internal pull-up) while pressing or releasing RESET enters ROM
    download mode, over USB or UART0.
- C4 (15 pF on GPIO28) is not fitted: fitting it can force download mode.
- USB-C J1 carries the native USB Serial/JTAG: flashing, console and JTAG. Full Speed only, no USB OTG.
  - If the application disables the USB PHY or reuses GPIO13 / 14, auto-download stops working: use BOOT + RESET.
  - With the speaker board fitted on the controlboard, a USB-C plug probably does not fit the radio. Flash with the
    speaker board off, or over the air.
- RF test firmware supports UART only: use UART0 on TP1 / TP2.

### 2.4 Power, switchover and brownout

- The radio runs from the controlboard +3V3 (+3V3_HOST, through J2) when present, otherwise from USB-C through its
  MCP1826S LDO (U4). U3 (TPS2116, priority mode) selects the source; U7 (TPS3840PL29 supervisor) drives its PR1 input.
- Thresholds (TPS3840PL29, -40 to 125 °C):
  - the host is selected above 2.932-3.069 V rising (3.00 V typical);
  - the host is dropped below 2.857-2.944 V falling (2.90 V typical), within 15-30 us;
  - below the falling threshold U3 switches to USB, or turns off if USB is absent.
- The module needs at least 3.0 V. Between the falling threshold and 3.0 V it stays on a sagging host rail even with
  USB plugged in. **Keep the ESP32-C5 brownout detector enabled** (CONFIG_ESP_BROWNOUT_DET) at the highest level the
  nominal 3.3 V rail does not trip, and do not expect USB to rescue a low controlboard rail.
- Peak current is 313 mA (2.4 GHz TX) / 403 mA (5 GHz TX).
- Margin on the host rail (controlboard +3V3 at J9):
  - About 3.2 V at start-up at the planned load, so the radio starts on the host.
  - At full load (the radio's 0.4 A TX peak plus about 0.8 A of controlboard load) the rail can sag to about 3.00 V
    in the worst case. That is close to the falling threshold and to the module's 3.0 V minimum.
  - Keep the total controlboard +3V3 load at about 0.8 A or less, and treat a radio reset during heavy TX as a
    supply problem first.
- With USB only and the controlboard attached but unpowered, the module still comes out of reset (EN about 3.2 V).
  PE1 is a 5 V-tolerant pin that does not clamp.

### 2.5 Antenna

- Primary build: WROOM-1U-N8R8 with an external antenna on the module's u.FL (Taoglas FXP831.07.0100C, ANT1).
- Fallback: WROOM-1-N8R8 (PCB antenna) on the same footprint. It needs a stencil without paste on U1 pads 30-32.
  - Inboard: the antenna lies over the controlboard.
  - Overhang: the antenna sticks out past the controlboard's front edge.

## 3. Bench bring-up checklist

Controlboard:
1. Power, first from the powerboard only, then from USB only:
   - check +5V / +3V3 at TP16 / TP17, the PWR_SRC pins, and the U7 LDO (TP15);
   - check the USB attach inrush on the team's laptops;
   - on USB only, scope +3V3 at TP17 while the LEDs switch from off to full. It should settle without ringing (U7
     MCP1826S with the +3V3 bulk switched in).
2. HSE: start-up and drive level at R12 (fit a few hundred ohms if the drive exceeds 100 uW).
3. SWD at 1 MHz on J3, then DFU over USB, then the debug VCP on J3.
4. Motor buses: SCK at J4 and J7 on a scope at the chosen GPIO speed (no ringing at the connectors).
5. SD: CK at TP1 at 8 MHz, then at 24 MHz.
6. I2C: SCL rise time at TP7 (kicker) and TP8 (expansion) with real cables. It must be under 300 ns for 400 kHz.
7. OLED at 0x3C / 0x3D; IMU WHO_AM_I and the axis remap (§1.8).
8. Unplug the powerboard with USB attached and check that the firmware recovers (§1.9).
9. LED chain: all-off frame, colour byte order (§1.9), then data at TP20 / TP21 (end of chain).

Radio (fitted on the controlboard):
1. Radio supply at the module, and +3V3 at J9, during 5 GHz TX with the controlboard at full load (LEDs, motors
   polling, SD writing). It should stay above about 3.05 V.
2. EN with the controlboard attached but unpowered and the radio on USB (expect about 3.2 V).
3. Link at 3 MHz, then 24 MHz. Scope the MISO valid delay at J9 before trying 40 MHz.
4. PWR_SRC_HOST (GPIO9) follows the controlboard rail, with switchover at the U7 thresholds.
5. Range test of the WROOM-1U with the external antenna (5 GHz gain), and of a WROOM-1 build if one is made.

Related documents:
- [../README.md](../README.md)
- [INTERFACE.md](INTERFACE.md)
- [PROTOTYPE_TO_COMPACT.md](PROTOTYPE_TO_COMPACT.md)
- [ControlBoard2027_C4L2 DESIGN_NOTES](../ControlBoard2027_C4L2/DESIGN_NOTES.md)
- [Inboard DESIGN_NOTES](../RadioBoard2027_C_Inboard/DESIGN_NOTES.md)
- [Overhang DESIGN_NOTES](../RadioBoard2027_C_Overhang/DESIGN_NOTES.md)
