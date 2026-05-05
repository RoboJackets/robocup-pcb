### General Notes
- Target ESD Protection: **IEC 61000-4-2 Level 3 (±8 kV)**
	- All Inputs/Outputs: **Required**
	- Test points: *Recommended*
- Target board area: **45 mm x 45 mm**
- Target ambient temperature range: **0°C - 100 °C**
### `STSPIN32G0A2`

#### General
- The general-purpose timer peripherals (`TIM2`, `TIM3`) has a mode to automatically count AB encoders, ensure pin assignment allows this mode to be used.
- This variant doesn't support external crystal oscillators.
- $REG_{3V3}$ can be isolated to only supply the analog block as a precise voltage reference.
- There is an onboard temperature sensor for die temperature.
	- Use the factory calibration values (See [[stm32g031x4-x6-x8.pdf|STM32G031x8, Page 24]])
- SPI supports up to $32\;Mbits/s$
- Absolute maximum $100\;mA$ current consumption
- Absolute maximum $80\;mA$ sunk/sourced by all pins (sum)
- Maximum $T_J =130 \degree C$
- Maximum $T_A=125\degree C$
- Estimate of baseline current consumption: $10\;mA$ (Absolute Maximum $100\;mA$)
	- Assumes all peripherals on, clock at $64\;MHz$
- Flash memory lasts at least 7 years.
- ADC Error maximum $\pm 7.5\;LSB$

#### Gate Drivers
- See [[stspin32-gate-bootstrap.pdf|Application Note, Gate Bootstrapping]] for more information
- Maximum gate driver sink/source current: $350\;mA$ (full temperature range)
- Bootstrap capacitor $C_{BOOT}$ needed in order to drive nMOSFET as high side switch
	- Exact value not given, see Application note for information and computing $C_{BOOT}$.

#### Current Sensing
- See [[evlspin32g0a2-getting-started.pdf|Eval Board User Guide]] and [[evlspin32goa2-schematic.pdf|Schematic]] for examples
- See [[stspin32-overcurrent-protection.pdf|Application Note, Over-current Protection]] for information specific to over-current protection
- Let 
	- $I_{max}$ be the desired cut-off current
	- $R_S$ be the shunt resistor
	- $R_{LP}$ be the resistor for the low-pass filter
	- $C_{LP}$ be the capacitor for the low-pass filter
	- $R_B$ be the bias resistor
	- $f_{LP}$ be the cut-off frequency of the low-pass filter
		- Recommended to be 5 times the PWM frequency
	- $OCCOMP_{th}$ for the `STSPIN32G0` family is always $255\;mV$
- Always choose $R_{LP} >> R_{S}$ so all the phase current flows through $R_{S}$
- Recommended $R_S < 1\;\Omega$ and $R_{LF} > 1\;k\Omega$
- For a triple-shunt configuration with biasing and a low-pass filter:
	- $R_B = R_{LP}\cdot \left( \dfrac{V_{DD} - OCCOMP_{th}}{3\cdot OCCOMP_{th} - I_{max} \cdot R_S}\right)$
	- $f_{LP} = \dfrac{1}{2\pi C_{LP} \frac{R_{LP} \cdot R_B}{3R_B + R_{LP}}}$

#### Buck Converter
- See [[stspin32-buck-converter.pdf|Application Note, Buck Converters]] for more information
- Input Capacitor $C_M$
	- Must be low ESR capacitor of at least $10\;uF$
	- Placed as near as possible to $V_M$ pin
	- A second capacitor of $100\;nF$ can be used to reduce ESR
- Diode $D_{SW}$
	- $V_{RRM}$ must be $\ge20\%$ than $V_M$
	- $I_{FSM} \ge 1\;A$
- Inductor $L_{SW}$
	- Recommended $22\;nH$
	- Saturation current must be greater than $I_{SW,peak}$
- Output Capacitor $C_{OUT}$
	- At least $47\;uF$
	- ESR under $200\;m\Omega$
- Recommended to place $100\;nF$ capacitor close to regular output ($C_{BYPASS}$)
- Try to reduce size of diode, inductor, $C_{OUT}$ loop

## `AS5047P`
- See [[breakout_AS5047P_schem.pdf|breakout board schematic]] for a known working example.
- Rotation direction as described in the datasheet is relative to the top face of the package. Specifically, relative to the normal vector of the top face of the package.
- The magnet's axis must be placed as close as possible to the center of the package.
	- Even $1\;mm$ horizontal displacement introduces significant angular error
- Both UVW and ABI are enabled as programmed from the factory. Unused UVW/ABI pins must be left floating.
- When SPI is not used:
	- CSN must be pulled up
	- CLK must be pulled low
	- MOSI must be pulled low
	- MISO can be left floating
- Non-volatile registers can only be programmed **once**.
- Measured $10\;mA$ current draw, theoretical max $15\;mA$.
- $T_A$ must not exceed $125\degree C$.
- Magnets
	- Diametric magnets required
	- Grade N35H recommended for temperature rating
	- Recommended sizes
		- 6 mm (dia) x 2.5 mm (prefered)
			- Better signal/noise ratio
			- Larger air gaps: $1\;mm < gap <2\;mm$ from top of package
			- Purchased [469-1024-ND](https://www.digikey.com/en/products/detail/radial-magnets-inc/8995/5126077?s=N4IgTCBcDaICwDYCcBaAjABjHFA5AIiALoC%2BQA) for testing ($80°C$ rating)
			- **[469-1075-ND](https://www.digikey.com/en/products/detail/radial-magnets-inc/9049/6030786) should be used on robots due to $150\degree C$ rating**
		- 8 mm (dia) x 3 mm
			- Less sensitive to horizontal misalignment
			- Worse signal/noise ratio
			- Smaller air gaps
	- <span style="color:red">TEST ME: Magnetic field is significantly weakened (thus angular error is increased) when shaft is a magnetic material.</span>
		- Manufacturer recommends using a non-magnetic spacer.
		- [[AS5047P#Breakout Test (May 3, 2026)|Breakout board testing]] found that a magnetic shaft still works, but error was not measured.

## `STL90N10F7`
- `STSPIN32G0A2` eval board puts diodes on MOSFET gates to reduce dead-time (and losses). This is probably not necessary for this application.
- Current Rating
	- Motor winding resistance $R_{motor} = 0.8\;\Omega$
	- Maximum $V_{BATT} = 20.5\;V$
	- Theoretical maximum current: $\dfrac{V_{BATT}}{R_{motor}}= \dfrac{20.5\;V}{0.8\;\Omega} = 25.625\;A$
		- Well under rated continuous current of $70\;A$
- Losses estimation (TODO: Confirm with SPICE simulation)
	- Switching Loss
		- Assuming test conditions for Table 5 in [[en.DM00082639.pdf|Datasheet Page 3]] apply for all $V_{DS},I_{D}$
			- $t_r = 32\;ns$
			- $t_f = 13\;ns$
			- $t_{rf} = \dfrac{t_r + t_f}{2} = 22.5\;ns$
		- Assuming $f_{sw} = 50\;kHz$
		- Assuming peak motor current: $I = 7\;A$
		- Assuming $V_{BATT} = 20.5\;V$
		- $P = V_{DS}I_{D}t_{rf}f_{sw} = (20.5\;V)(7\;A)(22.5\;ns)(50\;kHz) \approx 0.16\;W$ (negligible)
	- Conduction Loss
		- Worst-case (total stall)
			- Assuming worst-case current: $I = 25.625\;A$
			- Maximum possible $R_{DS(on)} = 8\;m\Omega$
			- $P = I^2R = (25.625\;A)^2(0.008\;\Omega) \approx 5.25\;W$
			- Using $R_{thJA} = 31\;\degree C/W$, $T_{rise} \approx 162.72\degree C$ (Maximum $T_A = 12.28\degree C$)
		- Typical (motor peak current)
			- Assuming peak motor current: $I = 7\;A$
			- Maximum possible $R_{DS(on)} = 8\;m\Omega$
			- $P=I^2R = (7\;A)^2(0.008\;\Omega) \approx 0.39\;W$
			- Using $R_{thJA} = 31\;\degree C/W$, $T_{rise} \approx 12.09\degree C$ (Maximum $T_A = 162 \degree C$)
	- Dead-Time Body Diode Loss (worst-case)
		- Assuming dead time over $t_{rr} = 90\;ns$
		- Maximum $V_{SD} = 1.1\;V$
		- Maximum $I_{RRM} = 3.6\;A$
		- Assuming $f_{sw} = 50\;kHz$
		- $P = V_{SD}I_{RRM}t_{rr}f_{sw} = (1.1\;V)(3.6\;A)(90\;ns)(50\;kHz) = 17.8\;mW$ (negligible)
	- Estimated total losses ($f_{sw} = 50\;kHz$)
		- By type:
			- Switching loss: $\approx 0.16\;W$
			- Conduction loss: $\approx 0.39\;W$ (typ.) | $\approx 5.25\;W$ (worst-case)
			- Dead-Time Body Diode loss: $\approx 0.02\;W$
		- Total: $0.57\;W$ (typ.)
			- Using $R_{thJA} = 31\;\degree C/W$, $T_{rise} \approx 17.67\degree C$ (Maximum $T_A \approx 157 \degree C$)
		- Note: Over-current protection threshold must be set so worse-case conduction loss cannot occur for even short periods of time. Suggested threshold is $10\;A$.

### `LM75ADP,118`
- $I^2C$ Fast Mode ($400\;kHz$)
- Address configurable using pins `A0,A1,A2`
	- Address `1001xxx` where `xxx = A2, A1, A0`
	- `A*` pins should be tied to $V_{CC}$ or GND directly.
- 11 bit temperature output ($LSB = 0.125\degree C$)
- $\pm 3 \degree C$ accuracy over full temperature range
- Active-low Over-temp Shutdown (OS) pin with configurable thresholds
	- Default $T_{OS} = 80\degree C$
	- Default $T_{hyst} = 75\degree C$
- Temperature updates every $100\;ms$

