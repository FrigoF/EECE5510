% Chapter 8 - prob 8.24
% EECE 4510 / 5510 - Marquette University
% Fred J. Frigo, Ph.D.
%
% Nov 2022
%
num = [1.0 2.0 1.0];
den = [1.0 -0.61589 0.23139];
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

% Original System given in problem 8.14
A = [0.0 1.0; -a2 -a1];
B = [0.0; 1.0];
C = [(b2 - b0*a2)  (b1 - b0*a1)];
D = [b0];

% Example 8.14 - Transformation of a System to Avoid Overflow Oscillation
r = roots(den);
alpha = real(r(1,1));
beta = imag(r(1,1));
T = [(-1.0/beta) 0.0; (-alpha/beta) 1.0];
At = T^-1*A*T;
Bt = T^-1*B;
Ct = C*T;
display(At);
display(Bt);
display(Ct);
display(D);