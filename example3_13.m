% Example 3.13 - p 119 Blandford and Parr
%
% F. Frigo  15-Sep-2020
%
sample_period=0.001;
N = 256+1; 
t= 0:sample_period:(N-1)*sample_period;
hz=linspace(-0.5/sample_period, 0.5/sample_period, N);
w=hz/2*pi;

w0 = 100.0;
magnitude = 1.0;
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
XM_ideal = zeros(N);
offset = (N+1)/2; 
w0_index = round(w0/(8*pi));
XM_ideal(offset - w0_index) = magnitude*pi; 
XM_ideal(offset + w0_index) = magnitude*pi;
figure();
plot(w,abs(XM_ideal));
ylabel('Magnitude');
xlabel('freq in rad/sec');
title('Ideal Solution'); drawnow;

