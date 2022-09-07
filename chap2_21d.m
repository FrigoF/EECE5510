% chap2_21d.m  - Prob 2.21 part d - Blandford
% EECE 4510 / 5510 - Marquette University
% Fred J. Frigo
% Sep - 2019, 2022
% 
% y[n] = 5y[n-1] + y[n-2] + 3x[n-1] -4x[n-2]
% y[n]  -5y[n-1] - y[n-2] = 3x[n-1] -4x[n-2]
% Y(z)(1 - 5z^-1 -z^-2) = X(z)(3z^-1 - 4z^-2)
% Y(z)/X(z) = (3z^-1 - 4z^-2) / (1 - 5z^-1 -z^-2)

num = [0.0  3.0 -4.0];
den = [1.0 -5.0 -1.0];

x= zeros(1,31); 
x(1)=1; % System is BIBO stable if the impulse response goes to zero with time.
k=0:30; % x-axis for plot

y = filter( num, den, x); 
figure();
plot(k,y, 'o');
title("time domain plot");

figure();
zplane(num, den);
title("Prob 2.21 part d")
Ts = 0.01;
sys = tf(num, den, Ts);

linearSystemAnalyzer(sys);

