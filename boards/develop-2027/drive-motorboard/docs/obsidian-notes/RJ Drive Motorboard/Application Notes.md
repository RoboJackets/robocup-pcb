### General Notes
- Target ESD Protection: **IEC 61000-4-2 Level 3 (±8 kV)**
	- All Inputs/Outputs: Required
	- Test points: Recommended
- Target board area: **50 mm x 50 mm**
- Target maximum junction temperature: **85 °C**

### `STSPIN32G0A2`
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
- Maximum gate driver sink/source current: $350\;mA$ (full temperature range)

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

