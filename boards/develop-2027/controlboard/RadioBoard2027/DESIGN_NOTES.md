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
| eGH | JST GH connector catalogue |
| TAO | Taoglas FXP831.07.0100C spec SPE-11-8-026-K |
| Radio doc | 2027 Radio Module Design Doc (in `../`) |
| USB2 | USB 2.0 specification (usb.org `usb_20.pdf`), §7.1.1.1, §7.1.2.1, §7.1.6.1 |
| AN0046 | Silicon Labs AN0046 USB hardware design guidelines, §3.1, §3.3 |
| JLC | JLCPCB impedance page, stackup JLC04161H-7628 |

The Seeed XIAO ESP32-C5 project in `../daughterboard` was used as a cross-check for the USB-C,
EN and BOOT circuits.

The ESP32-C5-WROOM-1U is the only part not in the KiCad 10 standard library. Its symbol, footprint
and STEP model come from espressif/kicad-libraries 3.2.1 and live in `lib/` (the model in
`lib/RadioBoard2027.3dshapes`). All 32 pin numbers match MOD Table 3-2. Every other footprint is a
stock KiCad 10 footprint.

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
- **D2 TVS0500** on VBUS at J1, then **F1 MF-MSMF075/33X-2**: hold 0.75A (0.56A at 50°C), trip
  1.50A, 33V (MF-MSMF Rev BD). The module's 403mA peak sits under the hold current. The /16X
  part is not stocked at LCSC; /33X is the current Bourns part with the same ratings and 1812
  land pattern.
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

### BOM (JLCPCB/LCSC, stock checked 2026-09-14)

Passives are 0402 except where 0402 lacks the rating: 22µF needs 0805 (25V keeps about 14µF at
3.3V), 10µF uses 0603 10V (about 6µF at 3.3V), 4.7µF on VBUS uses 0805 25V (about 3.7µF at 5V).
DC-bias figures are typical X5R estimates, not part-specific curves.

| Ref | Value | Package | MPN | LCSC | Class |
|---|---|---|---|---|---|
| C1, C8 | 22µF 25V X5R | 0805 | Samsung CL21A226MAQNNNE | C45783 | Basic |
| C2, C9 | 100nF 16V X7R | 0402 | Samsung CL05B104KO5NNNC | C1525 | Basic |
| C3 | 1µF 25V X5R | 0402 | Samsung CL05A105KA5NQNC | C52923 | Basic |
| C4 (DNP) | 15pF C0G | 0402 | FH 0402CG150J500NT | C1548 | Basic |
| C5 | 4.7µF 25V X5R | 0805 | Samsung CL21A475KAQNNNE | C1779 | Basic |
| C6, C7 | 10µF 10V X5R | 0603 | Samsung CL10A106KP8NNNC | C19702 | Basic |
| R1, R3, R13 | 10k 1% | 0402 | UniOhm 0402WGF1002TCE | C25744 | Basic |
| R2 | 470 1% | 0402 | UniOhm 0402WGF4700TCE | C25117 | Basic |
| R4 | 33 | 0402 | UniOhm 0402WGF330JTCE | C25105 | Basic |
| R5, R6 | 22 | 0402 | UniOhm 0402WGF220JTCE | C25092 | Basic |
| R7 | 499 1% | 0402 | UniOhm 0402WGF4990TCE | C4125 | Ext |
| R8, R15 | 1.5k 1% | 0402 | UniOhm 0402WGF1501TCE | C25867 | Basic |
| R9, R10 | 5.1k 1% | 0402 | UniOhm 0402WGF5101TCE | C25905 | Basic |
| R11 | 100k 1% | 0402 | UniOhm 0402WGF1003TCE | C25741 | Basic |
| R12 | 68k 1% | 0402 | UniOhm 0402WGF6802TCE | C36871 | Ext (preferred) |
| R14 | 1M 1% | 0402 | UniOhm 0402WGF1004TCE | C26083 | Basic |
| D1 | Green | 0603 | NationStar NCD0603G1 | C84267 | Ext |
| D3 | Red | 0603 | Kingbright APT1608EC | C5554143 | Ext |
| SW1, SW2 | Tactile 5.1×5.1 | SMD | XKB TS-1187A-B-A-B | C318884 | Basic |
| U1 | ESP32-C5-WROOM-1U-N8R8 | module | Espressif | C51950748 | Ext, **0 stock** |
| U3 | TPS2116DRLR | SOT-583 | TI | C3235557 | Ext |
| U4 | AP7361C-33E-13 | SOT-223 | Diodes | C500795 | Ext |
| J1 | USB4110-GF-A | SMD | GCT | C5143397 | Ext |
| U2 | USBLC6-2SC6 | SOT-23-6 | ST | C7519 | Ext |
| D2, D4 | TVS0500DRVR | WSON-6 | TI | C609571 | Ext |
| F1 | MF-MSMF075/33X-2 | 1812 | Bourns | C3760814 | Ext |
| J2 | BM15B-GHS-TBT(LF)(SN) | SMD | JST | C5305069 | Ext |
| U5, U6 | TPD4E05U06DQAR | USON-10 | TI | C138714 | Ext |
| TP1, TP2 | pad | - | - | - | - |

- **TS-1187A.** The switch has two pairs of legs shorted inside the part (A-B and C-D). The
  KiCad footprint numbers them 1,1 and 2,2 at x = ±3.0, y = ±1.875, which matches the XKB drawing,
  so it works directly with SW_Push.
- **D1.** The green LED is far brighter per mA than the red Kingbright. Raise R8 if 0.8mA looks
  too bright.

---

## 7. Layout

36 × 54mm, 4 layers, JLC04161H-7628 stackup, JLC assembly on the top side only.

| Layer | Use |
|---|---|
| F.Cu | Parts, short signals, USB pair, power traces, GND pour |
| In1.Cu | Solid GND |
| In2.Cu | +3V3 pour, SPI trunk (SCK, MOSI, MISO, CS) and DATA_READY |
| B.Cu | HANDSHAKE, ESP_EN, EN, PWR_SRC_HOST, CC1/CC2, short power jumps, GND pour |

- **Rules.** Default netclass: 0.2mm track, 0.15mm clearance, 0.6/0.3mm vias.
  `RadioBoard2027.kicad_dru` raises power nets (+3V3, +3V3_HOST, VBUS, VIN2, pre-fuse VBUS) to
  0.2mm clearance and a 0.25mm minimum width. Netclass clearance overrides a lower custom rule, so
  the 0.15mm default must stay in Board Setup.
- **USB.** 0.25mm lines with a 0.15mm gap on F.Cu over In1. D+ and D- from J1 are joined at the
  connector: the DP pads on the left, under the shell, and the DN pads on the right.
- **SPI.** J2 → U5/U6 on F.Cu, then a via beside each ESD pin into the In2 trunk (MISO, SCK, MOSI,
  CS) to the module-side vias. In2 is 0.21mm from the B.Cu GND pour and 1.07mm from In1 GND. The
  ESD pads are 12-14mm from J2 along the line. HANDSHAKE and ESP_EN run on B.Cu along the left
  edge.
- **Stitching vias.** PWR_SRC_HOST, CC1 and CC2 on B.Cu cut the pour under the In2 trunk, and
  HANDSHAKE crosses under MISO near the module. Eight GND vias sit 1-2mm from these crossings so
  the return current can move to In1.
- **Power.** VBUS: J1 → D2 → F1 → C5, then to U4 on B.Cu. U4 VOUT → C6 → U3 VIN2 on F.Cu.
  +3V3_HOST: J2 → D4 → C7/R11 → U3 VIN1. U3 OUT feeds the In2 +3V3 pour through vias at U3, C8 and
  C9. The module takes +3V3 from C2/C1 at pin 2, with a via into In2. U4 tab has three GND vias
  to In1 for about 0.85W at 500mA from 5V.
- **Module.** Nine GND vias in the EPAD grid. U1 is placed so its U.FL connector (top-right corner
  of the module, next to pads 27/28, MOD Fig 3-2 and 10-2) sits about 2.4mm from the top board
  edge; the cable leaves over the edge. The connector is on the module itself, so the HDG advice to
  clear all layers under an IPEX connector (which applies to a chip-down design) does not apply.
- **Corners.** Track bends are 45° chamfers. The remaining 90° corners are inside pads or vias, or
  are jogs shorter than 0.5mm into a via. At these edge rates a 90° corner causes no measurable
  reflection; the chamfers are for manufacturing and consistency.
- **Silkscreen.** Every reference sits outside all courtyards, pads and vias, inside the board
  edge, with at least 0.4mm between labels. C1 and C2 use 0.8mm text to fit beside H1; the rest are
  1.0mm. Board Setup silk clearance is 0.1mm.
- **J1 shield.** The four shell pads are tied together on F.Cu but not to GND (§4).
- **DRC.** 0 errors, 0 unconnected. `min_resolved_spokes` is 1: U5 pin 8, U6 pin 8, C2 pin 2 and C8
  pin 2 get one thermal spoke from the pour and a direct trace to a GND via.

### Impedance and length (as routed)

Impedance is from a 2D field solver on the JLC stackup (7628 prepreg 0.2104mm, εr 4.4; core
1.065mm, εr 4.6; 1oz outer, 0.5oz inner; mask 1.2mil, εr 3.8). The solver was checked against the
exact stripline formula (47.1 vs 47.9Ω) and a w = h microstrip (70 vs 71Ω).

| Trace | Width / gap | Impedance |
|---|---|---|
| USB pair, F.Cu | 0.25 / 0.15mm | 96Ω bare, 86-91Ω under mask |
| SPI, F.Cu | 0.2mm | 68Ω |
| SPI, In2 | 0.2mm | 57Ω |

- **USB requirement.** The C5 USB is Full-Speed only, 12 Mbit/s (MOD §5.2.1.5). USB2 requires
  90Ω ±15% (§7.1.1.1, §7.1.6.1) with 4-20ns edges (§7.1.2.1). HDG §1.4.8 asks for 90Ω ±10%, in
  parallel at equal length, with no number for skew. The pair meets both.
- **USB length.** J1 → U2: D+ 13.6mm / D- 9.6mm with the plug one way, 11.1 / 10.5mm the other
  way. U2 → R5/R6: 31.0 / 30.8mm. R → module: 1.7 / 1.7mm. Worst-case skew is 4.1mm, about 25ps.
  AN0046 §3.3 allows up to 400ps (60mm) of skew for Full-Speed. The 50 mil figure in many layout
  guides is for High-Speed parts.
- **SPI length.** J2 → module: SCK 47.6mm, MOSI 47.5mm, CS 47.7mm, MISO 57.7mm (to R4),
  DATA_READY 49.1mm, HANDSHAKE 75.5mm. EH asks for SPI lines length-matched to CLK, with no
  number. SCK/MOSI/CS agree within 0.2mm. MISO is 10mm (about 60ps) longer, which is small
  against a 25ns period at 40MHz. HANDSHAKE and DATA_READY are slow interrupts.
- **SPI impedance.** HDG and EH give no impedance for SPI. 57-68Ω over about 5cm is fine at the
  planned 10-40MHz. R4 33Ω source-terminates MISO at the module. Bring the link up at 10MHz
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

**M3 Module sourcing.** No ESP32-C5-WROOM-1U variant is in stock at LCSC (checked 2026-09-14).
Consign modules to JLC, use JLC global sourcing, or hand-solder U1.

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
- **m7** 41 footprints are flagged lib_footprint_mismatch (DRC warning). Check with Update
  Footprints from Library before ordering.
