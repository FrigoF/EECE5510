% Example 5.2 - p 211 Blandford and Parr
% 
% F. Frigo  25-Sep-2023
% Marquette University
%
N = 30; %Order
fs = 11025;
F = [0 2000/(fs/2) 2000/(fs/2) 1]; %Frequency vector normalized to fs/2
M = [1 1 0 0]; %Corresponding magnitude vector
num = firls(N, F, M);
[H f] = freqz(num, 1, 1024, fs) ;
figure (1) ;
subplot(2, 1, 1)
plot(f, abs(H));
axis([0 fs/2 0 1.5]);
xlabel ('frequency in Hz ');
ylabel ('gain');
title('FIR filter from Fourier series');
subplot(2, 1, 2);
plot(f, unwrap(angle(H)*180/pi));
axis ([0 fs/2 -200 200]);
xlabel ('frequency in H z ');
ylabel ('Phase in degrees');
figure (2); clf ;
zplane(num, 1) ;
title ('z-plane plot');
