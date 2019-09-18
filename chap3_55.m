% Example 3_55 
% EECE 5510 - Marquette University
%
% Sep-2019
%
num = [0  0.05  0];      % numerator
den = [1 -0.6  0.05 ];  % denominator

x= [1 zeros(1,40)];  % kronecker delta input
x1 = [1 ones(1,40)]; % unit step
y = filter( num, den, x);  % This is an IIR filter
y1 = filter( num, den, x1); 

figure();
k=0:40; % x-axis for plot
plot(k,y, 'o');
title('Impulse Response for 3-55');

figure();
plot(k,y1, 'x');
title('Step Response for 3-55');

figure();
zplane(num,den);
title('Poles + Zeros from 3-55');
