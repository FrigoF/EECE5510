% prob5_30.m - create 2 FIR Filters and Cascade them - page 282 Blandford
% 
% Marquette University
% Oct 8, 2020
%
fs = 16000;
T = 1/fs;
f0 = 1000; 
f1 = 5000; 
f2 = 400;
k = 0:1999;
xo = sin(2*pi*f0*k*T);
n = 0.5*sin(2*pi*f1*k*T) + 0.25*sin(2*pi*f2*k*T);
x = xo + n;

%%%%%%%% Plot original signal %%%%%%%
pts = max(size(k));
figure(1);clf;
nT = [0:pts-1]*T;
subplot(4, 1, 1);
plot(nT, x);
axis([0 10/f0 -1.2 1.2]);
title('Original noisy sine');
xlabel('Time in seconds');
ylabel('voltage');

%%%%%%%% Low pass %%%%%%%%
fpass = 1000;
fstop = 5000;
rpass = 0.01;
rstop = 0.01;
F = [fpass fstop];
M = ([1 0]);
Dev = [rpass rstop];
[N F A W] = firpmord(F, M, Dev, fs);
disp(N);
N = 8;
numl = firpm(N, F, A, W);
figure(2);clf;
[H f] = freqz(numl, 1, 1024, fs);
plot(f, abs(H));
axis([0 fs/2 0 1.2]);
xlabel('frequency in Hz');
ylabel('gain');
title('Low pass Parks-McClelland filter');
figure(3);clf;
subplot(2, 1, 1);
plot(f, abs(H));
axis([0 fpass 1-rpass 1+rpass]);
xlabel('frequency in Hz');
ylabel('gain');
title('pass band');
subplot(2, 1, 2);
plot(f, abs(H));
axis([fstop fs/2 0 rstop]);
xlabel('frequency in Hz');
ylabel('gain');
title('stop band');
%%%% Filter using low pass %%%%%
y = filter(numl, 1, x);
figure(1);
subplot(4, 1, 2);
plot(nT, y, 'r');
axis([0 10/f0 -1.2 1.2]);
title('Filtered with low pass');
xlabel('Time in seconds');

%%%%%%%% high pass %%%%%%%%%
fpass = 1000;
fstop = 400;
rpass = 0.01;
rstop = 0.01;
F = [fstop fpass];
M = ([0 1]);
Dev = [rpass rstop];
[N F A W] = firpmord(F, M, Dev, fs);
disp(N);
N = 55;
numh = firpm(N, F, A, W);
figure(4);clf;
[H f] = freqz(numh, 1, 1024, fs);
plot(f, abs(H));
axis([0 fs/2 0 1.2]);
xlabel('frequency in Hz');
ylabel('gain');
title('High pass Parks-McClelland filter');
figure(5);clf;
subplot(2, 1, 1);
plot(f, abs(H));
axis([fpass fs/2 1-rpass 1+rpass]);
xlabel('frequency in Hz');
ylabel('gain');
title('pass band');
subplot(2, 1, 2);
plot(f, abs(H));
axis([0 fstop 0 rstop]);
xlabel('frequency in Hz');
ylabel('gain');
title('stop band');
%%%%% Filter using high pass %%%%%%
y = filter(numh, 1, x);
figure(1);
subplot(4, 1, 3);
plot(nT, y, 'r');
axis([0 10/f0 -1.2 1.2]);
title('Filtered with high pass');
xlabel('Time in seconds');
ylabel('voltage');
%%%%%% Combine high and low %%%%
numc = conv(numl, numh);
figure(6);clf;
[H f] = freqz(numc, 1, 1024, fs);
plot(f, abs(H));
axis([0 fs/2 0 1.2]);
xlabel('frequency in Hz');
ylabel('gain');
title('Combined filter');

y = filter(numc, 1, x);
figure(1);
subplot(4, 1, 4);
plot(nT, y, 'r');
axis([0 10/f0 -1.2 1.2]);
title('Filtered with combined filter');
xlabel('Time in seconds');
ylabel('voltage');
