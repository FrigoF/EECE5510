% chap2_21d.m  - Prob 2.21 part d - Blandford
% EECE 4510 / 5510 - Marquette University
% Fred J. Frigo
% Sep - 2019
% 
% Y(z)/X(z) = (3z^-1 - 4z^-2) / (1 - 5z^-1 -z^-2)

num = [0  3 -4];
den = [1 -5 -1];


x= ones(1,31); % unit step
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