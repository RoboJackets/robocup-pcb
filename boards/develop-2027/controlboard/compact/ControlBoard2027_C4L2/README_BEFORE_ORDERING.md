# READ THIS BEFORE ORDERING ControlBoard2027_C4L2

**Stop. Do not place a fab or assembly order until every box below is ticked.** Each item is something that the
design files cannot enforce on their own: a manual check at the assembly house, a decision about another board, or a
firmware setting that will brick a bring-up if it is missed. Details and reasons are in
[DESIGN_NOTES.md](DESIGN_NOTES.md) section 1.0.

Status when this file was written (2026-11-17), on the repo board:
- DRC: 0 errors, 0 unconnected, 0 schematic-parity issues, run twice.
- ERC: one known item (the VCAP pin 71 / 106 tie).
- Layout audits: four independent rounds, none with a critical defect.
- Schematic and pinout audit: no critical defect.

---

## 1. LED pin 1 (D7-D11): check it in the JLC placement preview. MUST DO.

The five DotStar LEDs are **OPSCO SK9822-EC20, LCSC C2909059**. A rotated LED shorts 5 V into a data pin and kills
the whole chain.

- Reference: the datasheet LCSC links for C2909059, archived as
  `../datasheets/OPSCO_SK9822-EC20_RevA0.pdf`. Section 5 has the pin table, section 6
  the top-view land.
- Pin numbering on the board follows that datasheet: **1 SDO, 2 GND, 3 SDI, 4 CKI, 5 VDD, 6 CKO**.
  - Pad 1 (SDO) is the top-left pad of the footprint at 0 degrees, where the **silkscreen dot** and the chamfered
    corner of the outline are.
  - Seen from the top, the left column is SDO / GND / SDI and the right column is CKO / VDD / CKI.
- Before you confirm the order, open JLC's component placement preview (DFM / "Component placement"). For **each** of
  D7, D8, D9, D10 and D11, check that the part's pin-1 marker sits on the silkscreen dot.
  - JLC's own 3D model can have a different 0-degree orientation from ours. If any LED is off, correct the rotation
    in the JLC tool (or ask JLC to), not in the board file.
  - D7 / D8 / D11 are placed at 180 degrees and D9 / D10 at 0 degrees. That is intentional: it is the fixed shell
    pattern.
- **Do not substitute the BB-2020BGR alternate** without checking its own pin table first. It has the same land, but
  the BOM notes say it is placed rotated. Its numbering is not the SK9822 numbering.

## 2. Polarity and orientation of the other parts in the JLC preview

Check the pin-1 or polarity marker of every polarised part against the silkscreen, the same way as for the LEDs:
- U2 (MCU);
- U1, U3-U6, U12-U14, U16, U17 (ESD arrays);
- U7, U8, U9, U10, U11;
- D1-D6;
- Q1;
- J1, J2, J3, J9;
- J4-J8, J10-J12 (GH: contacts toward the board edge), J15 (pin 1), SW3 ("ON" side as on the silkscreen).

## 2a. Placement file (CPL) rotation rules: needed on the machine that generates the files

The BOM and CPL are generated with the kicad-jlcpcb-tools plugin (Bouni). JLC measures each CPL rotation against its
own (EasyEDA) footprint for the LCSC part. Where that footprint is drawn in a different orientation from ours, the
plugin adds a correction from its rotation table. The plugin's default table was wrong for the parts below: the CPL
would have placed them a quarter or half turn off.

The rules below were added to the plugin's rotation table on 2026-11-21. The table is part of the KiCad install, not
the repo: `Documents/KiCad/10.0/3rdparty/plugins/com_github_bouni_kicad-jlcpcb-tools/jlcpcb/corrections.db`, editable
in the plugin's rotation manager.
- **On any other computer**, or after a plugin reinstall or update, add these rules again before generating the CPL.
  Each regex matches one exact footprint name (or one value), so it overrides the generic defaults for that part only.

| Regex (footprint name, or value) | Rotation | Parts (CB = this board, R = both compact radios) | LCSC | Default it overrides |
|---|---|---|---|---|
| `^TI_TPS2116_DRL0008A$` | 270 | CB U8, U9 | C3235557 | none (0) |
| `^SOT-583-8$` | 270 | R U3 (TPS2116) | C3235557 | none (0) |
| `^WSON-6-1EP_2x2mm_P0\.65mm_EP1x1\.6mm$` | 270 | CB D1, D3, D4; R D2, D5 | C609571 | none (0) |
| `^Texas_R-PUSON-N14$` | 270 | CB U1 | C962978 | none (0) |
| `^PinHeader_2x07_P1\.27mm_Vertical_SMD$` | 270 | CB J3 | C5307809 | none (0) |
| `^SW_DIP_SPSTx06_Slide_6\.7x16\.8mm_W7\.62mm_P2\.54mm_LowProfile$` | 270 | CB SW3 | C129072 | none (0) |
| `^Samtec_LSHM-110-xx\.x-x-DV-S_2x10-1SH_P0\.50mm_Vertical_PIH$` | 180 | CB J9; R J2 | C3643542 | none (0) |
| `^AO3401A$` (value) | 180 | CB Q1 | C15127 | `^SOT-23` -90 |
| `^JST_GH_SM04B-GHS-TB_1x04-1MP_P1\.25mm_Horizontal$` | 0 | CB J10 | C189895 | `^JST_GH_SM` 180 |
| `^JST_GH_SM06B-GHS-TB_1x06-1MP_P1\.25mm_Horizontal$` | 0 | CB J4-J8 | C133065 | `^JST_GH_SM` 180 |
| `^JST_GH_SM08B-GHS-TB_1x08-1MP_P1\.25mm_Horizontal$` | 0 | CB J11, J12 | C265111 | `^JST_GH_SM` 180 |
| `^JST_PH_S7B-PH-K_1x07_P2\.00mm_Horizontal$` | 0 | CB J15 | C157917 | `^JST_PH_S` 180 |

**How the rotations were found.**
- For every LCSC part on both boards, JLC's EasyEDA footprint was downloaded. Each pad was matched to the same-numbered
  pad of our footprint at 0 degrees, and the quarter turn that lines them up was taken. Parts whose JLC pad numbering
  differs (GH 6-pin, DIP) were also fitted on pad positions alone.
- Fit error: within 0.10 mm for the connectors, TVS and ESD parts; within 0.3 mm for the TPS2116 and AO3401A (the
  difference in pad size between the two land patterns).
- The same calculation reproduces the plugin defaults that are known to work (LQFP-144 270, USON-10 270, SO-14 -90,
  SOT-23-5 -90).
- Every other assembled part agreed with the plugin's default.

**Not covered; check these in the JLC preview.**
- **No EasyEDA footprint:** the red LEDs APT1608EC (CB D5, D6; radio D3, cathode mark), the crystal (CB X1, pin 1)
  and the radio's D4 (bidirectional, orientation does not matter).
- **SW3:** the pad fit cannot tell which side "ON" faces.
- **Bottom-side parts:** these rely on the plugin's own bottom-side mirroring, which was not checked independently.
- **J10-J12:** these sit about 0.25 mm from JLC's part centre, within normal placement tolerance.

**Re-check this table after any part or footprint change.** A different LCSC part on the same footprint can need a
different rotation.

## 3. Motor boards on J4-J8: two cable types

J4-J8 are **JST GH 6-pin, 1.25 mm, signal only**: 1 MOSI, 2 GND, 3 MISO, 4 SCK, 5 GND, 6 CS, 3.3 V logic. There is no
power on these connectors.

- **Drive motors (J4-J7):** the drive-motorboard (`drive-motorboard/drive-motorboard`, J4 "COMM SPI", GH 6P) has the
  reverse pin order: 1 CSN, 2 GND, 3 SCK, 4 MISO, 5 GND, 6 MOSI. Use a **reversed** cable, CB pin n to motor pin 7-n.
  A straight cable gives no communication.
- **Dribbler (J8):** the dribbler board's J5 has the CB order. Use a **straight** cable.

Label the two cable types. A swapped cable damages nothing (GND on pins 2 / 5 at both ends), but the motor does not
talk. Wiring table: ../docs/INTERFACE.md, J4-J8.

## 4. Expansion port current (J11 / J12)

F3 and F4 are **0.75 A hold** PTCs (Littelfuse 1812L075/24DR, LCSC C207065): 0.55 A at 50 °C. They do **not** give
2 A per port.
- If more is needed, a footprint-identical drop-in is **Littelfuse 1812L110/16DR (LCSC C142746)**: 1.10 A hold,
  1.95 A trip, 16 V, same 1812 body.
- The Bourns MF-MSMF110/16X-2 is an equivalent. It is **not** fitted, because the BOM is frozen. Change it only on
  purpose, and also re-check F5 (the 5 V input fuse, 1.25 A hold), which feeds both ports and the board.

## 5. Firmware: this board's pins differ from ControlBoard2027_C

Use `../docs/FIRMWARE.md` **sections 1.2 and 1.3** as the pin map. Do not port the C or C4L CubeMX project unchanged. In
particular:
- **Radio SPI is SPI1** (PB3 / PB4 / PB5, AF5), not SPI3: SPI3 drives the front motors on PC10-PC12.
- Rear motors are SPI2. The LEDs are SPI6 on PA5 / PA7.
- Kicker is I2C1, OLED I2C3, expansion I2C2, IMU I2C4.
- The powerboard UART is **USART10**: PE3 TX is AF11, but **PE2 RX is AF4**.
- Debug UART is USART6 on J3 pins 13 / 14 (the STLINK-V3 virtual COM port).
- Enable the internal pull-ups on **PE2** and **PC7**; both float when their cable is unplugged.
- Check every AF number in CubeMX before the first build.

## 6. Re-check stock on the day of ordering

The BOM in `bom/` was checked on 2026-11-09 / 11-14. Stock changes daily: re-check every LCSC number, especially the
Extended parts (C2909059 LEDs and the PTCs). Generate fabrication outputs (gerbers, BOM, CPL) fresh from the
repo board at order time; none are generated in this folder.

## 6a. Fab settings

- Stackup **JLC04161H-3313** with impedance control (the 0.15 mm 50-ohm widths are only correct on that stackup).
- Every via is **0.45 mm pad / 0.3 mm drill** (JLC's standard via; no small-via surcharge). Minimum track / gap is
  0.09 mm in the rules; the narrowest copper actually used is 0.14 mm (USB pair).
- R39 is placed rotated 180 degrees compared with the C4L layout: check its rotation in the JLC placement preview.
- **Mark on PCB (serial number):** choose **2D barcode & Number**, **8x8 mm**, QR code, **Specify Position**. The
  position is the solid 8 x 8 mm square on the **bottom** silkscreen beside the RoboJackets logo; JLC prints the code
  in the square and the number below it. JLC's help page does not say whether the bottom side is accepted, so confirm
  it in the order notes or with support, and check JLC's production-file preview (layers `qrt` / `qrb`). Without the
  option selected, JLC prints nothing there and the square stays a plain white block. Do not add "JLCJLCJLCJLC"
  text: the order-number option no longer exists (JLC, "How to mark on PCB", May 2026).

## 6b. Radio and powerboard generations

- **Compact radio only on J9.** The prototype RadioBoard2027 has the same LSHM connector, so it plugs in, but its GND
  pins land on this board's +3V3 pins (a dead short). The top silkscreen says "COMPACT RADIO" beside J9.
- **J15 is a JST PH 7-pin** (1 TX, 2 RX, 3 GND, 4 +3V3, 5 GND, 6 +5V, 7 GND). A powerboard built for the prototype's
  JST XH 8-pin does not plug in. Steady load: +5V up to 2 A, +3V3 about 1 A (DESIGN_NOTES §4.8).

## 7. Things the files do not show

- **No KICKER label on the top silkscreen.** There is no room between the J7 housing, J10 and the SD socket. J10 is
  the 4-pin connector in the top-right corner; its legend is on the bottom.
- **OLED module (J13):** some SSD1306 modules swap VCC and GND. The board expects 1 GND, 2 +3V3, 3 SCL, 4 SDA. Check
  the module before plugging it in.
- **Mounting at H2** (the M3 mounting hole on the top edge at x 71.0, y 3.5 mm, left of J4): the KICKER_I2C_SDA track
  on the bottom side passes 3.89 mm from the hole centre, 0.39 mm outside a standard 7 mm M3 washer.
  - A nylon screw and washer (or a nylon standoff) is fine.
  - If anything metal touches the bottom of the board there (a standoff, nut or washer), keep its outer diameter at
    7 mm or less.
- **Speaker board:** the outline is 30 x 45 mm (x 1.925-31.925, y 7.525-52.525 mm board-local) on the M2 holes H5
  (17.025, 31.525) and H6 (17.025, 49.525). It covers the power block including the rail LEDs D5 / D6 and the
  top-side test points TP13 / TP14 (TP3 / TP15 are on the bottom). With the speaker board fitted the rail LEDs are
  hidden and those test points cannot be probed; check the standoff height against the J11 / J12 housings too.

---

When every item above is ticked, write the date and your name here and commit it with the order files.

- [ ] 1. LED pin 1 checked in the JLC preview (D7-D11)
- [ ] 2. Other polarised parts checked in the JLC preview
- [ ] 2a. CPL generated on a machine with the section 2a rotation rules (both boards)
- [ ] 3. Motor cables made: DRIVE SPI reversed (J4-J7), DRIBBLER SPI straight (J8)
- [ ] 4. Expansion fuse rating decided
- [ ] 5. Firmware pin map taken from FIRMWARE.md §1.2 / §1.3
- [ ] 6. Stock re-checked on the order day
- [ ] 7. Notes in sections 6b and 7 read

Checked by: ______________________  Date: ____________
