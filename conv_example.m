% conv example
% EECE 4510 / 5510 - Marquette University
% Fred J. Frigo
% Sep - 2021

x=[1 1 1]; % input signal
h = [1 2]; % impulse response

figure();
stem([-1:4], [0,x,0,0]);
axis( [-1 4 -1 2]);
title("input signal");

figure();
stem([-1:4], [0,h,0,0,0]);
axis( [-1 4 -1 3]);
title("impulse response");

figure();
y=conv(x,h);
stem([-1:4],[0,y,0]);
axis( [-1 4 -1 4]);
title("convolution result");