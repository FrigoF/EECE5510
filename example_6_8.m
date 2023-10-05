% Example 6_8 - Blandford   p308
% Creates a Butterworth filter 
% 
%

fs = 11025; %sample frequency
fc = 2500; %cutoff frequency
N = 6; %order
[num den] = butter(N, fc/(fs/2)); %cutoff frequency is normalized
[H f] = freqz(num, den, 1024, fs) ;
[H f] = freqz(num, den, 1024, fs) ;
figure(1);clf;
subplot(2, 1, 1);
plot(f, abs(H));
title('Low-pass Butterworth filter');
axis([0 fs/2 0 1.2]);
xlabel('frequency in Hertz');
ylabel('gain');
subplot(2, 1, 2);
plot(f, 180*angle(H)/pi);
axis([0 fs/2 -180 180]);
xlabel('frequency in Hertz');
ylabel('Phase in degrees');
% plot pole zero to see if this is stable
figure;
zplane(num,den);