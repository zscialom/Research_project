% MATLAb 2018a

clc
clear 
close all

%% General Parameters

rf = 0.0224;
T = 136/250;

% CSCO
S0_CSCO = 43.07;
K_CSCO = 55;
q_CSCO = 0.0152;

% GE
S0_GE = 62.86;
K_GE = 35;
q_GE = 0.0032;

%% Heston parameters
OptSpec_CSCO = 'call';
OptSpec_GE = 'put';

V0_CSCO = 0.1125;          % initial variance of underlying asset
ThetaV_CSCO = 0.0268;            % long-term variance of underlying asset
Kappa_CSCO = 1.6181;             % mean-reversion speed for the variance of the underlying asset
SigmaV_CSCO = 0.3121;            % volatility of the volatility
RhoSV_CSCO = -0.6;       % correlation between Wiener processes

V0_GE = 0.3022;                % initial variance of underlying asset
ThetaV_GE = 0.0108;            % long-term variance of underlying asset
Kappa_GE = 0.1211;             % mean-reversion speed for the variance of the underlying asset
SigmaV_GE = 0.0412;            % volatility of the volatility
RhoSV_GE = 0.2;                % correlation between Wiener processes


%% Call Derivation

Settle = datenum('05-Jul-2022');
Maturity = datenum('20-Jan-2023');

Call_CSCO = optByHestonNI(rf, S0_CSCO, Settle, Maturity, OptSpec_CSCO, K_CSCO, ...
    V0_CSCO, ThetaV_CSCO, Kappa_CSCO, SigmaV_CSCO, RhoSV_CSCO, 'DividendYield', q_CSCO)

[Delta_CSC0, Gamma_CSCO, Vega_CSCO] = optSensByHestonNI(rf, S0_CSCO, Settle, Maturity, OptSpec_CSCO, K_CSCO, ...
    V0_CSCO, ThetaV_CSCO, Kappa_CSCO, SigmaV_CSCO, RhoSV_CSCO, 'DividendYield', q_CSCO, 'OutSpec', ["delta", "gamma", "rho"])


%% Put Derivation

Put_GE = optByHestonNI(rf, S0_GE, Settle, Maturity, OptSpec_GE, K_GE, ...
    V0_GE, ThetaV_GE, Kappa_GE, SigmaV_GE, RhoSV_GE, 'DividendYield', q_GE)

[Delta_GE, Gamma_GE, Vega_GE] = optSensByHestonNI(rf, S0_GE, Settle, Maturity, OptSpec_GE, K_GE, ...
    V0_GE, ThetaV_GE, Kappa_GE, SigmaV_GE, RhoSV_GE, 'DividendYield', q_GE, 'OutSpec', ["delta", "gamma", "rho"])


