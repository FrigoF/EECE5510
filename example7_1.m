% Example 7.1 - p 375 Blandford and Parr
% 
% F. Frigo  05-Nov-2020
% Marquette University
%

N = 1000; % Number of points
fs = 11025;T = 1/fs;  % Sampling freq = 11,025 Hz
t = 0:T:(N-1)*T;

y = chirp(t, 10, (N-1)*T, 2000);

subplot(1, 2, 1);
stem(t, y, 'MarkerSize', 1);
title('Chirp signal');
xlabel('Seconds');

subplot(1, 2, 2);
yDFT = fft(y);
f = 0:fs/N:fs-(fs/N);  % Frequency will be in Hz

yDFTNorm = abs(yDFT)/max(abs(yDFT));
plot(f(1:N/2), yDFTNorm(1:N/2)) % Plot half of the Fourier spectrum
xlabel('Hz');

ydN = downsample( y, 2);
t1 = downsample (t, 2);

y2DFT = fft(ydN );
y2DFTNorm = abs(y2DFT)/max(abs(y2DFT));
figure();
subplot(1, 2, 1);
stem(t1, ydN, 'MarkerSize', 1);
title('Down Sampled Chirp signal');
xlabel('Seconds');

subplot(1, 2, 2);
plot(f(1:N/4), y2DFTNorm(1:N/4)) % Plot half of the Fourier spectrum
xlabel('Hz');

