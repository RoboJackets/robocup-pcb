# RadioBoard2027 rev B Design Notes (mates ControlBoard2027_6L and ControlBoard2027_4L) - Super Clauded. !!!NOT AUTHORITATIVE!!!
> **Superseded as the reference by `../../prototype/docs/RadioBoard2027_SPEC.md` (prototype) (2026-10-13).** The schematic is the ground truth and the spec describes the board as ordered. This file keeps the design reasoning and history; statements found stale in the 2026-10-13 audit are listed in `../../prototype/docs/AUDIT_2026-10-13.md` §4.

Why each part and value on the radio board was chosen, the firmware settings the hardware
depends on, and the open issues. Schematic notes point here by section number. The controlboard
side of the link is in `../../prototype/ControlBoard2027/DESIGN_NOTES.md` §11 (prototype).

2026-10-04 (BOM and sourcing): every part now has an MPN, a Digi-Key part number (Mouser for U1),
a Rating where it matters and a working datasheet link, and every line was in stock on the day
(§6 "BOM" has the table and the substitutions). SW1/SW2 changed to the Alps SKQGABE010, which moved
both switches 0.5mm west and GPIO28 1mm west (§7). C4 now carries the real DNP attribute. The
antenna is a BOM line (ANT1).

2026-11-03 (JLCPCB assembly BOM): the board is now assembled by JLCPCB. Every part stocked
there carries an `LCSC` part number and `LCSC MPN`; the Digi-Key/Mouser part stays in `MPN` /
`Vendor PN` as the alternate. Substitutes (C1, C5-C8 makers, UNI-ROYAL resistors) drop into the
existing footprints, so the PCB did not change. U1, U4, J2 and ANT1 still come from Mouser or
Digi-Key (§6 "BOM").

2026-10-04 (controlboard link): J2 is now a Samtec LSHM-110-02.5 mezzanine on the underside
instead of the JST GH cable header. ControlBoard2027 J9 is the same part, so the radio plugs
straight onto the controlboard (5mm stack) and hangs off its east edge, held only by J2. U5/U6
moved onto F.Cu directly above J2, and the SPI trunk was re-matched with new meanders (§5, §7).

2026-11-04 (rev B, for the 6-layer and 4-layer controlboards): the board was re-laid out to sit on the 6-layer controlboard. It is
54 × 36mm landscape, with H1-H4 on the controlboard's H5-H8 and J2 on J9. The circuit and its topology are
the prototype's. Schematic changes:
- U5 channel order (pin 1 MOSI, 2 MISO, 4 SCK, 5 CS) to follow the J2 pins;
- HANDSHAKE moved to GPIO0 (pad 6) and DATA_READY to GPIO3 (pad 5), GPIO4 unused, so both land on
  the module's east pad column (firmware: §6).

Layout and lengths: §7. Sections 1-6 and 8 still carry the prototype's reasoning; where they disagree
with §7 or the rev B schematic, those win.

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
| HANDSHAKE | 0 | 6 | free P2 pin (32k crystal pin, unused as such); rev B |
| DATA_READY | 3 | 5 | strapping pin (MTDI, SDIO edge only); rev B |
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
  no-restriction P2 pin (CHIP §2.3.5); GPIO1 (32k crystal), 4, 8 and 23 are the other free P2
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
The part is hermaphroditic: the controlboard's J9 (ControlBoard2027_6L or _4L) is the same part, and the two mate face to face
with a 5mm stack (2.5mm each). There is no cable. The radio board sits right side up above the
controlboard (ESP32 module facing up, J2 on its underside) on four M2.5 × 5mm standoffs (H1-H4 here,
controlboard H5-H8). J2 sits at (53.0, 25.6)mm, directly on J9 (rev B layout, §7).

- **Why LSHM.** A true board-to-board connector replaces the cable. One part number on both boards,
  shield and alignment pegs, rated 2A per pin (one pin powered per row), 100 mating cycles, -55 to
  +125°C (LSHM §3). Digi-Key SAM14955CT-ND, 10,225 in stock on 2026-10-04.
- **Mating.** Face to face, pin p here meets controlboard pin p+1 (odd p) or p-1 (even p): the
  rows swap (Samtec LSHM mated drawing, Fig. 1). This board's odd row (south, toward the board's
  interior in rev B) carries the signals and meets the controlboard's even row.
- **Mating check.** A script over both board files places this board on the controlboard as a
  rigid move (both boards right side up, so no mirror; in rev B it is a pure overlay, 0°) with J2's
  pins on J9's, and confirms that all 20 pads land on their partner pads with matching nets
  (EN on RST, +3V3_HOST on +3V3, GND on GND, each SPI and slow line on its own name), and that the
  two connectors' alignment pegs sit 0.85mm either side of the shared centreline as in the Samtec
  mated drawing.

| Pin | Net | Pin | Net |
|---|---|---|---|
| 1 | ESP_EN | 2 | +3V3_HOST |
| 3 | ESP_DATA_READY | 4 | +3V3_HOST |
| 5 | ESP_HANDSHAKE | 6 | +3V3_HOST |
| 7 | ESP_SPI_MOSI | 8 | GND |
| 9 | GND | 10 | GND |
| 11 | ESP_SPI_MISO | 12 | GND |
| 13 | GND | 14 | GND |
| 15 | ESP_SPI_SCK | 16 | GND |
| 17 | GND | 18 | GND |
| 19 | ESP_SPI_CS | 20 | GND |
| SH | GND | | |

- MISO, SCK and CS have a GND pin on each side in their row and GND across the gap (the whole
  even row from pin 8 is GND). MOSI has GND on one side and the slow lines on the other
  (controlboard pin order, followed here).
- CS is last in the row, at the end of the controlboard's SPI group (controlboard design notes).
- Three +3V3_HOST pins carry the 403mA peak. LSHM is rated 2A per pin with one pin powered per
  row; about 0.13A per pin here leaves wide margin.

### ESD
- **U5 TPD4E05U06** on MOSI, MISO, SCK, CS (pins 1/2/4/5 in J2 order, rev B) and **U6** on EN,
  DATA_READY, HANDSHAKE, both on B.Cu right below J2's signal row. Each line runs flow-through: it enters pin 1/2/4/5 and leaves from the paired pass-through
  pin (10/9/7/6). The pass-through pins are NC pads that only carry the trace across the part. The
  schematic uses the project symbol `TPD4E05U06DQA_FlowThru`, which draws each protected pin on the
  left and its pass-through pin opposite it on the right, so the sheet reads like the layout.
- U6 channel D2- (pins 5/6) is unused and left open (no-connect on the sheet).
- The module is rated HBM ±2kV / CDM ±500V (MOD §12), and the connector is handled when the boards
  are plugged together.

### Pulls
All link pulls are on this board (moved from the prototype controlboard): R18 10k holds CS up (to +3V3_HOST), R16 100k holds
HANDSHAKE down and R17 10k holds DATA_READY down. The controlboard has none.

- Once running, the ESP-Hosted firmware enables its own internal pulls: pull-up on MOSI/SCLK/CS,
  pull-down on MISO/HS/DR (EH `spi_slave_api.c`).
- During reset and ROM boot those pins float. In rev B, DATA_READY is GPIO3 (no internal pull at reset) and
  HANDSHAKE is GPIO0, so R17/R16 hold both firmly low (the GPIO4 weak pull-up of the prototype, which
  needed a 10k pull-down to read low, is no longer on the line). The host still ignores
  HANDSHAKE/DATA_READY for 500ms after it releases EN (§6).

---

## 6. Firmware configuration

- **ESP-Hosted co-processor**: SPI full duplex, SPI mode 3 (mode 0 is not supported on the slave,
  EH `spi_slave_api.c`). Set CLK = GPIO6, MOSI = GPIO7, MISO = GPIO2, CS = GPIO10,
  HANDSHAKE = GPIO0, DATA_READY = GPIO3 (rev B), reset = EN in menuconfig. The C5 defaults for CLK and
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

### BOM: JLCPCB assembly (stock checked 2026-11-03)

The board is assembled by JLCPCB, so parts come from the JLCPCB parts library (LCSC stock)
first. Stock and library type were read live from the JLCPCB parts API on 2026-11-03.
"Sufficient" means at least 50 board sets' worth, and at least 1,000 for passives. Substitutes
keep the value, package and tolerance, have an equal or higher voltage rating and the same
dielectric, and fit the existing footprint; the PCB did not change. Re-check stock in the
JLCPCB BOM tool before ordering.

Fields: `LCSC` (LCSC/JLCPCB part number, read by the JLCPCB KiCad tools), `LCSC MPN` (maker and
part number of that part), `LCSC Datasheet` (datasheet of the placed part, only where it differs
from `MPN`), `MPN` and `Vendor PN` (the Digi-Key part, Mouser for U1, kept as the alternate),
`Rating` (the minimum the circuit needs; the placed part meets or exceeds it, for example C1/C8
are 25V parts on a 16V rating), `Datasheet`. `LCSC` is empty for parts not bought from LCSC.

Order files, regenerated from the schematic:
- `RadioBoard2027_BOM_jlcpcb.csv`: JLCPCB assembly upload (Comment, Designator, Footprint,
  LCSC Part #). 24 lines, 35 placements: 13 Basic and 11 Extended parts.
- `RadioBoard2027_BOM_full.csv`: every line with its source, LCSC part, JLC library, JLC stock on
  2026-11-03 and the alternate MPN and Vendor PN.
- `RadioBoard2027_BOM_digikey.csv` and `RadioBoard2027_BOM_mouser.csv`: only the parts not
  bought from LCSC.

Not from JLCPCB (order through JLCPCB global sourcing, consign them, or fit by hand):

| Ref | Part | Buy at | Why |
|---|---|---|---|
| U1 | Espressif ESP32-C5-WROOM-1U-N8R8 | Mouser 356-ESP32C5WRM1UN8R8 | No C5-WROOM-1U variant in stock at JLCPCB |
| U4 | Diodes AP7361C-33E-13 | Digi-Key AP7361C-33E-13DICT-ND | 4 at JLCPCB; no pin-compatible (IN-GND-OUT SOT-223) ceramic-stable 1A LDO in stock (ControlBoard2027 §14.1, U7) |
| J2 | Samtec LSHM-110-02.5-L-DV-A-S-K-TR | Digi-Key SAM14955CT-ND | 47 at JLCPCB; one each on this board and the controlboard, so 50 board sets need 100 |
| ANT1 | Taoglas FXP831.07.0100C | Digi-Key 931-1121-ND | Cable antenna, not stocked; not assembled |

Substitutions for JLCPCB (the Digi-Key part stays as the alternate):

| Refs | Alternate (Digi-Key) | JLCPCB part (LCSC) | Why it is a drop-in |
|---|---|---|---|
| C1, C8 | Samsung CL21A226MOQNNNE (16V) | Samsung CL21A226MAQNNNE (C45783, Basic) | 22µF X5R 0805, 25V: the part from the 2026-09-14 JLC BOM, in stock at JLCPCB |
| C5 | TDK C2012X5R1E475K125AB | Samsung CL21A475KAQNNNE (C1779, Basic) | 4.7µF 25V X5R 0805 |
| C6, C7 | Taiyo Yuden LMK107BBJ106MALT | Samsung CL10A106KP8NNNC (C19702, Basic) | 10µF 10V X5R 0603, ±10% |
| R1-R6, R8-R11, R13-R15 | Yageo / Panasonic 1% | UNI-ROYAL 0402WGF 1% (Basic) | Same value and 0402; R4, R5, R6 stay 1% (C25105 and C25092 are ±1%) |

C2, C3, C9, D1, D2, D3, D4, F1, J1, R7, R12, SW1, SW2, U2, U3, U5 and U6 are the exact Digi-Key
parts, in stock at JLCPCB. C5 was substituted because the TDK part has no JLCPCB stock; C1, C6-C8
and the resistors use Basic parts although the exact parts are in stock as Extended
(ControlBoard2027 §14.1 explains the rule; swapping back needs only the `LCSC` field, for
example Panasonic ERJ-2RKF1501X C413084 for R8/R15). Substituted
parts carry an `LCSC Datasheet` field for the placed part. C4 is DNP and is not in any order file.

### BOM history: Digi-Key selection (stock checked 2026-10-04, now the alternates)

Stock was read live from the Digi-Key and Mouser product pages. "Sufficient" means at least 1,000
in stock and 50 boards' worth for passives, at least 200 and 50 boards for everything else; every
line passed.

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

**RadioBoard2027 rev B (2026-11-04).** The board was re-laid out to sit on ControlBoard2027_6L (and, unchanged, ControlBoard2027_4L). The
schematic and the circuit topology are the prototype's, with these changes:
- one ESD channel swap on U5;
- one GPIO swap for HANDSHAKE/DATA_READY (§3, §5);
- M2.5 holes on the controlboard's H5-H8.

Outline and mounting:
- 54 × 36mm, landscape, 3mm corner radius (as the controlboard). This is the prototype's size turned 90°.
- H1-H4 sit exactly on controlboard H5-H8 (48 × 30mm pattern, M2.5 × 5mm standoffs).
- J2 sits on controlboard J9 at (53.0, 25.6)mm. The coordinates here are the controlboard's, so
  both board files can be overlaid directly.

The mating script confirms all 20 pads and the four holes.

4 layers, JLC04161H-7628 stackup. Every part is on the top side except J2, D4, U5, U6, R2, R18, R3
and C4 (DNP), which are on the bottom. Order bottom-side assembly for them (J2's shield pins are paste-in-hole).
They sit over the controlboard's U2 area. The tallest part under them is about 2mm, against the
5mm stack.

| Layer | Use |
|---|---|
| F.Cu | Parts, SPI and slow-line entries into the module, USB pair, power, GND pour |
| In1.Cu | Solid GND |
| In2.Cu | +3V3 plane, plus a GND region (`GND_In2_SPI`, priority 1) under the whole B.Cu link corridor (x 48.4-63.0, y 26-47mm). No signals. |
| B.Cu | J2, U5/U6, D4, R2, R18; SPI lanes and slow link lines; +3V3_HOST feed; PWR_SRC, VIN2, VBUS jumpers; LED/UART lines under the module; GND pour |

### Floorplan

| Area | Parts | Why |
|---|---|---|
| North centre (B.Cu) | J2, U5, U6 (north-east corner left clear) | J2 is fixed by J9. Its signal row faces into the board, so U5/U6 sit straight below it. |
| West | U1 (rotated 180°) | The link pins (pads 3-14) face east toward J2. The U.FL connector is at the south-west; route its cable west over the module edge, clear of the buttons. |
| East edge | J1 USB-C, U2, R9/R10, D2 | Same side as the controlboard's USB, SD card and debug header. The plug clears the controlboard parts below it (plug underside about 5mm above the controlboard). |
| South-west edge | SW2 BOOT, SW1 RESET, side by side (user request) | Pressed together for download mode. RESET is next to the EN network at pad 3. BOOT (GPIO28) leaves pad 15 through a via, passes R3/C4 (B.Cu, beside the pad), and runs down the west edge on B.Cu. |
| Middle east | U3 power mux, C6-C9, R11-R14 | The prototype's cluster, placed and routed exactly as before (shifted copy). |
| South east | F1, U4, C5 | VBUS path J1 → D2 → F1 → U4. |
| South centre | TP1 TX, TP2 RX, D1 STAT, D3 PWR (one row) | Fed from the module's west pads on B.Cu under the module, in pad order. |

### Rules

As in the prototype: the default netclass is 0.2mm track, 0.15mm clearance and 0.6/0.3mm vias
(0.5/0.3mm is the board minimum). `RadioBoard2027.kicad_dru` holds the custom rules:
- power-net clearance;
- USB and SPI widths, and the 2W pour clearance (outer layers only);
- the link-via plane clearance.

A deliberately violated 5mm SPI-width test rule fired 47 times, which proves the file compiles.

### Controlboard link (J2 → U5/U6 → module)

**J2 escape.** J2's signal row (south, y 27.45mm) faces into the board, so every line leaves its pad
straight south on B.Cu and enters U5 or U6. There is no via between J2 and the ESD parts. This
clears the prototype's main deviation, where each line needed a via in the J2 row gap first.
- North-row GND pins: tied by a bar on their inner ends.
- South-row GND pins 9/13/17: each takes a via in the row gap.
- J2 pin 13 also runs straight into U5's GND pins 3/8, so ESD current returns to the connector
  ground by the shortest path.

**U5 channel order.** The ESD channels are equivalent. The sheet now uses U5:
- pin 1 for MOSI;
- pin 2 for MISO;
- pin 4 for SCK;
- pin 5 for CS.

This follows the J2 pin order, so the lines run into U5 without crossing. MISO and SCK go
straight; MOSI and CS take one 0.5mm 45° jog in front of a GND pad. U6 keeps EN / DATA_READY /
HANDSHAKE on pins 1/2/4.

**Why the lines change layer once.** J2 is a bottom-side part, so its pin order is mirrored
against the module's pad order. On one layer the four SPI lines would need four crossings.
- Each SPI line runs south on B.Cu over the In2 GND region.
- It then takes one via to F.Cu at the height of its module pad, and runs straight west on F.Cu
  (over In1 GND) into the pad.
- Lines cross only between a B.Cu lane and an F.Cu run, which have two GND planes between them.
- No line has more than one via.

| Line | B.Cu lane | Via | F.Cu run | GND return via |
|---|---|---|---|---|
| MOSI | x 52.75-54.3 (accordion) | (53.30, 38.75) | 1.55mm to pad 9 | (52.95, 39.40), 0.74mm |
| MISO | x 55.10 | (55.10, 45.10) | via → R4 → pad 4 | (56.10, 45.10), 1.0mm |
| SCK | x 56.20 | (56.20, 40.02) | 4.45mm to pad 8 | (57.20, 40.02), 1.0mm |
| CS | x 58.94 | (58.94, 34.94) | 7.19mm to pad 12 | (59.94, 34.94), 1.0mm |

**Slow lines.** EN, DATA_READY and HANDSHAKE run on B.Cu under the module's east pad column to vias
beside their pads:
- HANDSHAKE to pad 6 (GPIO0);
- DATA_READY to pad 5 (GPIO3);
- EN through R2 (on B.Cu) to pad 3.

Before the GPIO swap, DATA_READY sat between EN and HANDSHAKE at J2 but had to reach the module's
west column (pad 17), which forced a crossing under the module. With the swap, all three land on
the east column in J2 order. R16/R17 (pull-downs) sit on F.Cu at pads 6/5, and R18 (CS pull-up)
sits on B.Cu on the CS lane.

**Widths.**
- SPI is 0.36mm (about 50Ω over GND at 0.21mm).
- From J2 through U5 to where the lines are about 1mm apart it runs at 0.2mm (measured: MOSI 5.46,
  MISO 5.16, SCK 4.36, CS 3.68mm per line), because J2 and U5 are at 0.5mm pitch.
- U6's slow lines are 0.2mm.

### SPI length (J2 pad → module pad, vias 1.6mm, R4 span included)

| Line | Radio | Controlboard (U2 → J9) | Total | vs SCK |
|---|---|---|---|---|
| SCK | 19.93 | 6.30 | 26.23 | 0 |
| MOSI | 20.10 | 6.12 | 26.22 | −0.00 |
| CS | 19.72 | 6.51 | 26.23 | +0.00 |
| MISO | 23.81 | 6.30 | 30.11 | +3.88 (not matched, see below) |

- **MOSI accordion.** MOSI is the westmost lane (J2 order), so it cannot gain length from a longer
  lane as SCK and CS do. It carries a two-leg accordion on B.Cu:
  - legs ±1.02mm (≤3W) across the line;
  - leg spacing 1.8mm (4W edge gap);
  - 45° corners cut by 0.25mm.
- **MISO.** MISO is driven by the module back to the host. The host samples it half a clock after
  launching SCK, so its budget is the round trip (SCK out plus MISO back), not a match to SCK. Its
  module pad (4) is 5mm further south than SCK's (8), which sets the 3.9mm (about 25ps) excess. R4
  33Ω source-terminates it at the module. This is the same reasoning as on the prototype.
- All values are measured by script over both board files.

### USB

J1 → U2 → R5/R6 → module pads 14/13, all on F.Cu over In1 GND, with no vias in the pair.
- **Contact joins.**
  - D+ (B6/A6) joins under the shell, with a 1.4mm loop past the pad ends.
  - D- (A7/B7) joins beside the contacts.
- **Coupling.** From R5/R6 the pair runs coupled (0.25mm lines, 0.16mm gap) for 6.5mm. It splits
  to the 1.9mm pin spacing of U2 (the USBLC6 GND pin sits between the I/O pins).
- **Other contacts.**
  - CC1/CC2 go south and north of the pair to R9/R10. CC1 runs 0.5mm from DN_CON for 0.6mm only.
  - VBUS: A4/B9 runs on F.Cu straight through D2 (no via); A9/B4 joins D2 through one B.Cu jumper (Power, below).
  - GND: A12 joins R10's GND via; A1 has its own via beside the contact.
- **Lengths.**
  - U2 → module: D+ 19.50mm, D- 19.76mm.
  - J1 → U2: D+ 8.59 / 6.00mm, D- 7.14 / 5.83mm (plug on A / on B).
  - End-to-end skew: 1.19mm with the plug on A, 0.09mm on B.
- The A-side skew comes from the duplicate-contact stubs. Full-Speed edges are 4-20ns, so 1.2mm
  (8ps) does not matter (§4).

### Power

- **VBUS.**
  - D2 sits right beside J1's contacts. The A4/B9 contacts run on F.Cu straight into D2's IN pads
    (4-6, flow-through) and on into F1. There is no via before the TVS.
  - The A9/B4 contacts sit on the other side of the USB pair. They join through one B.Cu jumper that
    lands on D2's IN pad 5 (a plug also bonds all four VBUS contacts).
  - F1 → U4 VIN and C5 on F.Cu, 0.36-0.6mm.
- **U4.** VOUT → C6 → U3 VIN2, through one B.Cu jumper (0.4mm) around the USB area. The tab has GND
  vias beside it.
- **+3V3_HOST.**
  - J2 pins 2/4/6 are tied across their outer ends, and a 0.28mm bar runs along the north edge
    (0.5mm from the edge, 0.21mm from the GND pads) into D4's IN pads.
  - From there a 0.36mm B.Cu run goes to the U3 cluster vias.
  - R18's pull-up leaves D4 pad 5 separately.
- **U3 cluster.** The prototype's U3 / C6-C9 / R11-R14 placement and local routing are reused
  as-is. Its OUT feeds the In2 +3V3 plane through vias.
- **Module.** It takes +3V3 at pad 2 from C2/C1, each with its own plane via. Nine GND vias sit in
  the EPAD grid.

### Stitching

- 45 GND vias on a ~4mm grid and along the edges, placed only where both outer GND pours surround
  the via (script).
- None within 3.4mm of a mounting hole (standoff), none under the module, J2, J1 or the switches.

### Cleanliness

- Every segment is a multiple of 45°.
- There are no corners of 90° or sharper, and no T-junctions off pads or vias (checked by script).
- Remaining width steps are deliberate:
  - the SPI necks at U5 (0.2 → 0.36mm);
  - U3 pin 6 (VIN2, 0.25 → 0.5mm, 1.3mm from the pin);
  - U3 pin 3 (+3V3_HOST, 0.25/0.3mm, prototype cluster).

### Silkscreen

- Parts a user touches carry their function: USB, RESET, BOOT, STAT, PWR, TX, RX.
- References sit beside their parts at 0.8mm. R4 is on the Fab layer only, because there is no
  room between R17 and C2.
- The back carries "RadioBoard2027 rev B" and "TO CONTROLBOARD J9" at J2.

### DRC / ERC

- On the repo board: 0 violations at all severities, 0 unconnected, 0 schematic-parity issues.
- Zones were refilled on the saved board.
- ERC: 0.

### Audit (2026-11-04)

An independent reviewer audited the rev B board against the repo rules. It re-ran DRC/ERC and proved
the rules compile. It also re-measured the mating, the clearances under the radio, the SPI lengths
and planes, and the return vias, and found no critical issue.

Fixed after the audit:
- VBUS had two vias before D2: D2 moved to the contacts.
- The "ANT" silk sat under SW2.
- The R16/R17 descriptions were stale after the GPIO swap.
- Stale J1 DRC exclusions were left in the project file.
- Small off-45° and collinear segments.
- A stub to R3/C4: GPIO28 now runs through both pads.
- A 0.25mm gap between HANDSHAKE and the MOSI meander: the lane moved west.
- The neck lengths in these notes were wrong.

Rejected:
- "Track ends off via centre" on U3_PR1/PWR_SRC_HOST: every track end on those nets lands on a via
  centre; the points quoted are path vertices.
- The controlboard lengths quoted by the reviewer (4.81mm etc.) are measured from the pad edges. The
  1.49mm constant to the pad centre cancels in the match.

The remaining items are listed below.

### Known deviations (rev B)

- **SPI neck at J2/U5.** 3.7-5.5mm per line at 0.2mm (about 68Ω), because the lines run between
  0.5mm-pitch pads from J2 through U5. That is electrically short at 10-40MHz.
- **MOSI meander position.** It sits mid-lane, ending about 1.6mm from module pad 9 (receiver end).
  MOSI is the westmost lane (J2 pin order), so the lane beside the module is the only free space for
  it.
- **A9/B4 VBUS jumper.** One B.Cu jumper with two vias joins the north VBUS contact pair to D2.
- **GPIO28 spur.** The via at pad 15 also feeds a 2.5mm B.Cu spur through R3 (pull-up) and C4 (DNP)
  beside the pin: a pull-up/strap point, as the HDG places it.
- **Buttons away from USB.** RESET and BOOT sit together on the south edge at the user's request,
  about 25-40mm from J1 on the east edge.
- **Antenna cable.** The U.FL connector is at the module's south-west corner, right above BOOT. Route
  its cable west over the module edge (between the module and H3), not south across the buttons.
- **+3V3_HOST entry.** The 0.28mm bar along the north edge is limited by the 0.5mm edge clearance and
  the 0.2mm gap to J2's GND pads. After D4 the run is 0.36mm, about 30mV drop at 650mA.
- **J1 shield** is not tied to GND (prototype §4). **J2 footprint** is marked through-hole although
  all its pads are SMD (library footprint, as on the controlboard). **Controlboard SD card**: the
  radio's USB plug points east over it.
- **MISO not matched** (round trip, above).
- **USB.** The pair is not edge-coupled through U2 (USBLC6 pinout). Skew with the plug on A is
  1.19mm (stubs). Both are acceptable at Full-Speed.
- **3W.** In the U5 fan-out, MOSI and MISO run 0.5mm apart for 2.1mm, and CS/SCK 0.8mm apart for
  about 1mm. At the MOSI accordion tips, MISO's lane is 0.8mm away and HANDSHAKE's 0.83mm, centre to
  centre.
- **Slow and power lines over the +3V3 plane.** These lines run on B.Cu over the In2 +3V3 plane
  (as on the prototype):
  - GPIO24, TX and RX under the module;
  - PWR_SRC, VIN2 and VBUS jumpers;
  - the +3V3_HOST feed outside the GND region.

  They are slow or power nets.
- **Bottom-side standoffs.** The B.Cu GND pour runs up to the hole clearance, so metal standoffs
  join this board's GND to whatever the controlboard has at H5-H8.

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
