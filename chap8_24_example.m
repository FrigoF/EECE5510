% Chapter 8 - prob 8_24_example
% EECE 4510 / 5510 - Marquette University
% Fred J. Frigo, Ph.D.
%
% Nov 2019
%
num = [1 2 1];
den = [1 -0.61589 0.23139];
b0 = num(1); b1 = num(2); b2 = num(3);
a0 = den(1); a1 = den(2); a2 = den(3);

% Plot Magnitude and Freq response
fs = 1000;
[H, f] = freqz(num, den, 1024, fs);
figure(1);
subplot(2, 1, 1);
plot(f, abs(H), 'b');
title('Magnitude');
subplot(2, 1, 2);
plot(f, unwrap(angle(H))*180/pi, 'b');
title('Phase');

figure(2);
zplane(num,den);
title('pole zero');

A = [0 1; -a2 -a1];
B = [0;1];
C = [(b2 - b0*a2)  (b1 - b0*a1)];
D = [b0];

% OPTIONAL:  Use linearSystemAnalyzer (requires Control Systems Toolbox
Ts = 1/fs; % sampling period
sys_disc = tf(num, den, Ts,'Variable','z^-1');  % discrete time transfer function
linearSystemAnalyzer('impulse', sys_disc);
sys_disc