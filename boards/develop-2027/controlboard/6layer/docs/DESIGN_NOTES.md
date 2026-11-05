# ControlBoard2027_6L (6-layer) design notes

Status: routed. DRC 0 errors, 0 unconnected, 0 schematic-parity issues. ERC has one documented item (§8).
An independent audit (CLAUDE.md §12) found no critical defects. Its findings and what was done are in §9. Placement follows the earlier 4-layer redesign and the floorplan in
[FLOORPLAN.md](FLOORPLAN.md).

Firmware: every STM32 / ESP32 pin and peripheral change against the prototype is in [FIRMWARE.md](FIRMWARE.md);
the radio board is described in [RADIO.md](RADIO.md).

## 1. Stackup and widths

JLC06161H-3313E, 1.6 mm, outer copper 1 oz, inner copper 0.5 oz.

| Layer | Use | Reference |
|---|---|---|
| L1 F.Cu | Fast buses, fanout, power-entry pours, GND pour | L2 GND, 0.0994 mm 3313 (εr 4.1) |
| L2 In1 | Solid GND | – |
| L3 In2 | +3V3 plane. +5V region at x 68.8-80.4, y 53-84.3 (U8 output, U10, LED cluster) | 0.1 mm core over L2 |
| L4 In3 | Inner signal layer: SD hops, motor trunk, LED SCK / CKI | L5 GND, 0.1 mm core (εr 4.6). L3 is 1.12 mm above |
| L5 In4 | Solid GND | – |
| L6 B.Cu | Slow nets, back-side parts, GND pour | L5 GND, 0.0994 mm 3313 |

| Class | Layer | Width / gap | Pour clearance | Checked by |
|---|---|---|---|---|
| USB_90R (90 Ω diff) | L1 | 0.13 / 0.11 mm | 0.26 mm (2W, outer layers only) | net class + `.kicad_dru` |
| SIG50 (50 Ω) | L1 / L6 | 0.14 mm | 0.28 mm (2W, outer layers only) | net class + `.kicad_dru` |
| SIG50 (50 Ω) | L4 | 0.11 mm | – (no pours on L4) | `.kicad_dru` |
| Default | any | 0.15 mm, clearance 0.15 mm | – | net class |

The widths are IPC-2141 estimates for this stackup. **Confirm them in the JLC impedance calculator
(JLC06161H-3313E) before ordering**, and order with impedance control.

All 27 controlled nets are at their class width for their whole length, with no neck-downs. A
script samples every 0.2 mm, and filled GND lies directly under each net on its reference layer along
the whole run. The only gaps are the antipads of the net's own vias.

## 2. Lengths (driver pin to receiver pin)

Measured by script on the board file. Vias count as 1.6 mm, and series resistors are counted pad to pad.

**SD (SDMMC2, U2 → J1 through U1, CK through R6).** CK, CMD and D0-D2 are 46.85 mm and D3 is 46.86 mm:
spread 0.01 mm (target ≤ 0.7 mm).

**Radio SPI (U2 → J9):** SCK 6.30 mm, MOSI −0.18, MISO 0.00, CS +0.21 mm.

**Motor SPI** (multi-drop, values relative to SCK):

| Connector | SCK | MOSI | MISO | CS |
|---|---|---|---|---|
| J4 | 80.70 mm | +0.02 | −0.09 | −0.42 |
| J5 | 68.70 mm | +0.02 | −0.09 | +0.61 |
| J6 | 73.66 mm | +0.02 | −0.09 | 0.00 |
| J7 | 87.16 mm | +0.02 | −0.09 | 0.00 |
| J8 | 100.66 mm | +0.02 | −0.09 | 0.00 |

**LED SPI:**

| Segment | Lines | Difference |
|---|---|---|
| U2 → U10 | SCK 10.23 mm, MOSI 11.10 mm | 0.87 mm |
| U10 → D7 | CKI 14.68 mm, SDI 14.63 mm | 0.05 mm |

**USB:**
- U2 → U3: D+ 36.73 mm, D− 36.78 mm.
- Per plug orientation, U2 → contact: A 2.08 mm, B 2.09 mm skew (§8).

### How the matching is done
- **Accordion meanders** carry most of the length:
  - legs across the line, ±A about it with A ≤ 0.42 mm (3W);
  - legs 0.7 mm centre to centre (0.56 mm = 4W edge gap);
  - 0.12 mm 45° chamfers at every corner.

  They add about 0.9 mm per mm of run, which is what made SD and the motor CS lines fit.
- **No side-by-side meanders.** Neighbouring lines never meander in the same stretch:
  - SD: D3, CK and D1 meander early on the descent diagonal, CMD and D0 later;
  - motor: CS2 and CS4 meander together, CS3 further south.
- **Trapezoid bumps** (45°, 4W top and gap) are used where the gain is small: SD D1, the motor SCK / MISO
  corridor, USB D+.
- **Motor trunk.** The feed vias sit at the same x offsets as each connector's drop vias, so SCK / MOSI /
  MISO differ by the same amount at all five connectors. The corridor bumps take that difference out once.

## 3. Layer changes on the fast buses

Each signal via has a GND via (L2-L5 tie) within about 1 mm, except the two listed in §8.

| Bus | Signal vias | Why |
|---|---|---|
| USB, radio | 0 | – |
| SD | 8 (4 hops on L4) + 1 (R4 pull-up on L6) | SDMMC2 pin order vs socket order needs 6 crossings. D2 hops over D3, D1 under D0, and CMD and CK over D0/D1. A 3-hop version was tried: CMD/CK stay on L1 and lose their climb, which leaves them 14-15 mm short with no room to meander that much |
| Motor | 3 feed + 5 CS feed + 4 per connector + 1 (R25) | One bus to five connectors: each tap crosses the other lanes, so the trunk runs on L4 |
| LED | SCK 2, CKI 2 | U2's MOSI/SCK order, U10's input order and D7's input order cross once on each side of U10 (see below) |

**LED buffer (U10, 74AHCT125):**
- **Gates.** Gate 1 buffers SCK (p2 → p3 = CKI) and gate 2 buffers MOSI (p5 → p6 = SDI). Gates 3 and 4
  are disabled, with OE high and inputs grounded.
- **SCK.** SCK drops to L4 at a via beside U2 and comes up through a via in U10's p2 pad. MOSI stays on L1.
- **CKI.** CKI leaves through a via in U10's p3 pad, runs on L4 under the U10 body, and comes up 1 mm north
  of D7. SDI stays on L1 round p7.
- **Lengths.** In each pair the L4 line carries the two vias and its L1 partner carries the longer copper,
  so the pair matches.
- **Return vias:**
  - R48's GND pad via sits 1.0 mm from the SCK via;
  - U10 p1 / p4 GND vias-in-pad sit 1.27 mm from p2 / p3;
  - a GND via sits 1.07 mm from the CKI via at D7.

**Via-in-pad:** U10 p1-p4, TP19 (on the B side, over the CKI via), R48 (on the B side, over the SCK
via and its GND via), R25 pad 1 (B side, MOTOR1_CS) and TP7 (kicker SCL). These need filled, capped vias. That is JLC's standard process for 6-layer boards;
state it on the order.

## 4. Termination and protection

| Part | Function | Placement |
|---|---|---|
| R65 / R66 30 Ω | Radio SCK / MOSI source damping | In line, 2 mm from U2 |
| R15 / R16 30 Ω | Motor SCK / MOSI source damping | In line, ≤ 4 mm from U2 |
| R6 30 Ω | SD CK source damping | In line, 3 mm from U2 |
| R30 100k | Motor SCK pull-down | SCK pad on the line |
| R47 / R48 | LED MOSI / SCK pull-downs | R47 on L1, its MOSI pad on the line. R48 on L6, its SCK pad on the SCK via |
| R1 / R2 / R4 / R5, R3 47k | SD pull-ups | R2, R1, R5 on L1 at the line. R4 on L6 at a via on D0. R3 (CMD) at the socket |
| U1 TPD6E05U06 | SD ESD | Flow-through in front of J1. GND pin 5 → 0.2 mm track → via 1.0 mm west, between the CK / D0 fan-in lines (pin 10 goes on to J1's GND pin) |
| U3 USBLC6 | USB ESD | Flow-through between J2 and U2 |
| U4/U5/U12/U13/U14 | Motor ESD | Flow-through at each connector. The GND row (pads 8 / 3, tied with 0.25 mm) goes straight north to its own via, 0.7 mm from pad 8, between the MISO / SCK drops |
| U6 / U16 / U17 | Expansion / kicker ESD | Flow-through |
| D1, D3 / D4 | VBUS, +5V_PROT / +3V3_RAW TVS | As on the earlier 4-layer redesign |

None of the 30 Ω parts is impedance matching: no fixed driver resistance plus R equal to Z0 is
established. They are edge-rate damping.

## 5. Power

- **+3V3:** the L3 plane, with every +3V3 pad on its own via.
- **+5V:** the L3 +5V region. It is fed by U8's output via and reaches U10 and every LED through their own
  vias. The B.Cu +5V island and long +5V tracks of the earlier 4-layer redesign are gone.
- **Plane capacitance:** L2 GND and L3 sit 0.1 mm apart.
- **Power entry:** J15, Q1, F5 / F6, D3 / D4 stay as L1 pours.
- **Stitching:** about 89 L1/L6-to-plane GND vias on a ≈5 mm grid and along the edges, plus island vias.

## 6. Custom DRC rules (ControlBoard2027_6L.kicad_dru)

| Rule | Why |
|---|---|
| USB diff pair geometry | Width 0.13 (min 0.11), gap 0.11 (min 0.1) on the four USB nets |
| SIG50 width on the outer layers / on L4 | 0.14 mm on L1 / L6 and 0.11 mm on L4, by layer |
| USB / SIG50 pour clearance (layer outer) | ≥ 2W to same-layer pours, so the lines stay microstrip. Scoped to the outer layers so the inner-plane antipads keep their normal size |
| Switch GND pins: one B.Cu spoke | THT tactile switches; L1 carries them fully |

Board minimum clearance is 0.1 mm, set by the USB gap. Compilation was proved on a copy with a
deliberately violated rule (SD CK width ≥ 0.5 mm gave 4 track_width errors), and that rule is not in the
repo file.

## 7. Silkscreen

All labels are regenerated by the board scripts. TP19 is on the back, so its label "LED_CI" is on the
back silk.

## 8. Deviations from CLAUDE.md and open warnings

| Rule | Deviation | Reason |
|---|---|---|
| USB intra-pair skew ≤ 0.15 mm | 2.08 / 2.09 mm per plug orientation (U2 → J2 end to end without the stub: 0.84 mm) | On this receptacle A7 (D−) sits between B6 and A6 (D+), so one line always has a ~2 mm duplicate-contact stub. Balanced so both orientations are equal |
| U3 → J2 pair coupling | 2 mm of the 10 mm run is at 0.24 mm pitch; the rest fans from U3's 1.9 mm pin spacing | ESD part pinout |
| Signals under a part | CKI on L4 under the U10 body | Inner layer; the crossing has to be on some layer and L4 is 0.1 mm over solid L5 GND. Nothing on L1 runs under U10 |
| Hop under ~5 mm | LED CKI L4 run is ~10 mm, SCK ~6 mm | L4 is a referenced signal layer on this stackup, not a plane |
| Return via within 1 mm | Motor trunk SCK via (48.0, 101.9) and CS0 via (37.0, 100.8) have no GND via within 1.6 mm. U10 p2 / p3 vias: 1.27 mm | No room between trunk lanes / pad pitch |
| Short segments | Accordion end legs are 0.15-0.2 mm | Meander geometry |
| T-junctions only at pads | USB_DM_CON at (96.98, 52.55), the B7 → A7 join. +5V / +3V3 at the U8 / U9 body centre. +3V3_LDO drop to TP15 | Duplicate-contact join; power nets (as on the earlier 4-layer redesign) |
| Width changes only at pads | D1 VBUS steps to 0.3 mm through the D1 pads. +3V3_LDO 0.8 → 0.3 mm. PWR_SRC_3V3 / 5V router stubs | Pad clearance; slow nets |
| Silk label | TP13 "5V_PROT" label did not place | No free spot in the power TP row; to fix by hand |
| Motor bus topology | U2 feeds the L4 trunk at x 53: branches of 17 mm (west) and 37 mm (east), plus five ~8 mm drops | One SPI to five connectors. At 6 Mbit/s the longest branch (~0.25 ns) is far below the edge time, so the branches act as a lumped load. Do not raise the motor SCK above ~10 MHz without re-checking |
| Test point on a line | TP1 sits in line on SD_CLK_CARD; TP18 in line on SDI with SDI's west run going past it | Carried over from the earlier 4-layer redesign (TP1). TP18's run has to go west round U10 p7 anyway; the extra 0.5 mm west is length balancing against CKI |
| Bulk cap position | C22 (VCAP 2.2 µF) on B inside U2's pad ring | Carried over from the earlier 4-layer redesign; VCAP pin loop kept short |
| Collinear / off-centre segments | Router output has collinear segment pairs and B.Cu track ends up to 0.1 mm off via centres; one 90° corner on EXPANSION_SCL (B.Cu, 50.25, 35.625) | Slow nets except the motor drop joints; cosmetic. Clean up before ordering |
| Power track widths | +5V_PROT / +3V3_RAW stubs 0.3 mm (class 0.8 mm) | The current path is the L1 pours; the stubs feed TVS / test points |
| ERC | U2 VCAP p71 / p106: two power outputs tied together | Intentional, per datasheet (both VCAP pins to their caps) |

## 9. Audit (CLAUDE.md §12)

An independent reviewer audited the routed board with its own scripts: DRC with parity on a refilled
copy, ERC, two deliberately violated test rules, widths, reference sampled every 0.05 mm, lengths,
spacing, ESD, decoupling and access.

| Finding | Severity | Action |
|---|---|---|
| Motor TVS GND reached a via only through a 4.6 mm, 0.14 mm track between the connector pins | Major | Fixed: GND row straight north to its own via, 0.7 mm from pad 8; the run between the pins is removed |
| U1 GND via 1.85 mm away through a 0.14 mm track | Major | Fixed: via moved to 1.0 mm from pin 5, track 0.2 mm (pin 10 also feeds J1 GND) |
| Motor trunk SCK / CS0 and U10 p2 / p3 return vias at 1.9-2.3 / 1.27 mm | Minor | Documented (§8) |
| Branching motor trunk | Minor | Documented with its frequency limit (§8) |
| USB skew per orientation, USB_DM_CON T-junction | Minor | Documented (§8) |
| SDI past TP18, TP1 in line, C22 inside the ring, R25 / TP7 via-in-pad, collinear segments, power stub widths | Minor | Documented (§8, §3) |
| Stackup L4-L5 0.1 mm not confirmed against JLC data | Minor | Open: confirm in the JLC calculator before ordering (§1) |
| LED_CO label touching D10's reference (seen in the render) | Minor | Fixed: label moved below TP21 |

After the fixes the changed areas were re-checked:
- DRC with parity on the repo file: 0 / 0 / 0;
- all length groups unchanged;
- ESD GND via distances re-measured (motor TVS 0.70 mm, U1 1.38 mm pad centre to via).

## 10. Open items

- Confirm the widths in the JLC calculator and order with impedance control and filled vias.
- Radio board: re-laid out as RadioBoard2027 rev B (see [RADIO.md](RADIO.md)), mating with J9 and H5-H8 checked by script.
- Carried over from the earlier 4-layer redesign: motor-module connector mismatch
  (PH 8 vs GH 6), kicker / powerboard pinout check.
