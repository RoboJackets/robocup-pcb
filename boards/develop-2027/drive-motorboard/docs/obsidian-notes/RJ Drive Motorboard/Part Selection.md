## Motor Controller/MCU SiP: `STSPIN32G0A2`
- Must be `STSPIN32G0*` series, previous iteration used `STSPIN32F0A`, firmware team wanted more flash & memory
- Main variants are the `STSPIN32G0251/252` and the `STSPIN32G0A1/A2/B1/B2`
	- `STSPIN32G0251/252`'s has up to 13 more GPIOs, targeted towards "high voltage" motors
	- `STSPIN32G0A1/A2/B1/B2` has fewer GPIOs, has built in op-amps, targeted towards space constrained BLDC motors.
- `STSPIN32G0A1/A2/B1/B2` family chosen due to requiring less board area
	- `A1/A2` has three op-amps for 3 shunt current sensing
	- `B1/B2` have only one op-amp
- `STSPIN32G0A1/A2` family chosen due to needing 3 op-amps for Field Oriented Control
	- `A1` variant adds external references to $V_{REF}$ and $V_{BAT}$
	- `A2` variant ties $V_{REF}$ and $V_{BAT}$ to $V_{DD}$
- `STSPIN32G0A2` chosen due to not needing precision references for $V_{REF}$ and $V_{BAT}$.

## Magnetic Encoder: `AS5047P`
- `AS5047P` initially chosen due to usage by the A-Team
	- 14-bit position over SPI, **12-bit** resolution over ABI
- `AS5047D` is a usable pin-compatible alternative
	- 14-bit position over SPI, **11-bit** resolution over ABI
- Prices
	- DigiKey, 05/03/2026
		- **$5.247 @ 50 (AS5047D)**
		- $6.397 @ 50 (AS5047P)
	- LCSC, 05/03/2026
		- $3.964 @ 50 (AS5047D)
		- **$2.752 @ 50 (AS5047P)**

## Power MOSFET: `STL90N10F7`
- `STL90N10F7` initially chosen due to usage by the A-Team
	- $V_{DS} = 100V$
	- $R_{DS(on)} \le 8\;m\Omega$
	- $I_D = 70\;A$

## Temperature Sensor: `LM75ADP,118`
- `LM75` family chosen
	- Jellybean part
	- Accurate temperatures not needed ($\pm2\degree C$ accuracy)
	- $I^2C$ Interface minimizes pin usage on MCU
	- Small packages (SOP, TSSOP, MSOP) available
- `LM75ADP,118` chosen due to small package (MSOP-8) and reputable manufacturer (NXP)
