% Problem 6.21 - p 362 Blandford and Parr
% Implementation of Parks-McClellan FIR filter.
% Plot "exploded" views (zoom-in) to show pass band & stop band ripple
%
% Note: this is for the FIR filter only, the problem also requires
% similar code for the elliptic filter 
%
% F. Frigo  15-Oct-2019
%
fs = 1000;
fpass = 150;
Rpass = 0.03;RpDB = -20*log10(1-Rpass);
fstop = 200;
Rstop = 0.03;RsDB = -20*log10(Rstop);
%Parks-McClellan
F = ([0 .3 .4 1]);
M = ([1 1 0 0]);
N = 28;
num = firpm(N, F, M);
den = 1;
[H, f] = freqz(num, den, 1024, fs);
fprintf(1, ['Parks McClellan order is ' num2str(N) '\n']);
figure(1);clf;
subplot(2, 1, 1)
plot(f, abs(H), 'b');
axis([0 fs/2 0 1.2]);
title('Parks McClellan FIR filter');
xlabel('frequency in Hz');
ylabel('gain');
subplot(2, 1, 2);
plot(f, unwrap(angle(H))*180/pi, 'b');
title('Phase');
xlabel('frequency in Hz');
ylabel('phase in degrees');

% Blowups of Pass Band and Stop Band
figure(2);clf;
subplot(3, 1, 1);
plot(f, abs(H), 'b');
axis([0 fpass 1-Rpass 1+Rpass]);
title('Pass band');
xlabel('frequency in Hz');
ylabel('gain');
subplot(3, 1, 2);
plot(f, abs(H), 'b');
axis([fpass fstop 0 1+Rpass]);
title('Transistion band');
xlabel('frequency in Hz');
subplot(3, 1, 3);
plot(f, abs(H), 'b');
axis([fstop fs/2 0 Rstop]);
title('Stop band');
xlabel('frequency in Hz');
ylabel('gain');


% OPTIONAL:  Use linearSystemAnalyzer (requires Control Systems Toolbox
% Ts = 1/fs; % sampling period
% sys_disc = tf(num, den, Ts,'Variable','z^-1');  % discrete time transfer function
% linearSystemAnalyzer('impulse', sys_disc);
