%% Overview
% This simulation will determine the component parameters required for the
% RoboJackets RoboCup SSL kicker board. This simulation will consider the
% use of the SEPIC configuration using Linear Technology's LT3757A IC.

%% Target Parameters
Vin      = 18.5;    % Input voltage [V]
Vout     = 240;     % Output voltage [V]
Vd       = 0;       % Diode forward voltage [V]
IL1_max  = 21;      % Inductor saturation current [A]
f        = 700e3;  % Operating frequency [Hz]
Tss      = 12.5e-3; % Soft-start interval [s]
Tss=.5e-3;
%% Duty Cycle
D = (Vout + Vd) / (Vin + Vout + Vd); % Maximum duty cycle

%% Inductor Selection
Iout_max = IL1_max * (1-D) / D; % Maximum output current [A]
Isw_max = Iout_max / (1-D); % Maximum switch current
chi = 0.2; % Percentage peak-to-peak ripple current
Isw_pk  = (1 + chi/2) * Isw_max; % Peak switch current
dIsw = chi * Isw_max; % Switch ripple current

L1 = Vin * D ./ (0.5 * dIsw * f);
L = (Vin * D) ./ (dIsw * f); % Inductance value [H]

%% Sense Resistor Selection
Rsense = 80e-3 / Isw_pk; % Sense resistor value [ohm]

%% FET Selection
% G_loss   = Isw_max^2 * Rds_on * D; % Conduction loss [W]
% SW_loss  = 2 * (Vin + Vout)^2 * I * Crss * f;
% P_rating = G_loss + SW_loss; % Required FET Power rating [W]

%% Diode Selection
Id_pk = (1 + chi/2) *  Iout_max * 1/(1-D);

%% Capacitor Selection
% The specific value of Cdc is not significant
Irms_Cdc = Iout_max * sqrt((Vout+Vd) / Vin); % Minimum RMS current rating 
V_Cdc = Vin; % Minimum voltage rating
Cout = Iout_max ./ (0.01 * Vout * f); % Minimum load capacitance

%% Soft-Start Capacitor
Css = Tss * 10e-6/1.25; % Capacitance given the soft-start interval

%% Result
RJRC_SEPIC_showResult;