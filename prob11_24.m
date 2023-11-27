% Prob 11.24 - Blandford  p. 662
%
% F. Frigo
% Marquette University
% Nov 27, 2023

N = 4000; % Number of points
fs = 1000;T = 1/fs;  % Sampling freq = 1000 Hz
t = 0:T:(N-1)*T;

% create an input signal
x = zeros([1 N]);
t1 = 0:T:(1000-1)*T;
x(1:1000) = 2.0*cos(90*2*pi*t1);
t2 = 0:T:(1400-1)*T;
x(1001:2400) = 1.2*cos(60*2*pi*t2);
t3 = 0:T:(300-1)*T;
x(2401:2700) = 0.8*cos(50*2*pi*t3);
x(2801:3100) = 0.8*cos(50*2*pi*t3);
x(3201:3500) = 0.8*cos(50*2*pi*t3);
x(3601:3900) = 0.8*cos(50*2*pi*t3);

%
% plot input signal
%
figure();
plot( t, x);
title('input signal');
xlabel('seconds');

% FFT
y = fft(x);
figure();
x1 = linspace(0,500,2000);
plot (x1, abs(y(1:2000)));
title('fft')
xlabel('frequency in Hz')

% Spectrogram
figure();
spectrogram(x, 'yaxis');

%
% Continuous Wavelet Transform 
figure();
cwt( x, 1/T, 'morse');


