# ControlBoard2027_C BOM

Date: 2026-11-07. Generated from the saved schematic (`kicad-cli sch export netlist --format kicadxml`), cross-checked
against the saved `ControlBoard2027_C.kicad_pcb` (pcbnew). All 199 schematic symbols match the board footprints in
reference, value and footprint (DRC schematic parity 0). The BOM-excluded and DNP flags agree between schematic and board.

| File | Content |
|---|---|
| `ControlBoard2027_C_BOM_full.csv` | every placed part, grouped by LCSC part / MPN and footprint: source decision, LCSC part, JLC library type, JLC stock, board sets in stock, alternate MPN and vendor PN, rating, and the check results |
| `ControlBoard2027_C_BOM_JLC.csv` | JLCPCB upload file (Comment, Designator, Footprint, LCSC Part #): only the parts JLC places |
| `ControlBoard2027_C_BOM_order_separately.csv` | parts not bought through JLC (Digi-Key / Mouser PNs, stock, price at qty 10), fallbacks, and the loose OLED module |

`ControlBoard2027_C_BOM_JLC.csv` is generated from the schematic fields: every fitted, on-board BOM part with an `LCSC` number,
grouped by `LCSC` part and footprint, Comment = the schematic `Value`. The full BOM takes its part columns (value,
footprint, `LCSC`, `LCSC MPN`, `MPN`, `Vendor PN`, `Rating`) from the same fields; the stock columns are the
2026-11-07 check below.


## Update 2026-11-09 (current)

This section supersedes the older stock and Digi-Key statements below.

- **JLC stock** in `*_BOM_full.csv` was refreshed from the JLCPCB parts API on 2026-11-09 (column `JLC stock 2026-11-09`).
  `Board sets in stock` there counts this board alone; the Samtec LSHM (C3643542, 37 at JLC) is shared by the CB J9 and
  the radio J2, so a CB + radio set is limited to **18**.
- **Digi-Key** part numbers, stock and prices were checked on digikey.com on 2026-11-09 and are in
  `*_BOM_order_separately.csv` (no longer unverified). Mouser figures are still from FindChips, 2026-11-07.
- **Valid Digi-Key regulator PN**: MCP1826S-3302E/DB-ND exists (tube, 1,995 in stock); MCP1826ST-3302E/DBCT-ND (cut tape)
  has 39,364. The AP7361C-33E-13 is 0 at Digi-Key too.
- **Buy and consign** (CB): D7-D11 BB-2020BGR-TRB from Digi-Key 2007-BB-2020BGR-TRBCT-ND (121,957, 1.44 USD at qty 1).
  U11 LSM6DSV320XTR from **Mouser** 511-LSM6DSV320XTR (Digi-Key 497-LSM6DSV320XTRCT-ND is 0, 24-week lead time).
  Tightest JLC parts today: J9 LSHM 37, U2 STM32H723ZGT6 66, U1 TPD6E05U06 336.

## How stock was checked (2026-11-07)

- JLC library type (Basic / Extended) and **JLC stock** (the stock JLC assembles from) come from the JLCPCB parts API
  (`selectSmtComponentList`). LCSC model, brand and package come from the LCSC product API (`wmsc.lcsc.com`). Requests
  were throttled to about 1 per second. The full BOM shows JLC stock. LCSC warehouse stock can differ: C25092 is 0 at
  LCSC and 3.46 M at JLC.
- "Board sets in stock" = JLC stock / quantity per board set. One board set is this controlboard plus one radio
  (Inboard and Overhang have the same BOM). Where a part is also on the radio, both boards are counted.
- Every LCSC part was checked against the schematic `LCSC MPN` (model match) and against the footprint package.
  There were no MPN mismatches and no package mismatches. Where the placed LCSC part differs from the `MPN` field (an
  equivalent part, documented in DESIGN_NOTES §15), the `MPN` is kept as the Digi-Key / Mouser alternate.
- Digi-Key and Mouser block scripted requests. Mouser stock and price come from FindChips (findchips.com). Digi-Key PNs
  are the schematic `Vendor PN` or come from Digi-Key search listings. Digi-Key stock and prices: see the 2026-11-09 update above.

## Summary

| | Lines | Parts per board |
|---|---|---|
| Full BOM | 52 | 174 |
| JLCPCB assembly | 50 (22 Basic, 28 Extended) | 168 |
| Order separately (consign or JLC global sourcing) | 2: D7-D11, U11 | 6 |
| Loose accessory | 1: OLED module for J13 | 1 |

Not in the BOM: H1-H4 (M3 holes), TP1-TP21 (bare test pads), both excluded in the schematic. HR1 / HR2 (M2 radio
standoff pads) exist only on the board and are not in the schematic. The radio standoffs and screws (2x M2, 5 mm
stack) and the 4x M2 nylon OLED standoffs are mechanical hardware and are not listed.

Assembly: 86 parts are on the bottom, so the order needs double-sided assembly. Through-hole parts (JLC THT
assembly): SW1-SW6, J13 socket, J15. J9 has paste-in-hole shield pins (2.00 mm stencil apertures, see DESIGN_NOTES).

## Board-set limits

| Part | Source | Stock | Per set | Board sets |
|---|---|---|---|---|
| J9 (+ radio J2) Samtec LSHM-110-02.5-L-DV-A-S-K-TR | JLC C3643542 | 37 | 2 | **18 (limiting JLC part)** |
| U2 STM32H723ZGT6 | JLC C730146 | 175 | 1 | 175 |
| J3 FTSH-107-01-L-DV-K | JLC C5307809 | 445 | 1 | 445 |
| D7-D11 BB-2020BGR-TRB | Mouser 442-BB2020BGRTB | 2502 | 5 | 500 |
| SW1, SW2, SW4-SW6 PTS636SM43LFS | JLC C2689636 | 3238 | 5 | 647 |
| U11 LSM6DSV320XTR | Mouser 511-LSM6DSV320XTR | 1454 | 1 | 1454 |

Every other line covers more than 700 sets. **The controlboard can be built in at least 18 sets.** The LSHM is shared
with the radio, so a full set is also limited by the radio's U1 (see the radio README: ESP32-C5-WROOM-1U-N8R8 is 0 at
JLC, LCSC and Mouser). If you order the Inboard and Overhang radios in the same set, the LSHM needs 3 per set (12 sets).

## Decisions (applied 2026-11-07)

Applied to the schematic and the board on 2026-11-07 (fields only; footprints, placement and routing unchanged).

1. **U7 AP7361C-33E-13 -> Microchip MCP1826S-3302E/DB, LCSC C638624** (JLC 1766, Extended). The AP7361C-33E-13
   (C500795) is 0 at JLC and LCSC, and 0 at Mouser, Newark and TME. The only in-stock Diodes part, the -33ER, has a
   reversed pinout. Checked against Microchip DS22057B before applying:
   - pinout 1 VIN, 2 GND (tab), 3 VOUT, the same as the AP7361C-33E (1 IN, 2 GND, 3 OUT); no SHDN or sense pin on the
     3-pin part. The KiCad symbol is now `Regulator_Linear:MCP1826S` (same pins and pin positions);
   - footprint `SOT-223-3_TabPin2` unchanged: Microchip's land pattern (1.90 x 0.95 mm leads at 6.10 mm, 1.90 x 3.25 mm
     tab, 2.30 mm pitch) lies inside the KiCad pads (2.0 x 1.5 mm at 6.30 mm, 2.0 x 3.8 mm tab);
   - VIN 2.3-6.0 V (6.5 V absolute); U7 runs from VBUS (5.25 V max), not from the powerboard +5V;
   - dropout 400 mV max at 1 A (about 0.3 V at the 0.75 A worst-case USB load); output 3.3 V +-2.5 %;
   - output capacitor >= 1 uF ceramic, at most 22 uF recommended: C32 10 uF + C36 2.2 uF on the LDO pin. The +3V3 bulk
     sits behind U9 (bench check in TODO 2.2). Input: C31 4.7 uF (the datasheet prefers input >= output capacitance;
     VBUS is held under the USB 10 uF limit);
   - heat: SOT-223 theta-JA 62 °C/W. 0.35 A from 5.25 V is 0.68 W, a 42 °C rise; a 0.75 A peak is 1.46 W (short TX
     bursts; USB power is bench-only). Quiescent current 120 uA typ / 220 uA max.
   Fields set: `Value` MCP1826S-3302E, `MPN` / `LCSC MPN` Microchip MCP1826S-3302E/DB, `LCSC` C638624, `Vendor PN`
   MCP1826S-3302E/DB-ND (Digi-Key, unverified: Digi-Key blocks scripted requests), `Rating`, `Datasheet` (Microchip
   DS22057B), `Description`; the AP7361C-33E-13 is kept as `MPN_ALT` (with `MPN_ALT LCSC` C500795, `Vendor PN ALT`,
   `Datasheet ALT`). C31 / C32 descriptions updated. If C638624 runs out: Mouser 579-MCP1826ST3302EDB
   (MCP1826ST-3302E/DB, the tape-and-reel code of the same part, 17,294 on FindChips 2026-11-07).
2. **J9 LSHM: `LCSC` C3643542** (LCSC lists it as Samtec LSHM-110-02.5-L-DV-A-S-K-TR, the exact MPN), `LCSC MPN` set.
   JLC has 37, enough for 18 sets with the radio J2, so per the house rule it is JLC-assembled. Fallback: Samtec direct
   (5107), Newark 95AC4710 (1776), TTI (750). Mouser and Digi-Key show 0 / unverified. JLC also has
   LSHM-110-02.5-L-DV-A-S-TR (C6217878, 30), which is the same part without the -K pick-up pad; do not use it for
   machine placement.
3. **R69, R72: `LCSC MPN`** UNI-ROYAL 0402WGF1003TCE added, plus `LCSC Datasheet` and `Vendor PN` 311-100KLRCT-ND as on
   the other 100k 0402 parts of the group.
4. **D7-D11 and U11 (order separately, not changed):** `Vendor PN` is the Mouser PN (442-BB2020BGRTB, 511-LSM6DSV320XTR)
   and a new `Sourcing` field names the Mouser and Digi-Key PNs and the reason.

## Open issues

- **D7-D11 BB-2020BGR-TRB** are 0 at JLC and LCSC. Buy 5 per board from Mouser 442-BB2020BGRTB (2502, 0.945 USD at 10)
  or Digi-Key 2007-BB-2020BGR-TRBCT-ND (unverified), and consign them. The only in-stock 2020 DotStar at JLC, OPSCO
  SK9822-EC20 (C2909059, 123k), is **not** a verified drop-in. Its opposite pad pairs match the footprint (SDO-CKO,
  GND-VDD, SDI-CKI), but its pad numbering is different and its drawing is a bottom view, so the chirality is
  unconfirmed (TODO 1.2 also asks whether the BB2020 drawing is a top view). It also differs from the APA102 protocol
  in its global-brightness handling. Use it only after checking both drawings and the firmware driver.
- **U11 LSM6DSV320XTR**: JLC C26633007 shows 8, but its presale count is -12 (oversold), and LCSC has 0. Treat it as
  out of stock. Buy from Mouser 511-LSM6DSV320XTR (1454, 7.88 USD at 10) or Digi-Key 497-LSM6DSV320XTRCT-ND
  (unverified; DK listings say supply is constrained), and consign it. It is LGA-14, so it is not practical to
  hand-solder.
- **OLED module** (J13 accessory): a generic 0.96 in SSD1306 I2C module with pin order GND VCC SCL SDA. Modules with
  VCC first exist and must not be used. Holes 2.8 mm on +-10.25 or +-11.15 x +-11.5 mm. These modules are not stocked
  at Digi-Key / Mouser as a generic part; buy them loose (Amazon / AliExpress). JLC fits the BOOMELE socket (C2718488).
- **Low JLC stock to re-check before ordering**: J9 C3643542 (37), U7 C638624 (1766), U2 C730146 (175; LCSC 88), J3 C5307809 (445),
  U1 C962978 (714), D2 C96228 (804), J1 C114218 (902). JLC also adds attrition parts on small passives; none of the
  low-stock lines are passives.
- Consigned parts (D7-D11, U11) need a JLC consignment (or global-sourcing) order before the PCBA order.
