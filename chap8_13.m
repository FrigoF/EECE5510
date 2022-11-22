% Chapter 8 - prob 8.13
% EECE 4510 / 5510 - Marquette University
% Fred J. Frigo, Ph.D.
%
% Nov 2022
%
fs = 8000;
fpass = 1000;
fstop = 2000;
rpass = 0.03;
rstop = 0.03;
F = ([fpass fstop]);
M = ([1 0]);
Dev = [rpass rstop];
[N F A W] = firpmord(F, M, Dev, fs);
% N = 12;
disp(N);
num = firpm(N, F, A, W);
figure(1);clf;
[H f] = freqz(num, 1, 1024, fs);
plot(f, abs(H));
axis([0 fs/2 0 1.2]);
xlabel('frequency in Hz');
ylabel('gain');
title('Low pass P-M filter');
figure(2);clf;
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
display(num); % display coefficients