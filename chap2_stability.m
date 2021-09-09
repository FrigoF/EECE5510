% chap2_stability, p 56 Blandford
% EECE 4510 / 5510 - Marquette University
% Fred J. Frigo
% Sep - 2021
% 
% y[n] = 0.9y[n-1] + 0.1x[n]
 
num = [0.1   0.0];
den = [1.0  -0.9];
 
figure();
zplane( num, den);  % If poles inside unit circle, system is stable.
