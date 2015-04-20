%% Overview
% This simulation will determine the component parameters required for the
% RoboJackets RoboCup SSL kicker board. This simulation will consider the
% use of a SEPIC 

%% Target Parameters
Vin  = 18.5; % Input voltage [V]
Vout = 250;  % Output voltage [V]
Vd   = 0.1;  % Diode forward voltage [V]

f = [100e3 1000e3]; % Operating frequency [Hz]

%% Duty Cycle
D = (Vout + Vd) / (Vin + Vout + Vd); % Maximum duty cycle

%% Inductor Selection
Isw_max = I0_max / (1-D); % Maximum switch current
chi = 0.2; % Percentage peak-to-peak ripple current
Isw_pk  = (1 + chi/2) * Isw_max; % Peak switch current
dIsw = chi * Isw_max; % Switch ripple current

L = (Vin * D) ./ (dIsw * f); % Inductance value [H]

%% Sense Resistor Selection
Rsense = 80e-3 / Isw_pk; % Sense resistor value [ohm]

%% Result
L
Rsense