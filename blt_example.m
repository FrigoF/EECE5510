% blt_example.m - Bilinear Transformation Example 
% EECE 4510 / 5510 - Marquette University
% Fred J. Frigo, Ph.D.
%  
% https://www.mathworks.com/help/signal/ref/bilinear.html
% Oct 2, 2024

% Design a 6th-order elliptic analog lowpass filter with 5 dB 
% of ripple in the passband, a stopband attenuation of 90 dB, 
% and a cutoff frequency fc=20 Hz.
fc = 20;
[z,p,k] = ellip(6,5,90,2*pi*fc,"s");

% Plot the magnitude response of the analog elliptic filter. 
[num,den] = zp2tf(z,p,k);
[h,w] = freqs(num,den,1024);
figure()
plot(w/(2*pi),mag2db(abs(h)))

% Plot the cutoff frequency
xline(fc,Color=[0.8500 0.3250 0.0980])
axis([0 100 -125 5])
grid
legend(["Magnitude response" "Cutoff frequency"])
xlabel("Frequency (Hz)")
ylabel("Magnitude (dB)")
title('Analog Filter')

% Use the bilinear function to transform the analog filter to 
% a discrete-time IIR filter. Specify a sample rate fs=200 Hz 
% and a prewarping match frequency fp=20 Hz.
fs = 200;
fp = 20;
[zd,pd,kd] = bilinear(z,p,k,fs,fp);

% Plot the magnitude response of the discrete-time filter. 
[hd,fd] = freqz(zp2sos(zd,pd,kd),[],fs);
figure()
plot(fd,mag2db(abs(hd)))

% Plot the cutoff frequency
xline(fc,Color=[0.8500 0.3250 0.0980])
axis([0, fs/2 -125 5])
grid
legend(["Magnitude response" "Cutoff frequency"])
xlabel("Frequency (Hz)")
ylabel("Magnitude (dB)")
title('Discrete Time Filter')

