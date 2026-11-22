# ControlBoard2027 footprint handoff

Updated 2026-11-07 against the ControlBoard2027_C board file and netlist. The datasheets cited as `../datasheets/` are
archived with the prototype, in `../../../prototype/ControlBoard2027/datasheets/`.

`fp-lib-table` registers the project-local `ControlBoard2027` library at
`footprints/ControlBoard2027.pretty`. It must stay with the project when the PCB is opened
elsewhere. Every other footprint comes from the KiCad 10 standard libraries
(`C:/Program Files/KiCad/10.0/share/kicad/footprints/` on this workstation) and is not copied
into the project. DRC reports no library-footprint mismatches on the current board.

## Project-local footprints

| Footprint | Used by | Evidence saved locally | Verification |
|---|---|---|---|
| `ControlBoard2027:TI_TPS2116_DRL0008A` | U8, U9 (TPS2116DRLR) | `../datasheets/TPS2116_DRL0008A.pdf` — SHA-256 `5babd88af...9573ed1d5` | TI DRL0008A land pattern (4224486/G p.23): 0.67 × 0.30 mm pads, 0.50 mm pitch, 1.48 mm between the pad-row centrelines, so pad centres sit at ±0.74 mm. An earlier revision read 1.48 as the inside gap, which put the pads 0.335 mm too far out. |
| `ControlBoard2027:OPSCO_SK9822-EC20` | D7–D11 (since 2026-11-09) | `SK9822-EC20` datasheet Rev A/0 §6 (datasheet.lcsc.com, LCSC C2909059) | Drawn in the datasheet top-view orientation: left column SDO / GND / SDI, right column CKO / VDD / CKI, pin 1 SDO top-left with the pin-1 dot. Copper is the `AmericanBright_BB-2020BGR-TRB` land below turned 90° clockwise (pads 0.80 × 0.60 mm, VCC 0.80 × 0.40 mm, GND 1.00 × 0.40 mm), so the BB-2020 still fits; the SK9822 terminals sit about 0.1 mm inboard of the pad inner edges. Pad numbers follow the schematic symbol (1 VDD, 2 CKO, 3 SDO, 4 SDI, 5 CKI, 6 GND). |
| `ControlBoard2027:AmericanBright_BB-2020BGR-TRB` | (not used; D7–D11 before 2026-11-09) | `../datasheets/BB2020BGR-TRB.pdf`, page 2 "LED Pad Diagram" | Six pads, top view CO/VCC/CI over DO/GND/DI. CO/CI/DO/DI 0.60 × 0.80 mm, VCC 0.40 × 0.80 mm, GND 0.40 × 1.00 mm, 0.40 mm gaps, 2.4 × 2.4 mm field. Replaces `LED_SMD:LED-APA102-2020`, whose three-row pad layout does not match this part: it would put CO on +5V and CI on GND. |
| `ControlBoard2027:ST_LGA-14L_2.5x3mm_P0.5mm` | U11 (LSM6DSV320XTR) | `../datasheets/LSM6DSV320X.pdf` (DS14623) and `../datasheets/LSM6DSK320X.pdf` (DS15060 Rev 1, Fig. 31 package, Fig. 5 pinout) | LGA-14L 2.5 × 3.0 × 0.83 mm, 14 pads at 0.5 mm pitch, package pads 0.25 × 0.475 mm. The DSV320X and the original DSK320X have the same package, pin figure and pin table. Pad centres and numbering match KiCad `LGA-14_3x2.5mm_P0.5mm_LayoutBorder3x4y` (top view: 1–4 left, 5–7 bottom, 8–11 right, 12–14 top). Pad width narrowed from 0.35 to 0.30 mm so adjacent pads keep the board's 0.20 mm clearance. |
| `ControlBoard2027:Adafruit_326_0p96in_STEMMA_QT_Header` | not used (J13 before 2026-11-06) | `vendor_sources/Adafruit-128x64-Monochrome-OLED-PCB/`, commit `51ef8e242dcf460d5effc298d8565110624e6b23` | Exact JP2 `1X08_ROUND_70` pads from `Adafruit 0.96in 128x64 OLED STEMMA QT.brd`; JP2 is R180 in the source, so pad 1 is the right-most header pad in the footprint's source orientation. The module outline is on F.SilkS/F.Fab. The courtyard covers only the header strip, because the module stands on its header pins above low parts. Kept in the library for reference; J13 is now the 4-pin SSD1306 module socket (below). |
| `ControlBoard2027:OLED_0.96in_SSD1306_I2C_Module_Socket_1x04_P2.54mm` | J13 (socket BOOMELE 2.54-1*4P, C2718488) | Taken over from the earlier 6-layer design (2026-11-06); no maker drawing (generic module) | 1x04 2.54 mm female socket for a generic 0.96in 128x64 SSD1306 I2C module (pin order 1 GND, 2 +3V3, 3 SCL, 4 SDA), with four 2.6 mm holes for M2 nylon standoffs under the module corners. Check the module drawing before fabrication: generic modules differ in hole positions and some swap VCC/GND. |
| `ControlBoard2027:Fuse_Bourns_MF-MSMF_1812` | F1, F3, F4 (MF-MSMF075/16X-2, or Littelfuse 1812L075/24DR in the JLCPCB build), F5, F6 (MF-MSMF125/16X-2, or 1812L125/16DR) | `../datasheets/MF-MSMF.pdf` (Rev BD), p.7 recommended land; `../datasheets/Littelfuse_1812L.pdf` p.5 | Two 1.68 × 2.95 mm pads, 3.1 mm gap (pad centres ±2.39 mm), the maker's recommended land for the 1812 style 2 body, with a slightly longer toe for hot-air or hand rework. Littelfuse 1812L: body 4.37-4.73 × 3.07-3.41 mm, bottom terminals 0.3-1.2 mm long; with the pad inner edges at ±1.55 mm the whole terminal lands on the pad up to 0.64 mm terminal length, and at least 0.64 mm of a longer one. |
| `ControlBoard2027:XKB_XKTF-015-N` | not used | `../datasheets/XKTF-015-X.pdf` | The original J1 socket. Kept in the library for reference only; J1 is now the Hirose DM3AT-SF-PEJM5 (below), because Digi-Key does not sell the XKB part. |

J13 takes a generic 0.96in SSD1306 I2C module on a 1x04 socket, held by the socket and four M2 standoffs.

## KiCad library footprints

Each entry was checked against the MPN's package (size code, pin count, pitch).

| References | MPN | Footprint |
|---|---|---|
| J1 | Hirose DM3AT-SF-PEJM5 | `Connector_Card:microSD_HC_Hirose_DM3AT-SF-PEJM5` (KiCad's footprint for this exact part, from the Hirose DM3 drawing; same 1.1 mm contact pitch and pin order as the XKB socket) |
| J2 | GCT USB4110-GF-A | `Connector_USB:USB_C_Receptacle_GCT_USB4110` |
| J3 | Samtec FTSH-107-01-L-DV-K (LCSC C5307809), ST STDC14 pinout | `Connector_PinHeader_1.27mm:PinHeader_2x07_P1.27mm_Vertical_SMD` |
| J4–J8 | JST SM06B-GHS-TB(LF)(SN) (LCSC C133065) | `Connector_JST:JST_GH_SM06B-GHS-TB_1x06-1MP_P1.25mm_Horizontal` |
| J9 | Samtec LSHM-110-02.5-L-DV-A-S-K-TR | `ControlBoard2027:Samtec_LSHM-110-xx.x-x-DV-S_2x10-1SH_P0.50mm_Vertical_PIH` (project library, 2026-11-07: the KiCad stock footprint plus a 2.00 mm round F.Paste aperture on each shield pin (1.5 mm pad + 0.25 mm paste margin) for paste-in-hole soldering, 0.13 mm stencil, per the Samtec drawing rev G; copied from the 30x40 radio project. The stock footprint: Checked against Samtec's recommended layout, rev G: 0.5mm pitch, 0.30 x 1.50mm pads, 3.7mm row pitch, 1.45mm NPTH pegs 1.0mm from the pin-1 row, 1.00mm PTH shield holes 2.00mm from the pegs. The drawing gives the horizontal peg/shield spacing only as lettered dimensions, so those come from the library. The drawing is not archived: Samtec marks it proprietary). Same footprint on the 30x40 radio J2, on its B.Cu |
| J10 | JST SM04B-GHS-TB(LF)(SN) (LCSC C189895) | `Connector_JST:JST_GH_SM04B-GHS-TB_1x04-1MP_P1.25mm_Horizontal` |
| J11, J12 | JST SM08B-GHS-TB(LF)(SN) (LCSC C265111) | `Connector_JST:JST_GH_SM08B-GHS-TB_1x08-1MP_P1.25mm_Horizontal` |
| J15 | JST S7B-PH-K-S(LF)(SN) (LCSC C157917) | `Connector_JST:JST_PH_S7B-PH-K_1x07_P2.00mm_Horizontal` |
| SW1, SW2, SW4–SW6 | APEM MJTP1243 (JLCPCB build: C&K PTS636SM43LFS) | `Button_Switch_THT:SW_PUSH_1P1T_6x3.5mm_H4.3_APEM_MJTP1243` (KiCad's exact MJTP1243 pattern: two pins 6.5 mm apart, 1.3 mm drills). PTS636 THT: 6.0 × 3.5 mm body, pins 6.4 ±0.2 mm apart, maker hole Ø1.2 mm (`../datasheets/CK_PTS636.pdf` p.2), so it fits the same holes |
| SW3 | CTS 209-6MS (JLCPCB build: Hroparts DS-06BP) | `Button_Switch_THT:SW_DIP_SPSTx06_Slide_6.7x16.8mm_W7.62mm_P2.54mm_LowProfile` (cites the CTS 209/210 drawing). DS-06BP: 12 pins, 2.54 mm pitch, 7.62 mm rows, 9.6 × 16.8 mm body inside the SW3 courtyard (`../datasheets/Hroparts_DS-06BP.pdf`). The maker layout asks for Ø0.97 ±0.05 mm holes; the footprint drills 0.8 mm for the 0.60 mm-wide lead, a tight but workable fit |
| D1, D3, D4 | TI TVS0500DRVR | `Package_SON:WSON-6-1EP_2x2mm_P0.65mm_EP1x1.6mm` |
| D2 | Nexperia BZX384-C10,115 | `Diode_SMD:D_SOD-323` |
| D5, D6 | Kingbright APT1608EC | `LED_SMD:LED_0603_1608Metric` |
| Q1 | AOS AO3401A | `Package_TO_SOT_SMD:SOT-23` |
| U1 | TI TPD6E05U06RVZR | `Package_SON:Texas_R-PUSON-N14` |
| U2 | ST STM32H723ZGT6 | `Package_QFP:LQFP-144_20x20mm_P0.5mm` |
| U3–U6, U12–U14, U16, U17 | TI TPD4E05U06DQAR | `Package_SON:USON-10_2.5x1.0mm_P0.5mm` |
| U7 | Microchip MCP1826S-3302E/DB (alternate Diodes AP7361C-33E-13, same pinout) | `Package_TO_SOT_SMD:SOT-223-3_TabPin2` (checked against Microchip land pattern C04-2032A: its 1.90 x 0.95 mm lead pads and 1.90 x 3.25 mm tab lie inside the KiCad pads) |
| U10 | TI SN74AHCT125DR | `Package_SO:SO-14_3.9x8.65mm_P1.27mm` |
| X1 | Abracon ABM8-25.000MHZ-10-B1U-T (JLCPCB build: ABM8-25.000MHZ-10-D1G-T, same package) | `Crystal:Crystal_SMD_3225-4Pin_3.2x2.5mm` |
| H1–H4 | (M3 mounting holes, not in the BOM) | `MountingHole:MountingHole_3.2mm_M3` |
| HR1, HR2 | (radio M2 standoff holes, plated, GND) | `MountingHole_2.2mm_M2_Pad` |
| TP1–TP21 | (bare pads, excluded from the BOM) | `TestPoint:TestPoint_Pad_1.5x1.5mm`; TP6 `TestPoint:TestPoint_Pad_D1.0mm` |

TI package references are archived in `../datasheets/`: `TVS0500_DRV0006A.pdf`,
`TPD4E05U06_DQA0010A.pdf` and `TPD6E05U06_RVZ.pdf`.

## Passives

| Package | Parts |
|---|---|
| 0402 / 1005 metric | All 100 nF decoupling (CL05B104KO5NNNC), C18/C19 12 pF C0G, and the 0402 resistors: SD pull-ups, I²C pull-ups, SPI terminations R6/R15/R16/R65-R68/R70/R71 (30R), R12 (0R), CS and bias pulls, R20/R21, R22/R23, R33/R34. Tight placement at the pin. |
| 0603 / 1608 metric | 1 µF to 10 µF capacitors, C22/C23/C36 2.2 µF X7R, C30 2.2 µF, C38 22 µF 6.3 V, and the power-selection, LED, DIP and button resistors. |
| 0805 / 2012 metric | C28, C33, C37, C42 (22 µF 16 V; no 22 µF 0603 part rated 10 V or more was in stock), C35 (2.2 µF 16 V X7R). There is no 0805 resistor (R16 is 0402 since the compact layout). |

## Primary source URLs

- TI TPS2116: <https://www.ti.com/lit/ds/symlink/tps2116.pdf>
- Hirose DM3AT-SF-PEJM5 (Digi-Key HR1964CT-ND): <https://www.digikey.com/en/products/detail/hirose-electric-co-ltd/DM3AT-SF-PEJM5/2533565>
- XKB drawing (original J1, unused): <https://assets.lcsc.com/datasheet/pdf/86856c43854706f3a389f5c797822ea4.pdf?productCode=C381082>
- Adafruit source: <https://github.com/adafruit/Adafruit-128x64-Monochrome-OLED-PCB>
- Bourns MF-MSMF: <https://www.bourns.com/docs/product-datasheets/mf-msmf.pdf>
- Samtec LSHM footprint: <https://suddendocs.samtec.com/prints/lshm-1xx-xx.x-x-dv-a-x-x-tr-footprint.pdf>
- Samtec LSHM product specification: <https://suddendocs.samtec.com/productspecs/lshm.pdf>
- JST PH series: <https://www.jst-mfg.com/product/pdf/eng/ePH.pdf>
- JST GH series: <https://www.jst-mfg.com/product/pdf/eng/eGH.pdf>
- APEM MJTP (distributor-hosted): <https://www.farnell.com/datasheets/1598766.pdf>
- CTS 209/210 DIP: <https://www.ctscorp.com/wp-content/uploads/209-210.pdf>
