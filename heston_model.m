% MATLAb 2018a

clc
clear all
close all

%% Parameters

AssetPrice = 80;
Rate = 0.03;
DividendYield = 0.02;
OptSpec = 'call';

V0 = 0.04;                  % initial variance of underlying asset
ThetaV = 0.05;              % long-term variance of underlying asset
Kappa = 1.0;                % mean-reversion speed for the variance of the underlying asset
SigmaV = 0.2;               % volatility of the volatility
RhoSV = -0.7;               % correlation between Wiener processes

%% Call Derivation

Settle = datenum('17-Jun-2022');
Maturity = datemnth(Settle, 6);
Strike = 80; 

Call_test = optByHestonNI(Rate, AssetPrice, Settle, Maturity, OptSpec, Strike, ...
    V0, ThetaV, Kappa, SigmaV, RhoSV, 'DividendYield', DividendYield)

Delta_test = optSensByHestonNI(Rate, AssetPrice, Settle, Maturity, OptSpec, Strike, ...
    V0, ThetaV, Kappa, SigmaV, RhoSV, 'DividendYield', DividendYield, 'OutSpec', 'delta')

