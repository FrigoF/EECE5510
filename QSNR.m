% QSNR.m
% Example 4.3 - Blandford p. 184
%
b = 10; % 10 bit A/D
fs = 22050; % Sample rate
T = 1/fs; % Sample period
f = 1000; % signal frequency
N = fs/f; %Number of samples
% x is the signal - a 1 KHz sin wave
% xq is the quantized signal - quantized to b bits
% Ps is the signal power. Pn is the noise power,
i = 1:N;
x = sin(2*pi*f*(i-1)*T);  % x is sinusoid with max = 1V, min = -1V
xq = round(x.*2^(b-1)); % truncate by rounding
xq = xq/(2^(b-1));
Ps = sum(x.^2);
Pn = sum((x - xq).^2);
Ps = Ps/N;
Pn = Pn/N;
db = 10*log10(Ps/Pn);
fprintf('The QSNR is %f \n', db);