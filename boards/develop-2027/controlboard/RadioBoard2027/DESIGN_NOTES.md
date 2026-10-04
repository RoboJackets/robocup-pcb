# RadioBoard2027 Design Notes - Super Clauded. !!!NOT AUTHORITATIVE!!!

Why each part and value on the radio board was chosen, the firmware settings the hardware
depends on, and the open issues. Schematic notes point here by section number. The controlboard
side of the link is in `../ControlBoard2027/DESIGN_NOTES.md` §11.

2026-10-04 (BOM and sourcing): every part now has an MPN, a Digi-Key part number (Mouser for U1),
a Rating where it matters and a working datasheet link, and every line was in stock on the day
(§6 "BOM" has the table and the substitutions). SW1/SW2 changed to the Alps SKQGABE010, which moved
both switches 0.5mm west and GPIO28 1mm west (§7). C4 now carries the real DNP attribute. The
antenna is a BOM line (ANT1).

2026-10-04 (controlboard link): J2 is now a Samtec LSHM-110-02.5 mezzanine on the underside
instead of the JST GH cable header. ControlBoard2027 J9 is the same part, so the radio plugs
straight onto the controlboard (5mm stack) and hangs off its east edge, held only by J2. U5/U6
moved onto F.Cu directly above J2, and the SPI trunk was re-matched with new meanders (§5, §7).

**Contents**

1. [Sources](#1-sources)
2. [Power](#2-power)
3. [ESP32-C5 module](#3-esp32-c5-module)
4. [USB](#4-usb)
5. [Controlboard link](#5-controlboard-link)
6. [Firmware configuration](#6-firmware-configuration)
7. [Layout](#7-layout)
8. [Open issues](#8-open-issues)

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
| LSHM | Samtec LSHM product specification (suddendocs.samtec.com/productspecs/lshm.pdf) |
| TAO | Taoglas FXP831.07.0100C spec SPE-11-8-026-K |
| SKQG | Alps Alpine SKQG series (SKQGABE010) |
| Radio doc | 2027 Radio Module Design Doc (in `../`) |
| USB2 | USB 2.0 specification (usb.org `usb_20.pdf`), §7.1.1.1, §7.1.2.1, §7.1.6.1 |
| AN0046 | Silicon Labs AN0046 USB hardware design guidelines, §3.1, §3.3 |
| JLC | JLCPCB impedance page, stackup JLC04161H-7628 |

The Seeed XIAO ESP32-C5 project in `../daughterboard` was used as a cross-check for the USB-C,
EN and BOOT circuits.

The ESP32-C5-WROOM-1U is the only part not in the KiCad 10 standard library. Its symbol, footprint
and STEP model come from espressif/kicad-libraries 3.2.1 and live in `lib/` (the model in
`lib/RadioBoard2027.3dshapes`). All 32 pin numbers match MOD Table 3-2. Every other footprint is a
stock KiCad 10 footprint. `lib/` also holds `BOM_Item`, a pinless symbol for BOM-only lines (ANT1).

---

## 2. Power

The board runs from the controlboard's muxed +3V3 through the J2 mezzanine (net +3V3_HOST). USB-C can
power it alone for flashing and debugging.

| Rail | Source | Loads |
|---|---|---|
| +3V3_HOST | ControlBoard2027 +3V3 via J2 pins 2/4/6 | U3 VIN1 |
| VBUS | USB-C J1, after D2 and F1 | U4 |
| (U4 out) | AP7361C from VBUS | U3 VIN2 |
| +3V3 | U3 output | Module, LEDs, ESD rail |

- **U3 TPS2116**, priority mode (MODE tied to VIN1). The controlboard supply wins whenever it is
  present. The part blocks reverse current into an unused input (SLVSFG1A §7.3.4), so USB power
  never back-feeds the controlboard, and no diodes are needed.
- **PR1 divider R11 100k / R12 68k, ST pull-up R13 10k, hysteresis R14 1M.** These copy
  the ControlBoard2027 3V3 mux (U9 with R38/R39, R43 and R41), so both muxes switch at the same points: to USB below about 2.34V,
  back above about 2.57V (VREF 1.00V typ; ST is pulled up to +3V3, which equals VIN1 while VIN1 is
  selected, so R14 raises PR1 on the falling edge).
- **ST → GPIO9 (PWR_SRC_HOST).** High means the controlboard is powering the board. Firmware uses
  it to know whether a host is present (§6).
- **U4 AP7361C-33E-13**: 1A, 360mV dropout at 1A (DS37274). At a 403mA TX peak it drops
  (5.0 - 3.3) × 0.4 = 0.68W peak; the average is far lower.
- **Module supply**: 3.0-3.6V, supply ≥0.6A (MOD Table 6-2). Peak current is 313mA at 2.4GHz and
  403mA at 5GHz (MOD Tables 6-4, 6-5).
- **Capacitors**: C7 10µF at VIN1, C6 10µF at VIN2, C8 22µF + C9 100nF at VOUT. At the module,
  C1 22µF + C2 100nF (HDG 1.3.2 asks for at least 10µF).
- **D4 TVS0500** on +3V3_HOST at J2 (HDG 1.3.2: ESD diode at the power entrance). It sits on the
  underside next to J2, inline on the run from pins 2/4/6, so nothing comes between the
  connector and the protector.
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
- **C4 15pF** is a footprint only (DNP attribute set, so it is left out of the BOM and the
  placement file). HDG 1.3.9 asks for one but warns that fitting it can force download mode; the
  XIAO fits 15pF.

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
- **D2 TVS0500** on VBUS at J1, then **F1 MF-MSMF075/33X-2**: hold 0.75A (0.56A at 50°C), trip
  1.50A, 33V (MF-MSMF Rev BD). The module's 403mA peak sits under the hold current. /33X is the
  current Bourns part with the /16X ratings and the same 1812 land pattern.
- **C5 4.7µF** on VBUS/LDO input. The USB Device Capacitance ECN requires 1-10µF on VBUS.
- Auto-download over USB stops working if the application disables the USB PHY or reuses
  GPIO13/14 (HDG 1.5). The BOOT button is the fallback.

---

## 5. Controlboard link

### J2 connector
Samtec LSHM-110-02.5-L-DV-A-S-K-TR (Razor Beam, 0.5mm pitch, 2 x 10, shielded, SMD), on B.Cu.
The part is hermaphroditic: ControlBoard2027 J9 is the same part, and the two mate face to face
with a 5mm stack (2.5mm each). There is no cable. The radio board sits right side up above the
controlboard (ESP32 module facing up, J2 on its underside) and hangs off the controlboard's east
edge. J2 is the only support (no standoffs); see M4. J2 sits at (118.8, 150.2)mm, 0.8mm from the
board's vertical centreline, so the radio overhangs the controlboard evenly about its J9.

- **Why LSHM.** A true board-to-board connector replaces the cable. One part number on both boards,
  shield and alignment pegs, rated 2A per pin (one pin powered per row), 100 mating cycles, -55 to
  +125°C (LSHM §3). Digi-Key SAM14955CT-ND, 10,225 in stock on 2026-10-04.
- **Mating.** Face to face, pin p here meets controlboard pin p+1 (odd p) or p-1 (even p): the
  rows swap (Samtec LSHM mated drawing, Fig. 1). This board's odd row (south, toward the board
  edge) carries the signals and meets the controlboard's even row.
- **Mating check.** A script over both board files places this board on the controlboard as a
  rigid move (both boards right side up, so no mirror; it comes out as a 90° rotation) with J2's
  pins on J9's, and confirms that all 20 pads land on their partner pads with matching nets
  (EN on RST, +3V3_HOST on +3V3, GND on GND, each SPI and slow line on its own name), and that the
  two connectors' alignment pegs sit 0.85mm either side of the shared centreline as in the Samtec
  mated drawing.

| Pin | Net | Pin | Net |
|---|---|---|---|
| 1 | ESP_EN | 2 | +3V3_HOST |
| 3 | ESP_DATA_READY | 4 | +3V3_HOST |
| 5 | ESP_HANDSHAKE | 6 | +3V3_HOST |
| 7 | ESP_SPI_MISO | 8 | GND |
| 9 | GND | 10 | GND |
| 11 | ESP_SPI_SCK | 12 | GND |
| 13 | GND | 14 | GND |
| 15 | ESP_SPI_MOSI | 16 | GND |
| 17 | GND | 18 | GND |
| 19 | ESP_SPI_CS | 20 | GND |
| SH | GND | | |

- SCK, MOSI and CS have a GND pin on each side in their row and GND across the gap (the whole
  even row from pin 8 is GND). MISO has GND on one side and the slow lines on the other.
- CS is last in the row so it sits at the end of the controlboard's SPI group; the controlboard
  routes it across the other lines in one short B.Cu hop (ControlBoard2027 §11).
- Three +3V3_HOST pins carry the 403mA peak. LSHM is rated 2A per pin with one pin powered per
  row; about 0.13A per pin here leaves wide margin.

### ESD
- **U5 TPD4E05U06** on SCK, MOSI, MISO, CS and **U6** on HANDSHAKE, DATA_READY, EN, both right at
  J2. Each line runs flow-through: it enters pin 1/2/4/5 and leaves from the paired pass-through
  pin (10/9/7/6). The pass-through pins are NC pads that only carry the trace across the part. The
  schematic uses the project symbol `TPD4E05U06DQA_FlowThru`, which draws each protected pin on the
  left and its pass-through pin opposite it on the right, so the sheet reads like the layout.
- U6 channel D2- (pins 5/6) is unused and left open (no-connect on the sheet).
- The module is rated HBM ±2kV / CDM ±500V (MOD §12), and the connector is handled when the boards
  are plugged together.

### Pulls
The controlboard holds CS up (R29 10k) and HANDSHAKE/DATA_READY down (R31 100k, R32 10k). This board
adds no pulls on those lines.

- Once running, the ESP-Hosted firmware enables its own internal pulls: pull-up on MOSI/SCLK/CS,
  pull-down on MISO/HS/DR (EH `spi_slave_api.c`).
- During reset and ROM boot those pins float, apart from GPIO4, which has a weak internal pull-up
  (CHIP Table 2-1). Against the controlboard's R32 10k pull-down it sits at about 0.6V, a defined
  low (the STM32 reads anything above 1.80V as high, DS13313 Table 51; R32 was 100k, which gave
  2.28V and read high). The host still ignores HANDSHAKE/DATA_READY for 500ms after it releases
  EN (§6).

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

### BOM (Digi-Key, stock checked 2026-10-04)

Order files: `RadioBoard2027_BOM_digikey.csv`, `RadioBoard2027_BOM_mouser.csv` (U1) and
`RadioBoard2027_BOM_full.csv` (both), grouped by MPN. Fields: `MPN`, `Vendor PN` (Digi-Key cut
tape), `Rating`, `Datasheet`; `LCSC` is kept only where the part is unchanged from the JLC BOM.
Stock was read live from the Digi-Key and Mouser product pages. "Sufficient" means at least 1,000
in stock and 50 boards' worth for passives, at least 200 and 50 boards for everything else; every
line passes. Re-check in the distributor's BOM tool before ordering.

Passives are 0402 except where 0402 lacks the rating: 22µF uses 0805, 10µF uses 0603 10V (about
6µF at 3.3V), 4.7µF on VBUS uses 0805 25V (about 3.7µF at 5V). DC-bias figures are typical X5R
estimates, not part-specific curves.

| Ref | Value | Package | MPN | Digi-Key | Stock |
|---|---|---|---|---|---|
| C1, C8 | 22µF 16V X5R | 0805 | Samsung CL21A226MOQNNNE | 1276-2909-1-ND | 119,157 |
| C2, C9 | 100nF 16V X7R | 0402 | Samsung CL05B104KO5NNNC | 1276-1001-1-ND | 5,247 |
| C3 | 1µF 25V X5R | 0402 | Samsung CL05A105KA5NQNC | 1276-1445-1-ND | 2,262,582 |
| C4 (DNP) | 15pF 50V C0G | 0402 | Murata GRM1555C1H150JA01D | 490-5888-1-ND | 237,905 |
| C5 | 4.7µF 25V X5R | 0805 | TDK C2012X5R1E475K125AB | 445-4116-1-ND | 1,641,511 |
| C6, C7 | 10µF 10V X5R | 0603 | Taiyo Yuden LMK107BBJ106MALT | 587-3258-1-ND | 142,035 |
| R1, R3, R13 | 10k 1% | 0402 | Yageo RC0402FR-0710KL | 311-10.0KLRCT-ND | 4,970,953 |
| R2 | 470 1% | 0402 | Yageo RC0402FR-07470RL | 311-470LRCT-ND | 572,399 |
| R4 | 33 1% | 0402 | Yageo RC0402FR-0733RL | 311-33.0LRCT-ND | 411,334 |
| R5, R6 | 22 1% | 0402 | Yageo RC0402FR-0722RL | 311-22.0LRCT-ND | 4,569,590 |
| R7 | 499 1% | 0402 | Yageo RC0402FR-07499RL | 311-499LRCT-ND | 8,153 |
| R8, R15 | 1.5k 1% | 0402 | Panasonic ERJ-2RKF1501X | P1.50KLCT-ND | 1,151,694 |
| R9, R10 | 5.1k 1% | 0402 | Yageo RC0402FR-075K1L | 311-5.10KLRCT-ND | 927,907 |
| R11 | 100k 1% | 0402 | Yageo RC0402FR-07100KL | 311-100KLRCT-ND | 5,935,716 |
| R12 | 68k 1% | 0402 | Yageo RC0402FR-0768KL | 311-68.0KLRCT-ND | 486,607 |
| R14 | 1M 1% | 0402 | Yageo RC0402FR-071ML | 311-1.00MLRCT-ND | 1,093,833 |
| D1 | Green | 0603 | Kingbright APT1608SGC | 754-1121-1-ND | 1,767,781 |
| D3 | Red | 0603 | Kingbright APT1608EC | 754-1117-1-ND | 210,662 |
| D2, D4 | TVS0500DRVR | WSON-6 | TI | 296-48382-1-ND | 37,002 |
| F1 | MF-MSMF075/33X-2 | 1812 | Bourns | 118-MF-MSMF075/33X-2CT-ND | 2,301 |
| J1 | USB4110-GF-A | SMD | GCT | 2073-USB4110-GF-A-1-ND | 142,346 |
| J2 | LSHM-110-02.5-L-DV-A-S-K-TR | SMD | Samtec | SAM14955CT-ND | 10,225 |
| SW1, SW2 | Tactile 5.2×5.2 | SMD | Alps Alpine SKQGABE010 | 4809-SKQGABE010CT-ND | 43,903 |
| U1 | ESP32-C5-WROOM-1U-N8R8 | module | Espressif | Mouser 356-ESP32C5WRM1UN8R8 | 1,458 (14,950 on order) |
| U2 | USBLC6-2SC6 | SOT-23-6 | ST | 497-5235-1-ND | 147,782 |
| U3 | TPS2116DRLR | SOT-583 | TI | 296-TPS2116DRLRCT-ND | 87,169 |
| U4 | AP7361C-33E-13 | SOT-223 | Diodes | AP7361C-33E-13DICT-ND | 2,375 |
| U5, U6 | TPD4E05U06DQAR | USON-10 | TI | 296-35765-1-ND | 340,367 |
| ANT1 (BOM only) | FXP831.07.0100C | cable antenna | Taoglas | 931-1121-ND | 8,746 |
| TP1, TP2 | pad | - | - | excluded from the BOM | - |

Changes from the 2026-09-14 JLC BOM (price at qty 1 where it changed the choice):
- **C1, C8** Samsung CL21A226MAQNNNE (22µF 25V) is obsolete at Digi-Key and every other 22µF 25V
  0805 (Murata GRM21BR61E226ME44L, Taiyo Yuden TMK212BBJ226MG-T, TDK C2012X5R1E226M125AC, Samsung
  CL21A226MAYNNNE) had 0 stock. Now the 16V part also used on ControlBoard2027. Both sit on 3.3V,
  so 16V is still about 5× the rail; a 16V part keeps somewhat less capacitance under bias than
  the 25V one, but well over the 10µF HDG 1.3.2 asks for at the module.
- **C5** Samsung CL21A475KAQNNNE: 0 stock. TDK C2012X5R1E475K125AB, same 4.7µF 25V X5R 0805, $0.28.
- **C6, C7** Samsung CL10A106KP8NNNC: 0 stock. Taiyo Yuden LMK107BBJ106MALT (same as ControlBoard2027).
- **C4** FH (LCSC only) → Murata GRM1555C1H150JA01D, same 15pF C0G 0402. DNP anyway.
- **Resistors** UniOhm is not sold by Digi-Key; Yageo RC0402FR 1% parts replace them (R4/R5/R6 go
  from 5% to 1%). The Yageo 1.5k was out of stock, so R8/R15 are Panasonic ERJ-2RKF1501X ($0.10).
- **D1** NationStar (LCSC only) → Kingbright APT1608SGC green, same 0603. VF 2.2V typ, so R8 gives
  0.73mA.
- **SW1, SW2** XKB TS-1187A (LCSC only) → Alps SKQGABE010, $0.31. The C&K PTS526 was cheaper
  ($0.16) but its land-pattern drawing could not be retrieved to check against the board, so the
  SKQG with its KiCad footprint (`Button_Switch_SMD:SW_SPST_SKQG_WithStem`) was used. Same
  numbering (1,1 / 2,2), pads 1.8 × 1.1mm at ±3.1, ±1.85mm against the TS-1187A's 1.0 × 0.75mm
  at ±3.0, ±1.875mm.
- **U1** has 0 stock at Digi-Key in any C5-WROOM-1U variant; Mouser has the same N8R8 part (M3).
- **ANT1** The Taoglas antenna was named in the notes but not in the BOM; it is now a BOM-only
  line.


---

## 7. Layout

36 × 54mm, 4 layers, JLC04161H-7628 stackup. Every part is on the top side except J2 and D4, which
are on the bottom: order bottom-side assembly for those two (J2's shield pins are paste-in-hole),
or hand-solder them after top-side assembly with paste and hot air.

| Layer | Use |
|---|---|
| F.Cu | Parts (all but J2), U5/U6 fan-out, USB pair, power traces, GND pour |
| In1.Cu | Solid GND |
| In2.Cu | +3V3 plane, plus a GND region (priority 1) under the B.Cu SPI corridor. No signals. |
| B.Cu | J2 and D4 (the only bottom parts); SPI trunk (SCK, MOSI, MISO, CS) over the In2 GND region; HANDSHAKE, DATA_READY, EN, PWR_SRC_HOST, CC2 and short power jumps; GND pour |

- **Rules.** Default netclass: 0.2mm track, 0.15mm clearance, 0.6/0.3mm vias (0.5/0.3mm is the
  board minimum, used at J2). Netclass clearance
  overrides a lower custom rule, so the 0.15mm default must stay in Board Setup.
  `RadioBoard2027.kicad_dru` adds:
  - power nets (+3V3, +3V3_HOST, VBUS, VIN2, pre-fuse VBUS): 0.2mm clearance, 0.25mm minimum width;
  - USB (both sides of U2 and R5/R6): 0.25mm width (0.2mm minimum), 0.15mm diff-pair gap where
    coupled, and 0.5mm (2W) from pours on the outer layers;
  - SPI (`*/ESP_SPI_*` and `Net-(U1-GPIO2)`, MISO after R4): 0.36mm width (0.2mm minimum, for the U5
    pads), and 0.72mm (2W) from pours on the outer layers, so the pours do not turn the lines into an
    uncalculated coplanar guide.

  - link vias (`/Controlboard Link/*`) to inner-layer zones: 0.1mm clearance and 0.2mm hole
    clearance, inner layers only. The row-gap vias and the vias after U5 sit 1.0mm apart; at the
    default 0.2mm/0.25mm their plane openings merged into a slot on In1/In2 (found by the audit).

  The pour-clearance rules carry `(layer outer)`. Without it the rule also applied between SPI vias
  and the inner GND planes, and cut 1mm holes into the very reference planes the lines need (found
  by the second audit).

  KiCad expressions have no `matches` operator; `A.NetName == '*/ESP_SPI_*'` matches by wildcard.
  Net names carry their sheet path (for example `/Controlboard Link/ESP_SPI_SCK`, `/ESP32-C5/USB_DP`)
  because signals cross sheets through hierarchical sheet pins. A deliberately violated test rule
  (5mm minimum width on the SPI and USB nets) fired 106 times, which proves the file compiles.
- **USB.** J1 → U2 → R5/R6 → module pins 13/14, running north from the J1 contacts in one
  direction with no detour. 0.25mm lines on F.Cu over In1 GND, no vias in the pair.
  - The duplicate contacts are joined at J1: D+ (A6/B6) with a 2.5mm jog under the shell, D-
    (A7/B7) with a jog of about 1mm beside the contacts.
  - U2 (USBLC6, rotated 90°) sits directly north of the contacts, so the pair runs straight
    through its pass-through pins. Its pinout puts the GND pin between the two I/O pins, so the
    lines are 1.9mm apart through U2 instead of edge-coupled. That is fine at Full-Speed (below).
  - U2 rail pin: one via to the In2 +3V3 plane. U2 GND pin: its own via.
  - R5/R6 stand vertically beside module pins 13/14. D- reaches R5 from the south-east on one 45°
    run; D+ comes in from the east along the bottom of the module. Each leaves with one 45° bend
    into its module pin.
  - CC1 and the A4/B9 VBUS contacts sit in the pair's path, so each drops through a via right at
    the contact.
    - CC1 runs on B.Cu to R9, which now sits east of the pair.
    - VBUS A4/B9 joins the A9/B4 pad on B.Cu at J1, on the connector side of D2.
- **J2 escape.** J2's signal row faces the board edge, and the shield pads and alignment holes
  close both ends of the 2.2mm gap between its rows, so no line can leave J2 on B.Cu. Each line
  runs 1.2-2.45mm from its pad into the gap and takes one 0.5/0.3mm via up to F.Cu: two via rows,
  A (y 149.6mm: DATA_READY, MISO, SCK, MOSI, CS) and B (y 150.85mm: EN, HANDSHAKE and three GND
  vias for south-row GND pins 9/13/17), alternating column by column so each line passes between
  two vias of the other row. The B-row GND vias sit 1.35mm from each SPI via. The north-row GND
  pins are tied by a short trace and a via east of the row; +3V3_HOST pins 2/4/6 are tied the same
  way and run 0.3mm wide west on B.Cu straight into D4, then through a via to F.Cu.
- **SPI.** Channel via → U5 on F.Cu: each line enters U5 pin 1/2/4/5 and leaves from the
  pass-through pin, then takes one via to B.Cu 1.0-2.2mm past U5 and runs west on B.Cu. The four
  lines nest (CS outermost) so they reach the trunk in order without crossing.
  - **Trunk.** Runs on B.Cu down the left board edge to vias beside the module pins, then returns
    to F.Cu for the last 1.5-1.8mm. The lanes are 1.1-1.2mm apart (3W centre to centre or more).
  - **Reference.** On In2, a priority-1 GND region (`GND_In2_SPI`) covers the whole B.Cu corridor,
    from the J2 gap to the module, so the B.Cu lines have a GND reference 0.21mm away instead of
    the +3V3 plane. In1 stays solid GND under the F.Cu parts.
  - **Width.** 0.36mm on the B.Cu lanes and trunk; 0.2mm from J2 through U5 to the via after it
    (4.9-6.1mm per line), where the lines pass between vias and pads at 0.5mm pitch.
  - **Edge distances (measured on the fill).** MISO's centre is 1.1mm from the GND fill edge and
    its trace edge is 1.45mm from the board edge.
  - **CS jog.** CS jogs east above J1's locating pegs, so MOSI has room for its meander in the
    trunk.
- **Slow lines.** HANDSHAKE, DATA_READY and EN go channel via → U6 (flow-through) on F.Cu, north
  out of U6, then east on F.Cu (y 143.3/144.0/144.7mm) to one via each into the B.Cu lanes along the
  right edge, and back to F.Cu at the module end. They cross the SPI lines only on the other layer.
  - They sit over the In2 +3V3 plane, which is acceptable for interrupt and reset lines.
    HANDSHAKE crosses the edge of the In2 GND region near the module.
  - PWR_SRC_HOST runs on B.Cu under the module.
  - CC1 and CC2 each hop to B.Cu once.
- **Stitching and ESD ground.** Every SPI layer change has a GND via nearby:
  - at J2, the three B-row GND vias, 1.35mm from the channel vias;
  - after U5, GND vias at (118.8, 145.35) (0.65mm from the SCK via), (121.95, 146.3) and
    (121.8, 147.85) (1.0mm from CS), and U6's GND via; MISO's nearest is 1.6mm away and MOSI's
    1.9mm;
  - two at the module end, 1.7-2.5mm away. There is no room for closer ones between the B.Cu lines
    and R5/R6. Both reference planes there are GND (In2 region to In1), so the return only crosses
    between two GND planes.

  U5's GND pins run straight down to the B-row GND via under J2 pin 13 (2.4mm), so ESD current
  returns to the connector ground by the shortest path. U6's GND pins have their own via just
  below the part. D4's GND pins are tied and go to their own via; its thermal pad joins the
  B.Cu pour. Two GND vias at (130.25, 145.1) and (132.0, 144.0) stitch beside the slow-line vias. R12's GND via moved to
  (122.01, 142.75) to clear the slow lines.

  GND stitching: six extra vias (129.8/103.0, 133.8/115.3, 133.8/120.25, 133.8/123.3, 103.0/146.2,
  107.4/145.9) fill the right side and lower left. The rest of the module area cannot take vias (the
  module body and its EPAD grid), so parts of the F.Cu pour remain more than 5mm from a via.
- **Power.** VBUS: J1 → D2 → F1 → C5 → U4 on F.Cu. The A4/B9 contact pair joins the A9/B4 pad
  through one B.Cu jumper at the connector, because the USB pair runs between them; the plug also
  bonds all VBUS contacts. U4 VOUT → C6 → U3 VIN2 on F.Cu.
  +3V3_HOST: J2 → D4 (both B.Cu) → via → 0.5mm F.Cu → C7/R11 → U3 VIN1. U3 OUT feeds the In2 +3V3 pour through vias at U3, C8 and
  C9. The module takes +3V3 from C2/C1 at pin 2, with a via into In2. U4 tab has three GND vias
  to In1 for about 0.85W at 500mA from 5V.
- **Module.** Nine GND vias in the EPAD grid. U1 is placed so its U.FL connector (top-right corner
  of the module, next to pads 27/28, MOD Fig 3-2 and 10-2) sits about 2.4mm from the top board
  edge; the cable leaves over the edge. The connector is on the module itself, so the HDG advice to
  clear all layers under an IPEX connector (which applies to a chip-down design) does not apply.
- **Corners.** Every segment is at a multiple of 45° (checked by script, tolerance 0.2°). The 2026-10-04
  audit found older T-joins away from pads outside the link (U3_PR1 at 120.5/141.8, PWR_SRC_HOST
  at 124.5/141.8, GPIO28 at 128.2/122.3, VBUS at 117.14/127.35, +3V3 at 122.5/138.25, GND at
  108.05/102.4, an EN via mid-segment at 107.3/105.83) and width steps on +3V3_HOST (111.39/143.5
  and 145.9, 121.15/138.75), Net-(U3-VIN2) and Net-(D2-IN-Pad4). They are on slow and power nets
  and are listed in TODO for clean-up.
- **Silkscreen.** Every reference sits outside all courtyards, pads and vias, inside the board
  edge. C1, C2, R5, R6, R7, R9, R10, R13 and U5 use 0.8mm text to fit; the rest are 1.0mm. Board
  Setup silk clearance is 0.1mm. Parts a user touches carry their function instead of their
  reference on the silkscreen (the reference stays on the fab layer): RESET (SW1), BOOT (SW2), STAT
  (D1), PWR (D3), TX (TP1), RX (TP2). The back carries "RadioBoard2027 rev A" along the top
  edge and the J2 reference. J2 has no per-pin labels: it is a 0.5mm-pitch mezzanine hidden
  under the controlboard when mated; the footprint's pin-1 mark sets the orientation.
- **J1 shield.** The four shell pads are not routed; the metal shell joins them. The shield is not
  tied to GND (§4).
- **SW1/SW2 (2026-10-04).** The SKQG pads are wider than the TS-1187A's, so both switches moved
  0.5mm west (x = 131.5mm) to keep their pads 0.5mm from the right board edge, and the GPIO28 trace
  that runs past them moved from x = 128.2 to 127.2mm: it leaves the R3/C4 branch at 128.2mm,
  steps west with a 45° jog just below the U1 courtyard, passes 0.2mm from the switch pads and
  0.2mm from the GND stitching vias, and returns to SW2's pads with a 45° jog.
- **Mounting holes.** H1-H4 are board-only footprints (not in the schematic, BOM or placement
  file).
- **Footprints.** Every footprint matches its library copy. The update also marked the parts SMD
  for the placement file and gave the D2/D4 thermal pads the library's solid, heatsink setting.
- **DRC.** 0 errors, 0 warnings, 0 unconnected, schematic parity clean. Zones were refilled on the
  saved board, and the custom rules were proven to compile.

### Known deviations (audit 2026-10-03)

An independent audit checked the board against the repo layout rules. These items are accepted, each
for the reason given:

- **USB pair not coupled.** The pair is 1.9mm apart from J1 through U2, because the USBLC6 puts its
  GND pin (with its via) between the I/O pins, and 1.9-2.7mm apart from U2 to R5/R6. Skew is
  1.4-4.7mm. Full-Speed edges are 4-20ns, so a
  few mm of uncoupled pair is electrically short.
- **D+ jog at J1.** The jog under the shell is 0.2mm wide, against 0.25mm elsewhere, to keep
  clearance to the A7 pad.
- **VBUS via before D2.** The A4/B9 VBUS contacts reach D2 through a B.Cu jumper that lands on the
  A9/B4 pad at the connector. The USB pair runs between the two contact groups, so no F.Cu path
  exists.
- **Via before the ESD parts.** Every link line takes one via between J2 and U5/U6 (CLAUDE.md §8
  asks for none). J2 is on B.Cu, its signal row faces the edge, and the shield pads and pegs close
  the row gap, so there is no B.Cu path out; U5/U6 cannot sit in the gap. The via is 0.5-2.5mm
  from the J2 pad centre (1.2-2.45mm), with no branch, and the protector input follows 0.5-4.5mm later.
- **SPI neck at J2 and U5.** The SPI lines run 4.9-6.1mm at 0.2mm (about 68Ω) from J2 through U5
  to the via after it. They pass between vias and pads at 0.5mm pitch there, several at exactly
  the 0.15mm clearance.
- **Meander position.** The meanders sit mid-trunk, not at the source end. The lanes are
  1.1mm apart and only an outer lane has room for a bump.
- **Module-end return vias.** These are 1.7-2.5mm from the signal vias. Both planes are GND.
- **MISO/MOSI return vias.** The nearest GND via to the MISO and MOSI vias after U5 is 1.6mm and
  1.9mm away; the B.Cu lanes leave no room for closer ones.
- **No support but J2.** The radio hangs off the controlboard on J2 alone (M4).
- **Slow lines.** HANDSHAKE, DATA_READY, EN, PWR_SRC_HOST and CC1/CC2 run over the +3V3 plane or
  cross the edge of the In2 GND region. They are interrupts, reset, a power-source flag and the CC
  pull-downs.
- **MISO not matched.** See SPI length below.
- **Placement-level items (second audit, not changed).** USB (J1, left edge) and RESET/BOOT (right
  edge) are on different edges; the SPI trunk runs under J1 and the VBUS entry on B.Cu (over the
  In2 GND region); there is no GND test point next to TX/RX. Fixing these means re-placing J1,
  SW1/SW2 and the USB block, which changes the board's user interface; left for a decision.

### Impedance and length (as routed)

Impedance is from a 2D field solver on the JLC stackup (7628 prepreg 0.2104mm, εr 4.4; core
1.065mm, εr 4.6; 1oz outer, 0.5oz inner; mask 1.2mil, εr 3.8). The solver was checked against the
exact stripline formula (47.1 vs 47.9Ω) and a w = h microstrip (70 vs 71Ω).

| Trace | Width / gap | Impedance |
|---|---|---|
| USB pair, F.Cu | 0.25mm; mostly uncoupled (0.25mm edge gap for about 2mm, 1.9-2.7mm apart elsewhere) | about 60Ω per line, 120-130Ω differential where uncoupled |
| SPI, F.Cu over In1 / B.Cu over In2 GND | 0.36mm | about 50Ω (closed-form microstrip estimate, h = 0.21mm) |
| SPI from J2 through the USON pads | 0.2mm | 68Ω, 4.9-6.1mm per line |

- **USB requirement.** The C5 USB is Full-Speed only, 12 Mbit/s (MOD §5.2.1.5). USB2 requires
  90Ω ±15% (§7.1.1.1, §7.1.6.1) with 4-20ns edges (§7.1.2.1). HDG §1.4.8 asks for 90Ω ±10%, in
  parallel at equal length, with no number for skew. The pair does not meet 90Ω: the U2 pinout
  (GND pin between the I/O pins) and the R5/R6 placement keep the lines 1.9-2.7mm apart for most of
  their 15-19mm. At Full-Speed the 4-20ns edges are 0.6-3m long on the board, so a 2cm section of
  wrong impedance causes no visible reflection; this is a known deviation (below).
- **USB length.** Lengths depend on which contact row the plug uses.

  | Section | D+ | D- |
  |---|---|---|
  | J1 → U2 | 8.4 or 10.9mm | 6.0 or 6.8mm |
  | U2 → R5/R6 | 6.4mm | 4.6mm |
  | R → module | 1.9mm | 3.9mm |
  | Total | 16.7-19.2mm | 14.5-15.3mm |

  The pair is 6-8mm shorter than before. Skew is 1.4-4.7mm, at most about 29ps. AN0046 §3.3
  allows up to 400ps (60mm) for Full-Speed; the 50 mil figure in many layout guides is for
  High-Speed parts.
- **SPI length.** J2 pad → module pin, counting 1.6mm per via (three each): SCK 63.47mm,
  MOSI 63.22mm, CS 63.56mm. The controlboard adds SCK 52.00, MOSI 52.25, CS 51.74mm (pin to pad,
  no stubs), so the full STM32-to-ESP32 paths are SCK 115.47, MOSI 115.47, CS 115.30mm (0.17mm
  spread). Measured by script
  over the board files.
  - **Meanders.** CS carries chamfered meanders on B.Cu (legs out from the lane with 0.3mm 45°
    corners), 5 bumps at 1.08mm (3W) with legs 1.44mm (4W) apart: two on the J2-side lane, three in
    the trunk. MOSI has 2 plain 45° trapezoids, 1.01mm high with 1.44mm tops and gaps. CS's module pin is about 5mm
    closer than SCK's along the trunk, which is why it needs the most.
  - **MISO.** 67.2mm to R4, plus R4 (1.02mm span) and 1.8mm to module pad 4: 70.0mm, 6.5mm longer
    than SCK, not matched. The module drives it back towards the host, and the host samples it a
    half clock after launching SCK, so the extra 6.5mm (about 45ps) is small against the 12.5ns
    half period at 40MHz. The R4-to-module run (`Net-(U1-GPIO2)`) is 0.2mm wide.
  - **Slow lines.** DATA_READY 56.4mm, HANDSHAKE 82.3mm, EN 94.5mm.
- **SPI impedance.** HDG and EH give no impedance for SPI. About 50Ω, with 5-6mm at 68Ω through
  J2 and the ESD pads, is fine at the planned 10-40MHz. R4 33Ω source-terminates MISO at the module. Bring the link up at 10MHz
  first (§6).

---

## 8. Open issues

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

**M3 Module sourcing.** Digi-Key has no ESP32-C5-WROOM-1U in stock; Mouser has the N8R8
(356-ESP32C5WRM1UN8R8, 1,458 in stock on 2026-10-04, $6.52). Order U1 from Mouser.

**M4 Mechanical support.** The radio hangs off the controlboard's east edge on J2 alone: no
standoffs, no screws. LSHM holds by friction and its alignment pegs (no latch), and is rated for
100 mating cycles. Robot impacts load the connector's solder joints. Check retention on the first
assembly; if the board works loose, add a strap or a bracket to the chassis rather than a screw
through the controlboard.

The radio also overhangs the top 2.7mm of the controlboard's microSD card (J1) where it sticks out
of the east edge, 5mm above it. Nothing touches (the socket is 1.3mm tall); the card is pushed and
pulled from the 8mm of its width that stays uncovered. This board's H4 lands over that socket, so
no standoff can go in H4 while mated. Moving J2 back 3.5mm to the right would
clear the card, at the cost of an off-centre radio.

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
- **m7** Closed 2026-10-03: all footprints updated from their libraries; DRC shows no
  lib_footprint_mismatch.
