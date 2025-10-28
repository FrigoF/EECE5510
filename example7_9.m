% Example 7.9 - Blandford and Parr
% 
% F. Frigo  27-Oct-2025
% Marquette University
%
% 

fs = 1000; T =1/fs;
BW = 200;
fL = 10000;
fU = fL + BW;
t = 0:T:0.1;
x = zeros(1, length(t));
for fr = fL:50:fU
   x = x + sin(2*pi*fr*t);
end

% Prob 7.26
%fs = 2000;T = 1/fs;
%fL = 40000;
%fU = 40250;
%t = 0:T:3;
%x = chirp(t, fL, 3, fU);

figure(1);clf;
subplot(2, 1, 1);
plot(t, x);
title('Original signal');
xlabel('Time in seconds');
ylabel('Voltage');
Xfft = fft(x);
Xfft = Xfft/max(abs(Xfft));
subplot(2,1,2)
k = 1:length(Xfft);
plot(k*fs/length(Xfft), abs(Xfft));
axis([0 fs/2 0 1]);
title('Spectrum of resampled signal');
xlabel('frequency in Hz');
ylabel('magnitude');