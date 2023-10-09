% Problem 5.23  p. 280 Blandford  
%               p. 719 Blandford (appendix)
% EECE 4510 / 5510 - Marquette University
% Fred J. Frigo, Ph.D.
% October 9, 2023
%

fs = 44100;
fpass = 8000;
Rp = 0.01;
fstop = 10000;
Rs = .02;

%Parks-McClelland
F = ([fpass fstop]);
M = ([1 0]);
Dev = [Rp Rs];
[N F A W] = firpmord(F, M, Dev, fs);
disp(N);
N = 40;
num_pm = firpm(N, F, A, W);
[H f] = freqz(num_pm, 1, 1024, fs);

%Kaiser
fc = fpass + (fstop-fpass)/2;
eps = min(Rp, Rs);
A = -20*log10(eps);
Ka = (A - 7.95)/14.36;
alpha = 0.1102*(A - 8.7);
L = ceil(1 + Ka*fs/(fstop - fpass));
disp(L-1);
L = 52;
num_kaiser = fir1(L-1, fc/(fs/2), kaiser(L, alpha));
[H f] = freqz(num_kaiser, 1, 1024, fs);
