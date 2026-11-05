# ControlBoard2027 source archive

2026-11-03 JLCPCB sourcing addendum (substitutes fitted in the JLCPCB build, DESIGN_NOTES §14.1):

| Local file | Source | SHA-256 | Use |
|---|---|---|---|
| [Littelfuse_1812L.pdf](Littelfuse_1812L.pdf) | [LCSC copy](https://datasheet.lcsc.com/datasheet/pdf/f489f06aaead3504c46a5f46e8004a19.pdf?productCode=C207065) of the Littelfuse 1812L datasheet (revised 07/21/17) | `6208de21968a51c9...bcec59d92` | F1/F3/F4 1812L075/24DR and F5/F6 1812L125/16DR: ratings p.1, derating p.2, dimensions and pad layout p.5 |
| [CK_PTS636.pdf](CK_PTS636.pdf) | [LCSC copy](https://datasheet.lcsc.com/datasheet/pdf/229e2204c94be8eac226511395a363de.pdf?productCode=C2689636) of the C&K PTS636 datasheet (7 Oct 20) | `2015aeeef741ee7e...851ef5dceb` | SW1/SW2/SW4-SW6 PTS636SM43LFS: THT drawing and PCB land p.2 |
| [Hroparts_DS-06BP.pdf](Hroparts_DS-06BP.pdf) | [LCSC copy](https://datasheet.lcsc.com/datasheet/pdf/58c923485d5c652775c00f938a3bb4f1.pdf?productCode=C129072) of the Hroparts DS-xxBP drawing | `468a42735fa67054...67599a993a7d1` | SW3 DS-06BP: body, pitch and row spacing |

`lsm6dsv32x.pdf` (ST LSM6DSV32X, downloaded by the user from st.com, SHA-256 `aaa818cafdb8a0ad...c74784c2bb330`) was checked as a JLCPCB-stocked IMU: same LGA-14L pins, but no ±320g high-g channel, so U11 stays the LSM6DSV320X (DESIGN_NOTES §14.1).
The X1 option D1G is in the existing `ABM8.pdf` (option codes on p.1; the archived copy is
identical to the publisher file on 2026-11-03). The other JLCPCB substitutes (Samsung CL MLCCs, Fenghua 0402CG for C18/C19, UNI-ROYAL 1% chip
resistors, hanxia headers J3/J14/J17, BOOMELE socket SK1) are linked from each symbol's
`LCSC Datasheet` field (LCSC copies).

2026-10-04 sourcing addendum:

| Local file | Source | Use |
|---|---|---|
| [LSM6DSV320X.pdf](LSM6DSV320X.pdf) | [Publisher PDF](https://www.st.com/resource/en/datasheet/lsm6dsv320x.pdf) (DS14623) | U11 as fitted. Pin table, package and ranges compared with DS15060 (LSM6DSK320X) |

Parts added on 2026-10-04 link their Digi-Key product page, which carries the maker datasheet:
J1 Hirose DM3AT-SF-PEJM5, C35 Samsung CL21B225KOFNNNE, C1/C5/C32/C34 Taiyo Yuden
LMK107BBJ106MALT, C38 Taiyo Yuden JMK107BBJ226MA-T, C7/C11/C31 TDK C1608X5R1C475K080AC,
R6/R15/R65/R66 Stackpole RMCF0402FT30R0, R12 Stackpole RMCF0402ZT0R00, SH1-SH6 Samtec
SNT-100-BK-G, SK1 Sullins PPTC081LFBN-RC, and the Yageo RC-series resistors. C28/C33/C37/C42
(Samsung CL21A226MOQNNNE) link the Samsung spec sheet. The XKB socket drawing
(`XKTF-015-X.pdf`) and `LSM6DSK320X.pdf` describe parts no longer fitted. All datasheet links
were checked on 2026-10-04.

2026-09-26 bypass addendum: [Samtec TSW header catalog](Samtec_TSW_headers.pdf) and [Samtec SNT shunt catalog](Samtec_SNT_shunts.pdf) are now archived. `bypass_download_manifest.json` records publisher URLs and hashes. See DESIGN_NOTES.md §4 (jumpers J14/J16/J17/J18) for their application. The older file count and table below describe the earlier download batch, not the complete current archive.

2026-09-26 footprint addendum: the package drawings used for the project-local
footprints are saved as `TPS2116_DRL0008A.pdf`, `TVS0500_DRV0006A.pdf`,
`TPD4E05U06_DQA0010A.pdf`, `TPD6E05U06_RVZ.pdf`, and `XKTF-015-X.pdf`.
Their original URLs and SHA-256 records are in
`../footprints/FOOTPRINT_SOURCES.md`. The official Adafruit product 326 board
source is archived at `../footprints/vendor_sources/Adafruit-128x64-Monochrome-OLED-PCB/`.
TP1–TP21 are bare 1.5 x 1.5 mm SMD pads (KiCad TestPoint_Pad_1.5x1.5mm); no part is fitted,
so they carry no datasheet.

2026-09-26 mechanical-footprint addendum: the remaining generic connectors and
switches have been resolved and their manufacturer PDFs saved locally:

| Local file | Publisher source | SHA-256 | Schematic use |
|---|---|---|---|
| `JST_GH_eGH.pdf` | <https://www.jst-mfg.com/product/pdf/eng/eGH.pdf> | `b1dcb317b6b9a4fb...c161240b722` | Superseded (J9 is now the Samtec LSHM mezzanine; J10-J12 are JST PH) |
| `Samtec_LSHM_spec.pdf` | <https://suddendocs.samtec.com/productspecs/lshm.pdf> | `935cb14c85a2635b...d167188eef2d` | J9 (and RadioBoard2027 J2), LSHM-110-02.5-L-DV-A-S-K-TR: ratings (§3) |
| `TL3305.pdf` | <https://www.e-switch.com/wp-content/uploads/2023/01/TL3305.pdf> | `d3eebf2769e7acb5...d297712ded8` | Superseded (SW1, SW2, SW4-SW6 are now THT 6 x 3.5mm: APEM MJTP1243, or C&K PTS636SM43LFS in the JLCPCB build) |
| `Omron_A6H.pdf` | <https://omronfs.omron.com/en_US/ecb/products/pdf/en-a6h.pdf> | `549aac2e0c9c8065...6e99a0761b` | Superseded (SW3 is now a THT slide DIP: CTS 209-6MS, or Hroparts DS-06BP in the JLCPCB build) |
| `APEM_MJTP.pdf` | <https://www.farnell.com/datasheets/1598766.pdf> | `18798777e6260eeb...65a4d5fb3c1` | SW1, SW2, SW4-SW6, APEM MJTP1243 (distributor-hosted APEM datasheet; the apem.com link is dead) |
| `CTS_209-210.pdf` | <https://www.ctscorp.com/wp-content/uploads/209-210.pdf> | `652105dcaa2d6ef8...eaf3502ad` | SW3, 209-6MS (6 positions, medium actuator, bottom seal) |

J3's Samtec TSW header catalog was already archived as
`Samtec_TSW_headers.pdf`; it is linked from the J3 symbol (MPN TSW-105-07-G-S).
J4-J8 and J10-J12 link the JST PH catalog <https://www.jst-mfg.com/product/pdf/eng/ePH.pdf>.

Updated 2026-09-16. Fourteen complete PDF files are saved locally. `download_manifest.json`
records sources, byte counts, SHA-256 hashes and failed transfers. File names retain the
original reference tags; the revision printed inside each downloaded PDF is authoritative.

## Downloaded references

| Local file | Source | Use |
|---|---|---|
| [SLVSFG1A_TPS2116.pdf](SLVSFG1A_TPS2116.pdf) | [Publisher PDF](https://www.ti.com/lit/ds/symlink/tps2116.pdf) | Shared source/current limits |
| [DS37274_AP7361C.pdf](DS37274_AP7361C.pdf) | [Publisher PDF](https://www.diodes.com/assets/Datasheets/AP7361C.pdf) | USB LDO current and thermal budget |
| [TVS0500.pdf](TVS0500.pdf) | [Publisher PDF](https://www.ti.com/lit/ds/symlink/tvs0500.pdf) | Background component reference in DESIGN_NOTES |
| [AO3401A.pdf](AO3401A.pdf) | [Publisher PDF](https://www.aosmd.com/res/datasheets/AO3401A.pdf) | Background component reference in DESIGN_NOTES |
| [SCLS264R_SN74AHCT125.pdf](SCLS264R_SN74AHCT125.pdf) | [Publisher PDF](https://www.ti.com/lit/ds/symlink/sn74ahct125.pdf) | U10 level shifter; TP18/TP19 probe the chain input, TP20/TP21 the output |
| [BMI088.pdf](BMI088.pdf) | [Publisher PDF](https://www.bosch-sensortec.com/media/boschsensortec/downloads/datasheets/bst-bmi088-ds001.pdf) | Superseded: the previous IMU, replaced by LSM6DSK320X |
| [LSM6DSK320X.pdf](LSM6DSK320X.pdf) | [Publisher PDF](https://www.st.com/resource/en/datasheet/lsm6dsk320x.pdf) (copy obtained from the datasheet4u mirror because st.com timed out; DS15060 Rev 1, July 2026) | U11 IMU pinout, mode-1 wiring, I2C address, package |
| [LSM6DSK320X_DB5732.pdf](LSM6DSK320X_DB5732.pdf) | [Publisher PDF](https://www.st.com/resource/en/data_brief/lsm6dsk320x.pdf) (DB5732 Rev 1) | Cross-check of pin table and package |
| [BB2020BGR-TRB.pdf](BB2020BGR-TRB.pdf) | [Publisher PDF](https://americanbrightled.com/pdffiles/led-components/plcc/BB-2020BGR-TRB.pdf) | Actual fitted LED family, pinout and 5V data/clock probing |
| [ABM8.pdf](ABM8.pdf) | [Publisher PDF](https://abracon.com/Resonators/abm8.pdf) | Background component reference in DESIGN_NOTES |
| [SLVSBO7O_TPD6E05U06.pdf](SLVSBO7O_TPD6E05U06.pdf) | [Publisher PDF](https://www.ti.com/lit/ds/symlink/tpd6e05u06.pdf) | Background component reference in DESIGN_NOTES |
| [SSD1306.pdf](SSD1306.pdf) | [Publisher PDF](https://cdn-shop.adafruit.com/datasheets/SSD1306.pdf) | Background component reference in DESIGN_NOTES |
| [ESP32-C5.pdf](ESP32-C5.pdf) | [Publisher PDF](https://documentation.espressif.com/esp32-c5_datasheet_en.pdf) | Background component reference in DESIGN_NOTES |
| [ESP32-C5-WROOM-1U.pdf](ESP32-C5-WROOM-1U.pdf) | [Publisher PDF](https://documentation.espressif.com/esp32-c5-wroom-1_wroom-1u_datasheet_en.pdf) | Radio TX current budget |
| [MF-MSMF.pdf](MF-MSMF.pdf) | [Publisher PDF](https://www.bourns.com/docs/product-datasheets/mf-msmf.pdf) | F1-F6 ratings and thermal derating for the Bourns alternate; the JLCPCB build fits Littelfuse 1812L (`Littelfuse_1812L.pdf`) |
| [SLVA689_I2C_pullups.pdf](SLVA689_I2C_pullups.pdf) | [Publisher PDF](https://www.ti.com/lit/an/slva689/slva689.pdf) | Equations 1/6, common 2.2k pull-ups and rise-time budget |

The BB2020 document is American Bright's actual BB-2020BGR-TRB datasheet, not a generic
APA102 substitute. SSD1306 is the manufacturer-authored document hosted by Adafruit.

## Reviewed online but download still blocked

Direct ST HTTPS downloads repeatedly timed out/reset; alternate ST/distributor URLs also
failed. These two primary documents were read using the web document viewer before the
related schematic decisions, but are NOT saved locally:

- `DS13313_STM32H723.pdf` (Rev 4, mirror <https://akizukidenshi.com/goodsaffix/stm32h723zg.pdf>, SHA-256 `fbc40860193f0831...9c831e8925dc`; st.com times out): Tables 9, 10 and 50 back the R33/R34 UART series resistors.
- [DS13313 Rev 5](https://www.st.com/resource/en/datasheet/stm32h723zg.pdf): §6.3.17/Table 57 permanent NRST pull-up; Figure 18 reset capacitor.
- [AN5419 Rev 3](https://www.st.com/resource/en/application_note/an5419-getting-started-with-stm32h723733-stm32h725735-and-stm32h730-mcu-hardware-development-stmicroelectronics.pdf): §6.3.4/Figure 21 direct debug connection; §9.4.1 SDMMC routing for all bus lines. Archive as `AN5419_STM32H723_hardware.pdf` when access works.

## Other references not yet archived

- `USBLC6-2.pdf`: [source](https://www.st.com/resource/en/datasheet/usblc6-2.pdf); transfer failed, no local PDF.
- `AN2606_STM32_bootloader.pdf`: [source](https://www.st.com/resource/en/application_note/an2606-stm32-microcontroller-system-memory-boot-mode-stmicroelectronics.pdf); transfer failed, no local PDF.
- `RM0468_STM32H723.pdf`: [source](https://www.st.com/resource/en/reference_manual/rm0468-stm32h723733-stm32h725735-and-stm32h730-value-line-advanced-armbased-32bit-mcus-stmicroelectronics.pdf); transfer failed, no local PDF.
- `SD_Physical_Layer.pdf`: [source](https://www.sdcard.org/cms/wp-content/themes/sdcard-org/dl.php?f=Part1_Physical_Layer_Simplified_Specification_Ver6.00.pdf); transfer failed, no local PDF.

- [USB 2.0 specification and ECNs](https://www.usb.org/document-library/usb-20-specification): not archived.
- [USB Type-C specification](https://www.usb.org/document-library/usb-type-cr-cable-and-connector-specification): not archived.
- [Adafruit 326 OLED board source](https://github.com/adafruit/Adafruit-128x64-Monochrome-OLED-PCB): archived at `../footprints/vendor_sources/Adafruit-128x64-Monochrome-OLED-PCB/` for footprint derivation.
- [ESP-Hosted software](https://github.com/espressif/esp-hosted-mcu): not archived.
- XKTF-015 socket drawing: archived as `XKTF-015-X.pdf`; the APEM MJTP1243 datasheet is archived as `APEM_MJTP.pdf` (the footprint is KiCad's MJTP1243 pattern).
- V0.3 firmware report and other board comparisons are repository references, not vendor datasheets.

This archive is incomplete; missing downloads must not be represented as reviewed local files.
The inherited design notes contain other component/connector claims outside this feedback audit.
