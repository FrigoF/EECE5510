% Example 3.13 - p 119 Blandford and Parr
% Modified to show analytical solution
%
% F. Frigo  15-Sep-2026
%
sample_period=0.001;  % 0.1 for Prob 3.38
N = 256+1;  % 128+1 for Prob 3.38
t= 0:sample_period:(N-1)*sample_period;
hz=linspace(-0.5/sample_period, 0.5/sample_period, N);
w=hz*2*pi;

w0 = 100.0;  % 6*pi (3 Hz) for Prob 3.8
magnitude = 1.0;  % 3.0 for Prob 3.8
x = magnitude*cos(w0*t);

figure();
plot(t, x);
ylabel('Input signal');
xlabel('msec');

X=fft(x,N);
XM=fftshift(X);
figure();
plot(hz, abs(XM));
ylabel('Magnitude');
xlabel('freq in hz');

figure();
plot(w, abs(XM));
ylabel('Magnitude');
xlabel('freq in rad/sec');

% Analytic solution using table 3.3 on page 96
XM_ideal = zeros(1,N);

% Find the locations of +w0 and -w0 in the frequency vector
[~, w0_index]  = min(abs(w - w0));
[~, wm0_index] = min(abs(w + w0));

% Fourier transform of magnitude*cos(w0*t)
XM_ideal(w0_index)  = magnitude*pi;
XM_ideal(wm0_index) = magnitude*pi;

figure();
stem(w,abs(XM_ideal),'Marker','none');
ylabel('Magnitude');
xlabel('freq in rad/sec');
title('Analytic Solution');
drawnow;
