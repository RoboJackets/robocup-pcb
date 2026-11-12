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

## Shunt Resistor: `CRA2512-FZ-R015ELF`
- Initialy chose SMD 2512 rated for $3\;W$ as it is a common package/rating for shunt resistors.
- Expected Currents:
	- Absolute max: $25\;A$ (Motors can induce currents of $33.06\;A$, but assume board protections limit it to this value)
	- Typical peak: $10\;A$
- Most resistors are built to handle 5 times the rated power for up to 5 seconds without significant derating.
	- This means for a $3\;W$ resistor, the maximum resistance $\Omega_{max} = \dfrac{3}{\frac{1}{5}(25\;A)^2} \approx 24 \;m\Omega$
- Resistors also derate with heat, so $20\;m\Omega$ seems to be a good upper-bound.
- Bourns `CRA2512-FZ-R015ELF` ( $15\;m\Omega$ 1% 3W 2512) looks to be a solid choice for price, availability, and performance. Significant quantities in stock on DigiKey and LCSC

## VBATT Fuse: `0679H9100-05`
- Requirements:
	- $10\;A$ continuous @ $20.5\;VDC$ during normal operation
	- $15\;A$ peak during normal operation (momentary stalls)
	- Must blow within $250\;ms$ @ $25\;A$
	- Small size (surface-mount)
- Selected model:
	- Rated $10\;A$ continuous @ $60\;V$
	- Blows @ $10\;s$ at $15\;A$ (average)
	- Blows @ $50\;ms$ at $25\;A$ (average)

## Motor Connector Family: `TBD`
- Requirements:
	- Current rating of at least $1\;A$ per terminal
	- Pre-crimped wires must be sold on DigiKey
	- Height up to $4\;mm$ when mated ($<3\;mm$ preferred)
	- Surface-Mount only sockets must exist
- Candidates
	- JST ACH(F/L) Series
		- Pitch $1.2\;mm$
		- Height $1.4\;mm$ mated
		- Top Entry, side feed
		- $2\;A$ per circuit (AWG 28)
		- 3 position
			- `BM03B-ACHSS-GAN-TF` (male socket)
			- `ACHR-03V-S` (female housing)
		- 5 position
			- `BM05B-ACHSS-A-GAN-ETF` (male socket)
			- `ACHR-05V-A-S` (female housing)
		- `ASACHSACH28W102` (pre-crimped cable)
	- 