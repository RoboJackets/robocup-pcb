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
  `../../prototype/ControlBoard2027/datasheets/OPSCO_SK9822-EC20_RevA0.pdf`. Section 5 has the pin table, section 6
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
- J1, J2, J3, J9.

## 3. Motor modules: confirm which board plugs into J4-J8

J4-J8 are **JST GH 6-pin, 1.25 mm, signal only**: 1 MOSI, 2 GND, 3 MISO, 4 SCK, 5 GND, 6 CS, 3.3 V logic. There is no
power on these connectors.

The only motor module in the repo, `drive-motorboard/motor-module`, has a **JST PH 8-pin (2.0 mm)** connector with
+5V and +3.3V on it and a different pin order. **It does not plug in.** Before ordering, decide which motor board is
meant for this controlboard, how it gets its logic supply, and whether a harness or adapter is needed.

## 4. Expansion port current (J11 / J12)

F3 and F4 are **0.75 A hold** PTCs (Littelfuse 1812L075/24DR, LCSC C207065): 0.55 A at 50 °C. They do **not** give
2 A per port.
- If more is needed, a footprint-identical drop-in is **Littelfuse 1812L110/16DR (LCSC C142746)**: 1.10 A hold,
  1.95 A trip, 16 V, same 1812 body.
- The Bourns MF-MSMF110/16X-2 is an equivalent. It is **not** fitted, because the BOM is frozen. Change it only on
  purpose, and also re-check F5 (the 5 V input fuse, 1.25 A hold), which feeds both ports and the board.

## 5. Firmware: this board's pins differ from ControlBoard2027_C

Use `../docs/FIRMWARE.md` **section 1.3a** as the pin map. Do not port the C or C4L CubeMX project unchanged. In
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
- **Speaker board:** the largest area it can use is x 0-35.9, y 0-60 mm. That area covers the corner mounting holes
  H1 / H3 and the rail test points and LEDs. The current outline (25 x 45 mm on H5 / H6) avoids them.

---

When every item above is ticked, write the date and your name here and commit it with the order files.

- [ ] 1. LED pin 1 checked in the JLC preview (D7-D11)
- [ ] 2. Other polarised parts checked in the JLC preview
- [ ] 3. Motor module and connector agreed
- [ ] 4. Expansion fuse rating decided
- [ ] 5. Firmware pin map taken from FIRMWARE.md 1.3a
- [ ] 6. Stock re-checked on the order day
- [ ] 7. Notes in section 7 read

Checked by: ______________________  Date: ____________
