% Problem example 3.13 - p 119 Blandford and Parr
%
% F. Frigo  15-Sep-2020
%
sample_period=0.001;
N = 256;
t=[0:sample_period:(N-1)*sample_period];
hz=linspace(-0.5/sample_period, 0.5/sample_period, N);
w=hz*2*pi;

x=cos(100*t);

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
