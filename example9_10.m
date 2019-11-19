% example9_10 - Example 9.10 Blandford p 534
% EECE 4510 / 5510 - Marquette University
% Fred J. Frigo, Ph.D.
%  
% Nov 2019
%
fs = 11025;T = 1/fs;
nT = [0:11024]*T;

% Generate Chirp Signal
s = chirp(nT, 100, 1, fs/2);

% Use equalizer1 and equalizer2
Alow = 2; fc1 = 2000; Aclow = 1 + 1/sqrt(2);
[num1, den1] = equalizer1(1, Alow, fs, fc1, Aclow);
Ahi = 0.2;bw = 600;f0 = 3500;
Achi = 0.2 + .8/sqrt(2);
[num2, den2] = equalizer2(f0, Ahi, bw, fs, Achi);

% Filter the original signal
s1 = filter(num1, den1, s);
s2 = filter(num2, den2, s1);

% First Equalizer filter
sound(s1, fs);
pause;
% With both equalizer filters
sound(s2, fs);
