% conv-example2 - Linear Convolution Example 3.13 p 125 Blandford
% EECE 4510 / 5510 - Marquette University
% Fred J. Frigo
% Sep - 2024

x = [1 2 3 4]; % input signal
h = [0 1 2 3]; % impulse response

figure();
stem(x);
axis( [-1 5 -1 5]);
title("input signal of length N");

figure();
stem(h);
axis( [-1 5 -1 5]);
title("impulse response of length M");

figure();
y=conv(x,h);
stem(y);
axis( [-1 10 -1 20]);
title("Linear convolution result");