% prob_10_11_example - Generate 2D FIR filter
%
% Fred J. Frigo
% Marquette University
% Dec 2, 2019
%
% Generate N = 128 point FIR Filter from h[n] = hamming(M) with M=5
% Plot 2D frequency response
%
N = 128; 
M=5;

kernel_1d = [ hamming(M)' zeros(1, N-M) ];
kernel_2d = kernel_1d'*kernel_1d;

figure;
surf(kernel_2d);
title('2D Filter Coefficients');

figure;
freqz2(kernel_2d, [N, N]);
title('Frequency Response');
