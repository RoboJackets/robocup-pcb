# ControlBoard2027_4L + RadioBoard2027: 4-layer set

`../ControlBoard2027_4L` is the 6-layer controlboard (`../../6layer/ControlBoard2027_6L`) converted to
4 layers. The schematic, placement, top-layer routing and silkscreen are those of the 6-layer board,
except:
- the stackup;
- the layer of the old inner signal routes;
- the via-in-pad rework below.

From the via-in-pad rework on, this board diverges from the 6-layer one. An earlier 4-layer redesign
of the prototype was retired on 2026-11-04 and archived outside the repo.

Firmware: the 4-layer and 6-layer boards share one schematic and one STM32 pin map, so one firmware
build runs on both. Every pin and peripheral change against the prototype (STM32 and ESP32) is in
[FIRMWARE.md](FIRMWARE.md). The radio board is described in [RADIO.md](RADIO.md).

## Radio board: RadioBoard2027

`../RadioBoard2027` is the same radio board as `../../6layer/RadioBoard2027` (rev B, 4 layers,
JLC04161H-7628). J9 and H5-H8 sit in the same place on both controlboards.
- The two copies differ only in the J2 note and the part descriptions, which name their controlboard.
- The design notes and TODO in that folder apply unchanged.
- Checks on this copy:
  - DRC: 0 errors, 0 unconnected, 0 parity issues.
  - ERC: 0.
  - Mating against ControlBoard2027_4L J9 and H5-H8: all 20 pins and the 4 holes OK.
- SPI end to end is the same as with the 6-layer board: MOSI and CS match SCK within 0.01 mm. The
  radio-link copper on this controlboard did not change in the 4-layer conversion.

Use it if the 6-layer board's extra cost is not worth it. The 6-layer design notes
(`../../6layer/docs/DESIGN_NOTES.md`) still describe the routing; this file lists only
what differs.

## Stackup: JLC04161H-3313 (1.6 mm, 4 layers)

| Layer | Use | Dielectric to the next layer |
|---|---|---|
| L1 F.Cu | All fast signals (as on the 6-layer board), parts | 3313 prepreg 0.0994 mm, εr 4.1 |
| L2 In1 | Solid GND | core about 1.265 mm, εr 4.6 |
| L3 In2 | +3V3 plane, +5V region, and GND regions under every fast B.Cu run | 3313 prepreg 0.0994 mm |
| L4 B.Cu | Former In3 routes, slow nets, bottom-side parts | |

- The prepreg under L1 is the same as on the 6-layer stackup, so all widths stay:
  - 50 Ω lines are 0.14 mm;
  - the USB pair is 0.13 / 0.11 mm.
- These are the 6-layer board's first-pass figures; confirm them in the JLC impedance calculator before ordering.

## What changed against the 6-layer board

- **In3 routes moved to B.Cu.** Same geometry, widened from 0.11 to 0.14 mm (microstrip over L3).
  - Motor SPI trunk: SCK, MOSI, MISO, 54 mm each.
  - The five motor chip-selects.
  - The four SD crossing hops: D2, D1, CMD, CK.
  - The two LED crossing hops: SCK, CKI.

  280.5 mm in all. None of them collides with existing B.Cu copper or bottom-side parts (DRC clean).
- **GND regions on L3.** Each fast B.Cu run has a GND region (priority 10) on L3 under it, extending
  0.9 mm (about 6W) beyond the trace each side, in five regions. The +3V3 / +5V plane stays connected
  around them (0 unconnected).
- **References checked by script.** A sample every 0.25 mm along all 775 fast segments shows:
  - every F.Cu segment sits over In1 GND;
  - every B.Cu segment sits over the In2 GND region;
  - the only gaps are via and hole antipads.
- **Layer changes.** Each former In3 hop now changes F ↔ B. The GND return vias tie In1, the L3 GND
  region and the B.Cu pour. Four vias have no GND via within 1 mm: motor trunk SCK (1.9 mm), CS0
  (2.3 mm), CS1 (1.1 mm) and the CKI via at D7 (1.07 mm). That is two fewer than the 6-layer board, because the U10
  rework added return vias.
- **Via removed.** The CS1 via in R25 pad 1 is gone; the B.Cu lane now runs straight into the pad.
- **L5 GND plane dropped.** The B.Cu GND pour stitches to In1 through the existing stitching vias.
- **Rules.** `ControlBoard2027_4L.kicad_dru` drops the In3 width rule and describes the 4-layer
  stackup. A deliberately violated 5 mm SIG50 test rule fired 199 times, which proves it compiles.

## Lengths

The length report (`pathlen.py`) is identical to the 6-layer board except LED SCK, which is 1.33 mm longer because of the via-in-pad rework.

| Group | Result |
|---|---|
| SD | 0.01 mm spread |
| USB U2 → U3 | 0.05 mm |
| Radio | −0.18 / 0.00 / +0.21 mm |
| Motor | trio within 0.11 mm |
| LED | U2 → U10: MOSI −0.46 mm vs SCK; U10 → D7: SDI −0.05 mm vs CKI |

The vias were already counted as 1.6 mm, and the trace widths do not change lengths.

## Trade-offs against 6 layers

- **Fast B.Cu runs reference a plane patch.** They sit over GND regions cut into the power plane, not
  a solid GND plane. The F.Cu side is unchanged.
- **Less plane capacitance.** The power plane is 1.27 mm from GND instead of 0.1 mm. The decoupling
  capacitors carry the load, which is enough for this board.
- **No filled vias needed.** No via sits in a solder pad. The 6-layer board had vias in U10 pads 1-4
  and R48, which JLC fills free only on 6+ layers. On this board:
  - **U10 pin 2 (LED SCK).** Via (70.66, 55.138) west of the pad, between the pad and the MOSI line.
    Its GND return via moved to (70.66, 54.2), 0.94 mm.
  - **U10 pin 3 (CKI).** Via (73.55, 56.408) under the U10 body. The F.Cu stub gains exactly what
    B.Cu loses, so the length is unchanged. TP19 moved to (75.0, 56.408) on the B.Cu run.
  - **U10 GND pins 1 and 4.** Vias under the U10 body. Pin 4's via at (73.55, 57.33) is also CKI's
    return via, 0.92 mm.
  - **R48 (B.Cu, SCK pull-down).** Shifted 1.2 mm along the SCK lane to (69.6, 52.76), with its own
    GND via. A new GND via at (68.4, 53.27) returns the SCK hop.
  - **TP7** keeps a via in its bare test pad. A test pad gets no paste, so it needs no fill.
- **What the rework costs.** The LED SCK line is 1.33 mm longer, so SCK/MOSI went from MOSI +0.87 to
  MOSI −0.46 mm, still inside 1 mm. MOSI passes 0.46 mm from the new SCK via, so it crosses that via's
  In1 antipad edge for about 0.3 mm.
- **Cost.** Roughly $25-40 less per order of 5-10 boards (about $3-8 per board). The parts (about
  $48/board) and two-sided assembly dominate the total of about $80-90/board.

## Status (2026-11-04)

- **Checks.**
  - DRC on the repo board: 0 violations, 0 unconnected, 0 schematic-parity issues.
  - ERC: only the documented VCAP item.
  - Cleanliness scan: identical to the 6-layer board.
- **Before ordering.**
  - Confirm the widths in the JLC calculator for JLC04161H-3313.
  - Run an adversarial audit of the converted layers and the U10 rework.
  - Order with standard tented vias; no via-in-pad option is needed.
