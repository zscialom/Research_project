clc
clear all
close all

%% Parameters

rf = 0.00153;
T = 150/250;

S0_CSCO = 43.32;
K_CSCO = 55;
histo_vol_CSCO = 0.3023
implied_vol_CSCO = 0.0625;
q_CSCO = 0.0152;


S0_GE = 65.29;
K_GE = 10;
histo_vol_GE = 0.3305
implied_vol_GE = 1.64;
q_GE = 0.0032;

%% Black-Scholes-Merton

[Call_CSCO, Put_CSCO] = blsprice(S0_CSCO, K_CSCO, rf, T, histo_vol_CSCO,q_CSCO)
[Call_CSCO_implied_vol, Put_CSCO_implied_vol] = blsprice(S0_CSCO, K_CSCO, rf, T, implied_vol_CSCO,q_CSCO)

[CallDelta_CSCO,PutDelta_CSCO] = blsdelta(S0_CSCO, K_CSCO, rf, T, histo_vol_CSCO,q_CSCO)
Gamma_CSCO = blsgamma(S0_CSCO, K_CSCO, rf, T, histo_vol_CSCO,q_CSCO)
Vega_CSCO = blsvega(S0_CSCO, K_CSCO, rf, T, histo_vol_CSCO,q_CSCO)

[Call_GE, Put_GE] = blsprice(S0_GE, K_GE, rf, T, histo_vol_GE, q_GE)
[Call_GE_implied_vol, Put_GE_implied_vol] = blsprice(S0_GE, K_GE, rf, T, implied_vol_GE, q_GE)

[CallDelta_GE,PutDelta_GE] = blsdelta(S0_GE, K_GE, rf, T, histo_vol_GE, q_GE)
Gamma_GE = blsgamma(S0_GE, K_GE, rf, T, histo_vol_GE, q_GE)
Vega_GE = blsvega(S0_GE, K_GE, rf, T, histo_vol_GE, q_GE)

