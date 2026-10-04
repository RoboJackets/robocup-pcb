# ControlBoard2027 footprint handoff

Updated 2026-10-04 from the current board file (references follow the current annotation).

`fp-lib-table` registers the project-local `ControlBoard2027` library at
`footprints/ControlBoard2027.pretty`. It must stay with the project when the PCB is opened
elsewhere. Every other footprint comes from the KiCad 10 standard libraries
(`C:/Program Files/KiCad/10.0/share/kicad/footprints/` on this workstation) and is not copied
into the project. DRC reports no library-footprint mismatches on the current board.

## Project-local footprints

| Footprint | Used by | Evidence saved locally | Verification |
|---|---|---|---|
| `ControlBoard2027:TI_TPS2116_DRL0008A` | U8, U9 (TPS2116DRLR) | `../datasheets/TPS2116_DRL0008A.pdf` — SHA-256 `5babd88af...9573ed1d5` | TI DRL0008A land pattern (4224486/G p.23): 0.67 × 0.30 mm pads, 0.50 mm pitch, 1.48 mm between the pad-row centrelines, so pad centres sit at ±0.74 mm. An earlier revision read 1.48 as the inside gap, which put the pads 0.335 mm too far out. |
| `ControlBoard2027:AmericanBright_BB-2020BGR-TRB` | D7–D11 | `../datasheets/BB2020BGR-TRB.pdf`, page 2 "LED Pad Diagram" | Six pads, top view CO/VCC/CI over DO/GND/DI. CO/CI/DO/DI 0.60 × 0.80 mm, VCC 0.40 × 0.80 mm, GND 0.40 × 1.00 mm, 0.40 mm gaps, 2.4 × 2.4 mm field. Replaces `LED_SMD:LED-APA102-2020`, whose three-row pad layout does not match this part: it would put CO on +5V and CI on GND. |
| `ControlBoard2027:ST_LGA-14L_2.5x3mm_P0.5mm` | U11 (LSM6DSV320XTR) | `../datasheets/LSM6DSV320X.pdf` (DS14623) and `../datasheets/LSM6DSK320X.pdf` (DS15060 Rev 1, Fig. 31 package, Fig. 5 pinout) | LGA-14L 2.5 × 3.0 × 0.83 mm, 14 pads at 0.5 mm pitch, package pads 0.25 × 0.475 mm. The DSV320X and the original DSK320X have the same package, pin figure and pin table. Pad centres and numbering match KiCad `LGA-14_3x2.5mm_P0.5mm_LayoutBorder3x4y` (top view: 1–4 left, 5–7 bottom, 8–11 right, 12–14 top). Pad width narrowed from 0.35 to 0.30 mm so adjacent pads keep the board's 0.20 mm clearance. |
| `ControlBoard2027:Adafruit_326_0p96in_STEMMA_QT_Header` | J13 | `vendor_sources/Adafruit-128x64-Monochrome-OLED-PCB/`, commit `51ef8e242dcf460d5effc298d8565110624e6b23` | Exact JP2 `1X08_ROUND_70` pads from `Adafruit 0.96in 128x64 OLED STEMMA QT.brd`; JP2 is R180 in the source, so pad 1 is the right-most header pad in the footprint's source orientation. The module outline is on F.SilkS/F.Fab. The courtyard covers only the header strip, because the module stands on its header pins above low parts. The mating 1x8 socket is BOM line SK1. |
| `ControlBoard2027:Fuse_Bourns_MF-MSMF_1812` | F1, F3, F4 (MF-MSMF075/16X-2), F5, F6 (MF-MSMF125/16X-2) | `../datasheets/MF-MSMF.pdf` (Rev BD), p.7 recommended land | Two 1.68 × 2.95 mm pads, 3.1 mm gap (pad centres ±2.39 mm), the maker's recommended land for the 1812 style 2 body, with a slightly longer toe for hot-air or hand rework. |
| `ControlBoard2027:XKB_XKTF-015-N` | not used | `../datasheets/XKTF-015-X.pdf` | The original J1 socket. Kept in the library for reference only; J1 is now the Hirose DM3AT-SF-PEJM5 (below), because Digi-Key does not sell the XKB part. |

The OLED module is 29.21 × 31.75 mm. On this board it is held by its header pins only.
The footprint's silkscreen/fab outline shows the module size, and no mounting holes are placed.

## KiCad library footprints

Each entry was checked against the MPN's package (size code, pin count, pitch).

| References | MPN | Footprint |
|---|---|---|
| J1 | Hirose DM3AT-SF-PEJM5 | `Connector_Card:microSD_HC_Hirose_DM3AT-SF-PEJM5` (KiCad's footprint for this exact part, from the Hirose DM3 drawing; same 1.1 mm contact pitch and pin order as the XKB socket) |
| J2 | GCT USB4110-GF-A | `Connector_USB:USB_C_Receptacle_GCT_USB4110` |
| J3 | Samtec TSW-105-07-G-S | `Connector_PinHeader_2.54mm:PinHeader_1x05_P2.54mm_Vertical` |
| J4–J8 | JST B6B-PH-K-S(LF)(SN) | `Connector_JST:JST_PH_B6B-PH-K_1x06_P2.00mm_Vertical` |
| J9 | Samtec LSHM-110-02.5-L-DV-A-S-K-TR | `Connector_Samtec:Samtec_LSHM-110-xx.x-x-DV-S_2x10-1SH_P0.50mm_Vertical` (KiCad stock. Checked against Samtec's recommended layout, rev G: 0.5mm pitch, 0.30 x 1.50mm pads, 3.7mm row pitch, 1.45mm NPTH pegs 1.0mm from the pin-1 row, 1.00mm PTH shield holes 2.00mm from the pegs. The drawing gives the horizontal peg/shield spacing only as lettered dimensions, so those come from the library. The drawing is not archived: Samtec marks it proprietary). Same footprint on RadioBoard2027 J2, on B.Cu |
| J10 | JST B3B-PH-K-S(LF)(SN) | `Connector_JST:JST_PH_B3B-PH-K_1x03_P2.00mm_Vertical` |
| J11, J12 | JST B4B-PH-K-S(LF)(SN) | `Connector_JST:JST_PH_B4B-PH-K_1x04_P2.00mm_Vertical` |
| J14, J17 | Samtec TSW-102-07-G-D | `Connector_PinHeader_2.54mm:PinHeader_2x02_P2.54mm_Vertical` |
| J15 | JST B8B-XH-A(LF)(SN) | `Connector_JST:JST_XH_B8B-XH-A_1x08_P2.50mm_Vertical` |
| J16, J18 | Samtec TSW-103-07-G-D | `Connector_PinHeader_2.54mm:PinHeader_2x03_P2.54mm_Vertical` |
| SW1, SW2, SW4–SW6 | APEM MJTP1243 | `Button_Switch_THT:SW_PUSH_1P1T_6x3.5mm_H4.3_APEM_MJTP1243` (KiCad's exact MJTP1243 pattern) |
| SW3 | CTS 209-6MS | `Button_Switch_THT:SW_DIP_SPSTx06_Slide_6.7x16.8mm_W7.62mm_P2.54mm_LowProfile` (cites the CTS 209/210 drawing) |
| D1, D3, D4 | TI TVS0500DRVR | `Package_SON:WSON-6-1EP_2x2mm_P0.65mm_EP1x1.6mm` |
| D2 | Nexperia BZX384-C10,115 | `Diode_SMD:D_SOD-323` |
| D5, D6 | Kingbright APT1608EC | `LED_SMD:LED_0603_1608Metric` |
| Q1 | AOS AO3401A | `Package_TO_SOT_SMD:SOT-23` |
| U1 | TI TPD6E05U06RVZR | `Package_SON:Texas_R-PUSON-N14` |
| U2 | ST STM32H723ZGT6 | `Package_QFP:LQFP-144_20x20mm_P0.5mm` |
| U3 | ST USBLC6-2SC6 | `Package_TO_SOT_SMD:SOT-23-6` |
| U4–U6, U12–U14 | TI TPD4E05U06DQAR | `Package_SON:USON-10_2.5x1.0mm_P0.5mm` |
| U7 | Diodes AP7361C-33E-13 | `Package_TO_SOT_SMD:SOT-223-3_TabPin2` |
| U10 | TI SN74AHCT125DR | `Package_SO:SO-14_3.9x8.65mm_P1.27mm` |
| X1 | Abracon ABM8-25.000MHZ-10-B1U-T | `Crystal:Crystal_SMD_3225-4Pin_3.2x2.5mm` |
| H1–H4 | (M3 mounting holes, not in the BOM) | `MountingHole:MountingHole_3.2mm_M3` |
| TP1–TP21 | (bare pads, excluded from the BOM) | `TestPoint:TestPoint_Pad_1.5x1.5mm` |

TI package references are archived in `../datasheets/`: `TVS0500_DRV0006A.pdf`,
`TPD4E05U06_DQA0010A.pdf` and `TPD6E05U06_RVZ.pdf`.

## Passives

| Package | Parts |
|---|---|
| 0402 / 1005 metric | All 100 nF decoupling (CL05B104KO5NNNC), C18/C19 12 pF C0G, and the 0402 resistors: SD pull-ups, I²C pull-ups, SPI terminations R6/R15/R65/R66 (30R), R12 (0R), CS and bias pulls, R20/R21, R22/R23, R33/R34. Tight placement at the pin. |
| 0603 / 1608 metric | 1 µF to 10 µF capacitors, C22/C23/C36 2.2 µF X7R, C30 2.2 µF, C38 22 µF 6.3 V, and the power-selection, LED, DIP and button resistors. |
| 0805 / 2012 metric | C28, C33, C37, C42 (22 µF 16 V; no 22 µF 0603 part rated 10 V or more was in stock, DESIGN_NOTES §14), C35 (2.2 µF 16 V X7R), and R16 (30R). R16 is the one 0805 resistor: it was not moved to 0402 because MOTOR_SPI_MISO is routed between its pads (DESIGN_NOTES §13). |

## Primary source URLs

- TI TPS2116: <https://www.ti.com/lit/ds/symlink/tps2116.pdf>
- Hirose DM3AT-SF-PEJM5 (Digi-Key HR1964CT-ND): <https://www.digikey.com/en/products/detail/hirose-electric-co-ltd/DM3AT-SF-PEJM5/2533565>
- XKB drawing (original J1, unused): <https://assets.lcsc.com/datasheet/pdf/86856c43854706f3a389f5c797822ea4.pdf?productCode=C381082>
- Adafruit source: <https://github.com/adafruit/Adafruit-128x64-Monochrome-OLED-PCB>
- Bourns MF-MSMF: <https://www.bourns.com/docs/product-datasheets/mf-msmf.pdf>
- Samtec TSW headers: <https://suddendocs.samtec.com/catalog_english/tsw_th.pdf>
- Samtec LSHM footprint: <https://suddendocs.samtec.com/prints/lshm-1xx-xx.x-x-dv-a-x-x-tr-footprint.pdf>
- Samtec LSHM product specification: <https://suddendocs.samtec.com/productspecs/lshm.pdf>
- JST PH series: <https://www.jst-mfg.com/product/pdf/eng/ePH.pdf>
- JST XH series: <https://www.jst-mfg.com/product/pdf/eng/eXH.pdf>
- APEM MJTP (distributor-hosted): <https://www.farnell.com/datasheets/1598766.pdf>
- CTS 209/210 DIP: <https://www.ctscorp.com/wp-content/uploads/209-210.pdf>
