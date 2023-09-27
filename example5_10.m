% Example 5.10 - Blandford and Parr
% 
% F. Frigo  27-Sep-2023
% Marquette University
%
% 
fs = 11025;
L = 21;N = L-1;
fpass = 2500; fstop = 2500;
F = [0 fpass/(fs/2) fstop/(fs/2) 1]; %normalized to fs/2
A = [1 1 0 0];
num = fir2(N, F, A, rectwin(L));
figure(1);
[H f] = freqz(num, 1, 1024, fs);
plot(f, abs(H));
hold on;
plot(F*fs/2, A);
%first filter
%Idealized filter
fpass = 2500;
fstop = 3250;
F = [0 fpass/(fs/2) fstop/(fs/2) 1]
A = [1 1 0 0];
num = fir2(N, F, A, rectwin(L));
[H f] = freqz(num, 1, 1024, fs);
plot(f, abs(H));
hold on;
plot(F*fs/2, A);