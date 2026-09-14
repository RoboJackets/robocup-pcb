# RadioBoard2027 Design Notes - Super Clauded. !!!NOT AUTHORITATIVE!!!

Why each part and value on the radio board was chosen, the firmware settings the hardware
depends on, and the open issues. Schematic notes point here by section number. The controlboard
side of the link is in `../ControlBoard2027/DESIGN_NOTES.md` §11.

**Contents**

1. [Sources](#1-sources)
2. [Power](#2-power)
3. [ESP32-C5 module](#3-esp32-c5-module)
4. [USB](#4-usb)
5. [Controlboard link](#5-controlboard-link)
6. [Firmware configuration](#6-firmware-configuration)
7. [Open issues](#7-open-issues)

---

## 1. Sources

| Tag | Document |
|---|---|
| MOD | ESP32-C5-WROOM-1 / WROOM-1U datasheet v1.3 |
| CHIP | ESP32-C5 series datasheet v1.5 |
| HDG | Espressif ESP32-C5 hardware design guidelines (latest revision v1.4) |
| EH | espressif/esp-hosted-mcu: `docs/getting-started-mcu.md`, `docs/design/`, co-processor and host Kconfig, `spi_slave_api.c`, `spi_drv.c` (main and v2.12.13) |
| SLVSFG1A | TI TPS2116 |
| DS37274 | Diodes AP7361C |
| MF-MSMF | Bourns MF-MSMF PTC, Rev BD 06/26 |
| eGH | JST GH connector catalogue |
| TAO | Taoglas FXP831.07.0100C spec SPE-11-8-026-K |
| Radio doc | 2027 Radio Module Design Doc (in `../`) |

The Seeed XIAO ESP32-C5 project in `../daughterboard` was used as a cross-check for the USB-C,
EN and BOOT circuits.

The ESP32-C5-WROOM-1U symbol and footprint in `lib/` come from espressif/kicad-libraries 3.2.1.
All 32 pin numbers match MOD Table 3-2.

---

## 2. Power

The board runs from the controlboard's muxed +3V3 over the J2 cable (net +3V3_HOST). USB-C can
power it alone for flashing and debugging.

| Rail | Source | Loads |
|---|---|---|
| +3V3_HOST | ControlBoard2027 +3V3 via J2 pins 1-2 | U3 VIN1 |
| VBUS | USB-C J1, after D2 and F1 | U4 |
| (U4 out) | AP7361C from VBUS | U3 VIN2 |
| +3V3 | U3 output | Module, LEDs, ESD rail |

- **U3 TPS2116**, priority mode (MODE tied to VIN1). The controlboard supply wins whenever it is
  present. The part blocks reverse current into an unused input (SLVSFG1A §7.3.4), so USB power
  never back-feeds the controlboard, and no diodes are needed.
- **PR1 divider R11 100k / R12 68k, ST pull-up R13 10k, hysteresis R14 1M.** These copy
  ControlBoard2027 U2, so both muxes switch at the same points: to USB below about 2.24V,
  back above about 2.57V.
- **ST → GPIO9 (PWR_SRC_HOST).** High means the controlboard is powering the board. Firmware uses
  it to know whether a host is present (§6).
- **U4 AP7361C-33E-13**: 1A, 360mV dropout at 1A (DS37274). At a 403mA TX peak it drops
  (5.0 - 3.3) × 0.4 = 0.68W peak; the average is far lower.
- **Module supply**: 3.0-3.6V, supply ≥0.6A (MOD Table 6-2). Peak current is 313mA at 2.4GHz and
  403mA at 5GHz (MOD Tables 6-4, 6-5).
- **Capacitors**: C7 10µF at VIN1, C6 10µF at VIN2, C8 22µF + C9 100nF at VOUT. At the module,
  C1 22µF + C2 100nF (HDG 1.3.2 asks for at least 10µF).
- **D4 TVS0500** on +3V3_HOST at J2 (HDG 1.3.2: ESD diode at the power entrance).
- **D3 red power LED** with R15 1.5k: (3.3 - 2.0) / 1.5k = 0.87mA, the same brightness as the
  controlboard rail LEDs.

---

## 3. ESP32-C5 module

### U1 ESP32-C5-WROOM-1U-N8R8
The 1U variant has a U.FL-compatible antenna connector (Hirose U.FL / I-PEX MHF I, MOD §10.2) for
the Taoglas FXP831.07.0100C named in the radio design doc. N8R8 has 8MB flash and 8MB PSRAM.

- Pad 19 (GPIO15) is the PSRAM chip select on N8R8 and "cannot be used for other functions"
  (MOD Table 3-2 note 3). It is left unconnected.
- ANT2 (pad 31) is disabled by default; the module uses its own connector. Left unconnected.
- EPAD soldering is optional but improves heat flow (MOD Fig 9-2 notes). Solder it with vias.

### SPI pins (ESP-Hosted full duplex)

| Signal | GPIO | Pad | Notes |
|---|---|---|---|
| CLK | 6 | 8 | IO_MUX FSPICLK |
| MOSI | 7 | 9 | IO_MUX FSPID, strapping pin (JTAG source) |
| MISO | 2 | 4 | FSPIQ, strapping pin (MTMS), R4 33Ω series |
| CS | 10 | 12 | FSPICS0 |
| HANDSHAKE | 3 | 5 | strapping pin (MTDI, SDIO edge) |
| DATA_READY | 4 | 17 | weak pull-up at reset |
| RESET | EN | 3 | host pulls EN low |

- **Strapping pins.** GPIO2 (MTMS), GPIO3 (MTDI) and GPIO7 are listed as strapping pins (CHIP
  Table 3-1), but none of them chooses the boot mode; only GPIO26-28 do (CHIP Table 3-3). MTDI
  with GPIO25 sets the SDIO clock edge, which SPI does not use (CHIP §3.2). GPIO7 chooses the
  JTAG source and is ignored while the eFuses are at their defaults (CHIP Table 3-7).
- **Why these pins.** 6/7/2/10 are the C5's IO_MUX SPI pins, and EH recommends IO_MUX pins.
  They match the ESP-Hosted docs table.
- **Firmware must set two pins.** ESP-Hosted's co-processor Kconfig defaults to CLK GPIO3 and
  HANDSHAKE GPIO1 on the C5, not the documented 6 and 3. Set them explicitly (§6).
- **R4 33Ω** on MISO is source termination at the driver. EH suggests series termination on the
  SPI lines.

### EN (reset)
- **R1 10k to +3V3 and C3 1µF to GND** make the recommended power-on delay (HDG 1.3.3). EN must
  never float (MOD Table 3-2).
- **Timing.** Rails must be stable ≥50µs before EN rises, and a reset needs EN low ≥50µs (MOD
  Table 4-8). ESP-Hosted's host holds reset low for 10ms, then waits 500ms (EH `spi_drv.c`).
- **R2 470Ω** joins EN to the controlboard's ESP_RST. If the host pin is mis-set to push-pull,
  R2 limits the current into C3. With R1 it holds EN at 3.3 × 470 / 10.47k = 0.15V when pulled
  low, below the 0.25 × VDD input-low limit (MOD Table 6-3).
- **SW1 RESET** pulls EN to GND.

### BOOT
- **R3 10k pull-up on GPIO28** (HDG 1.3.9). GPIO28 = 1 at reset is SPI boot; GPIO28 = 0 with
  GPIO27 = 1 is download mode, including USB (MOD Table 4-3). GPIO27 has an internal pull-up and
  is left unconnected.
- **SW2 BOOT** pulls GPIO28 low. Hold it while pressing RESET to force download mode.
- **C4 15pF** is a footprint only (DNP). HDG 1.3.9 asks for one but warns that fitting it can
  force download mode; the XIAO fits 15pF.

### Debug and status
- **UART0** (GPIO11 TX, GPIO12 RX) goes to TP1/TP2, with R7 499Ω on TX (HDG 1.3.7). HDG 1.5 says
  to keep UART0 because RF test firmware only supports UART.
- **D1 green status LED** on GPIO24 through R8 1.5k (about 0.8mA), active high. GPIO24 is a
  no-restriction P2 pin (CHIP §2.3.5); GPIO0/1 (32k crystal), 8, 9 and 23 are the other free P2
  pins. Unused GPIOs are left unconnected.

---

## 4. USB

- **J1 GCT USB4110-GF-A**, the same connector as the controlboard. Shield left floating, matching
  the controlboard choice.
- **R9/R10 5.1k** Rd on CC1/CC2 set the sink role.
- **Native USB Serial/JTAG** on GPIO13 (D-) / GPIO14 (D+). No USB-UART bridge is needed.
  R5/R6 22Ω sit in series near the module (HDG 1.3.13 suggests 22-33Ω).
- **U2 USBLC6-2SC6** on D+/D- at J1. Its rail pin goes to +3V3, as on the controlboard, so an
  unplugged cable does not hold VBUS up through the D+ pull-up.
- **D2 TVS0500** on VBUS at J1, then **F1 MF-MSMF075/16X-2**: hold 0.75A (0.55A at 50°C), trip
  1.50A. The module's 403mA peak sits under the hold current.
- **C5 4.7µF** on VBUS/LDO input. The USB Device Capacitance ECN requires 1-10µF on VBUS.
- Auto-download over USB stops working if the application disables the USB PHY or reuses
  GPIO13/14 (HDG 1.5). The BOOT button is the fallback.

---

## 5. Controlboard link

### J2 connector
JST GH 1.25mm, 15-pin vertical SMD header BM15B-GHS-TBT(LF)(SN). ControlBoard2027 J14 is the same
part with the same pinout, so the cable is a straight 1:1 harness: housing GHR-15V-S, terminal
SSHL-002T-P0.2, 26 AWG.

- **Why GH.** It is the only candidate whose datasheet states a positive latch ("large outer
  latch for positive lock", eGH), and the radio doc rules out 2.54mm headers because they came
  loose in competition. It is rated 1.0A per contact at 26 AWG, and KiCad 10 has the footprint.
- **Rejected.** JST SH and PH, and Hirose DF13/DF11, claim no lock or only a friction lock.
  Molex Micro-Lock Plus has no KiCad footprint. Molex Pico-Clasp latches, but only takes 28-32
  AWG wire and had no vertical header stock.

| Pin | Net | Pin | Net |
|---|---|---|---|
| 1 | +3V3_HOST | 9 | GND |
| 2 | +3V3_HOST | 10 | ESP_SPI_CS |
| 3 | GND | 11 | GND |
| 4 | ESP_SPI_SCK | 12 | ESP_HANDSHAKE |
| 5 | GND | 13 | ESP_DATA_READY |
| 6 | ESP_SPI_MOSI | 14 | ESP_EN |
| 7 | GND | 15 | GND |
| 8 | ESP_SPI_MISO | MP | GND |

- SCK, MOSI, MISO and CS each have GND on both sides. EH wiring advice is "run a ground between
  every signal" and keep jumpers ≤10cm.
- The slow lines (HANDSHAKE, DATA_READY, EN) are grouped. Full interleaving would need 17 pins,
  and GH stops at 15.
- Two power pins at 1.0A each carry the 403mA peak with margin.

### ESD
- **U5 TPD4E05U06** on SCK, MOSI, MISO, CS and **U6** on HANDSHAKE, DATA_READY, EN, both right at
  J2. U6 channel D2- is unused.
- The module is rated HBM ±2kV / CDM ±500V (MOD §12), and the cable end gets handled.

### Pulls
The controlboard holds CS up (R73 10k) and HANDSHAKE/DATA_READY down (R75/R76 100k). This board
adds no pulls on those lines.

- Once running, the ESP-Hosted firmware enables its own internal pulls: pull-up on MOSI/SCLK/CS,
  pull-down on MISO/HS/DR (EH `spi_slave_api.c`).
- During reset and ROM boot those pins float, apart from GPIO4, which has a weak internal pull-up
  (CHIP Table 2-1). R76 overrides it to about 2.28V, below the 2.475V input-high threshold.

---

## 6. Firmware configuration

- **ESP-Hosted co-processor**: SPI full duplex, SPI mode 3 (mode 0 is not supported on the slave,
  EH `spi_slave_api.c`). Set CLK = GPIO6, MOSI = GPIO7, MISO = GPIO2, CS = GPIO10,
  HANDSHAKE = GPIO3, DATA_READY = GPIO4, reset = EN in menuconfig. The C5 defaults for CLK and
  HANDSHAKE are different.
- **Clock**: up to 40MHz for the C5 (EH performance doc, MOD §5.2.1.2). The controlboard runs
  3Mbit/s. EH suggests bringing up at 5-10MHz and lowering the clock first if errors appear. Keep
  the frame checksum on.
- **Host reset**: ESP-Hosted's "active high" reset option matches EN. It pulses EN low for 10ms,
  then waits 500ms before trusting HANDSHAKE/DATA_READY.
- **PWR_SRC_HOST (GPIO9)**: while it is low, the board is on USB with no powered host. Keep MISO,
  HANDSHAKE and DATA_READY as inputs (Hi-Z) so they do not drive an unpowered controlboard (M2).
- **Status LED (GPIO24)**: active high. What it shows is up to the firmware (link up, activity).
- **Flashing**: USB Serial/JTAG. If the app has disabled USB, hold BOOT and press RESET.

---

## 7. Open issues

### Critical

**C1 Antenna gain at 5GHz.** The FXP831 peak gain is 5.49dBi in free space and 7.24dBi on 2mm ABS
at 5GHz (TAO §2). The module was certified with ≤3.65dBi at 5GHz, and Espressif says a different
antenna may need extra EMC testing (MOD p.53). At 2.4GHz the FXP831 is 3.28dBi, inside the
3.86dBi limit. Decide whether to cap 5GHz TX power in firmware, restrict to 2.4GHz, or choose a
lower-gain dual-band antenna.

### Major

**M1 ESP-Hosted pin defaults.** CLK and HANDSHAKE must be set in the C5 firmware build (§6).
Otherwise the link will not come up.

**M2 Back-feed on USB-only power.** With the radio on USB and the controlboard unpowered, ESP
outputs (MISO, HANDSHAKE, DATA_READY) and the R1 EN pull-up can drive current into the
controlboard's STM32 pins. The chip datasheet gives no I/O injection limit. Firmware keeps those
pins Hi-Z while PWR_SRC_HOST is low (§6). Check the STM32H723 pin tolerance (DS13313 pin table)
for PB4, PB5, PB6 and PB7, and add series resistors if needed.

**M3 Footprints and MPNs.** Passives, SW1/SW2, D1, TP1/TP2 and U2/U3/U5/U6/D2/D4 still need
footprints. Capacitors need voltage and dielectric ratings.

**M4 Cable.** No premade 15-pin GH-to-GH cable was found at a distributor. Crimp or order a
custom harness; keep it short (EH ≤10cm for jumpers).

### Minor

- **m1** The Taoglas spec lists the connector both as "I-PEX MHF I (U.FL comp)" (p.1) and "IPEX
  MHFHT" (p.4). Confirm the ordered antenna has an MHF I plug before buying.
- **m2** USB inrush: C5 plus everything behind the LDO (C6, C8, C1, ...) exceeds the 10µF USB
  attach limit. Bench only.
- **m3** Module supply margin during TX is about 3.03V worst case from a 3.30V powerboard
  (ControlBoard2027 m3). Measure at C1 during 5GHz TX.
- **m4** The decoupling values from MOD Fig 9-2 and the XIAO were read from extracted text only.
  Check the figure before layout.
- **m5** Per HDG 1.3.13, USB D+ can toggle at power-up; no external pull-up is fitted. Revisit only
  if enumeration is unreliable.
- **m6** No test points on +3V3_HOST or +3V3.
