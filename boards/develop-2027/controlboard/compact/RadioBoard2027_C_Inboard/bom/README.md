# RadioBoard2027_C_Inboard BOM

Date: 2026-11-07. Generated from the saved schematic (`kicad-cli sch export netlist --format kicadxml`), cross-checked
against the saved `RadioBoard2027_C_Inboard.kicad_pcb` (pcbnew). All placed symbols match the board footprints in
reference, value and footprint. The BOM-excluded and DNP flags agree between schematic and board. The Inboard and
Overhang radios have the same BOM; only the placement differs. Their full BOMs are identical line for line.

| File | Content |
|---|---|
| `RadioBoard2027_C_Inboard_BOM_full.csv` | every placed part, grouped by LCSC part / MPN and footprint: source decision, LCSC part, JLC library type, JLC stock, board sets in stock, alternate MPN and vendor PN, rating, and the check results |
| `RadioBoard2027_C_Inboard_BOM_JLC.csv` | JLCPCB upload file (Comment, Designator, Footprint, LCSC Part #): only the parts JLC places |
| `RadioBoard2027_C_Inboard_BOM_order_separately.csv` | U1 and ANT1 with Digi-Key / Mouser PNs, stock and price at qty 10, plus the fallback and alternate lines |

`RadioBoard2027_C_Inboard_BOM_JLC.csv` is generated from the schematic fields: every fitted, on-board BOM part with an `LCSC` number,
grouped by `LCSC` part and footprint, Comment = the schematic `Value`. The full BOM takes its part columns (value,
footprint, `LCSC`, `LCSC MPN`, `MPN`, `Vendor PN`, `Rating`) from the same fields; the stock columns are the
2026-11-07 check below.

## How stock was checked (2026-11-07)

- JLC library type (Basic / Extended) and **JLC stock** come from the JLCPCB parts API (`selectSmtComponentList`).
  LCSC model, brand and package come from the LCSC product API (`wmsc.lcsc.com`). Requests were throttled to about
  1 per second.
- "Board sets in stock" = JLC stock / quantity per board set. One board set is one radio plus one controlboard.
  Parts shared with the controlboard are counted on both boards. The two radio variants count as the same BOM.
- Every LCSC part was checked against the schematic `LCSC MPN` (model match) and against the footprint package.
  There were no MPN mismatches and no package mismatches.
- Digi-Key and Mouser block scripted requests. Mouser stock and price come from FindChips (findchips.com). Digi-Key PNs
  are the schematic `Vendor PN` or come from Digi-Key search listings. **Digi-Key stock and prices are unverified.**

## Summary

| | Lines | Parts per board |
|---|---|---|
| Full BOM | 28 (incl. the DNP line) | 40 fitted, plus C4 DNP |
| JLCPCB assembly | 25 (12 Basic, 13 Extended) | 38 |
| Order separately | 2: U1 (consign), ANT1 (loose accessory) | 2 |
| DNP | 1: C4 15 pF (not fitted, not in the JLC file) | 1 |

Not in the BOM: TP1-TP3 (bare pads, excluded in the schematic). H1 / H2 (M2 standoff holes) exist only on the board.
The two M2 standoffs and screws for the 5 mm stack are mechanical hardware and are not listed. ANT1 is a BOM-only
symbol (not on the board): it is fitted only with the WROOM-1U.

Assembly: 16 parts are on the bottom (including J2 and the DNP C4), so the order needs double-sided assembly. There
are no through-hole parts. J2 has paste-in-hole shield pins (2.00 mm B.Paste apertures, see DESIGN_NOTES).

## Board-set limits

| Part | Source | Stock | Per set | Board sets |
|---|---|---|---|---|
| U1 ESP32-C5-WROOM-1U-N8R8 | Mouser 356-ESP32C5WRM1UN8R8 / Digi-Key product 27566801 | Mouser 0; JLC / LCSC 0; Digi-Key unverified (20-week lead time listed) | 1 | **0 confirmed (limiting)** |
| J2 (+ CB J9) Samtec LSHM-110-02.5-L-DV-A-S-K-TR | JLC C3643542 | 37 | 2 | 18 |
| ANT1 Taoglas FXP831.07.0100C | Mouser 960-FXP831070100C | 869 | 1 | 869 |
| U4 (+ CB U7) MCP1826S-3302E/DB | JLC C638624 | 1766 | 2 | 883 |
| D1 APT1608SGC | JLC C5875754 | 967 (presale 323) | 1 | 967 (323 free) |

Every other line covers more than 1000 sets. **Without a confirmed WROOM-1U source, the radio is limited by U1.**
With U1 in hand, the limit is 18 sets (LSHM shared with the controlboard). If you build Inboard and Overhang radios for
the same set, the LSHM needs 3 per set, which gives 12 sets.

## Decisions (applied 2026-11-07)

Applied to the schematic and the board on 2026-11-07 (fields only; footprints, placement and routing unchanged).
Inboard and Overhang carry identical fields.

1. **U4 AP7361C-33E-13 -> Microchip MCP1826S-3302E/DB, LCSC C638624** (JLC 1766, Extended). The AP7361C-33E-13
   (C500795) is 0 at JLC and LCSC, and 0 at Mouser, Newark and TME. The in-stock -33ER has a reversed pinout. Checked
   against Microchip DS22057B before applying:
   - pinout 1 VIN, 2 GND (tab), 3 VOUT, the same as the AP7361C-33E; no SHDN or sense pin. The KiCad symbol is now
     `Regulator_Linear:MCP1826S` (same pins and pin positions); footprint `SOT-223-3_TabPin2` unchanged (Microchip's
     land pattern lies inside its pads);
   - VIN 2.3-6.0 V against USB VBUS (5.25 V max); dropout 400 mV max at 1 A, about 160 mV at the 403 mA module peak,
     so 3.3 V holds from about 3.5 V; output 3.3 V +-2.5 %;
   - output capacitor >= 1 uF ceramic, at most 22 uF recommended: C6 10 uF on the VOUT pin; C8 / C1 sit behind U3
     (bench check in TODO 2.2). Input: C5 4.7 uF (USB 10 uF limit);
   - heat: 0.403 A from 5.25 V is 0.79 W; with the SOT-223 theta-JA of 62 °C/W a 49 °C rise even if continuous.
   Fields set as on the controlboard U7 (`Value`, `MPN`, `LCSC`, `LCSC MPN`, `Vendor PN` MCP1826S-3302E/DB-ND
   (unverified), `Rating`, `Datasheet`, `Description`; AP7361C-33E-13 as `MPN_ALT`); C6 description updated.
2. **J2 LSHM: `LCSC` C3643542** (exact MPN LSHM-110-02.5-L-DV-A-S-K-TR at LCSC) and `LCSC MPN` set. JLC has 37
   (2 per set with CB J9 = 18 sets), so per the house rule it is JLC-assembled. Fallback: Samtec direct (5107), Newark
   95AC4710 (1776), TTI (750).
3. **U1 and ANT1 (order separately, not changed):** `Vendor PN` is the Mouser PN and a new `Sourcing` field names the
   Mouser and Digi-Key PNs. ANT1's `Vendor PN` changed from Digi-Key 931-1121-ND to Mouser 960-FXP831070100C (stock
   verified there).

## Open issues

- **U1 ESP32-C5-WROOM-1U-N8R8 (primary module) has no confirmed stock.** It is 0 at JLC and LCSC (C51950748), and
  every WROOM-1U variant there is 0, with V1.2 parts oversold. Mouser 356-ESP32C5WRM1UN8R8 shows 0 (5.83 USD at 10).
  Digi-Key product 27566801 exists, but its stock is unverified (a regional listing shows a 20-week lead time). Check
  Digi-Key by hand, or order with lead time, then consign.
  - Fallback build (MPN_ALT, PCB antenna, same dual footprint, ANT1 not fitted): ESP32-C5-WROOM-1-N8R8, Mouser
    356-ESP32C5WROM1N8R8 **948 in stock** (4.96 USD at 10). LCSC C51950749 is 0.
  - JLC-stocked option for the fallback build: ESP32-C5-WROOM-1-N16R8-V1.2, C54951859 (377 at JLC). It is the same
    WROOM-1 package and pinout with 16 MB flash and the v1.2 chip revision. Check the ESP-IDF version supports v1.2
    before choosing it. It is a PCB-antenna module, so on the Inboard the antenna sits over controlboard copper
    (see the variant table in `../../README.md`).
- **ANT1 Taoglas FXP831.07.0100C**: LCSC C6258568 is 0. Buy loose from Mouser 960-FXP831070100C (869, 5.53 USD at 10)
  or Digi-Key 931-1121-ND (unverified). Only needed with the WROOM-1U. The 5 GHz gain question is open
  (DESIGN_NOTES).
- **C4** 15 pF (Murata GRM1555C1H150JA01D) is DNP: listed, not ordered.
- **Low JLC stock to re-check before ordering**: J2 C3643542 (37), U4 C638624 (1766), D1 C5875754 (967, but only 323 free after presale).
