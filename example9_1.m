% Example 9.1 - p 488 Blandford and Parr
% 
% F. Frigo  10-Nov-2020
% Marquette University
%
% PWMChirp.m
%
fs = 1000; T = 1/fs;
N = 1000;
% Example 9.1:
t = 0:T:(N-1)*T;
y = chirp(t, 0, N*T, 600);
y = (y + 1)/2; %normalize 0 to 1
% Problem 9.1:
% fsig = 100;
% t = 0:T:((3*N*T)-T);
% y = 0.5*(sawtooth(2*pi*fsig*t, 0.5)+1);
N1 = max (size(y)); 
figure(1); clf;
plot(t, y);  % plot input signal
axis([0 0.4 -0.1 1.1]);

% Create the PWM signal in an matrix which has N2 rows x N columns
%    where each column represents one sample of the signal.
% Here each column has v ones and N2-v zeros where v is the
%    value of the signal at the sample
b = 7; N2 = 2^b; %bits of resolution
PWMOut = zeros(N2, N1);
for i=1:size(PWMOut,2)
   v = fix(y(i)*N2);
   s = [ones(1, v) zeros(1, N2 - v)];
   PWMOut(:, i) = s';
end
%Change PWMOut which is N2 x N to a column matrix that is
% (N2*N) x 1.
PWMPlot = PWMOut(:);
hold on;
%PWMPlot has N2 times as many samples as t.
Ts = T/N2;
t1=0:Ts:(N1*T)-Ts;
%t1 = linspace(0,((N2*N1)-Ts),(N2*N1));
plot(t1, PWMPlot);
axis([0 0.04 -0.1 1.1]); % This is an early segment of the signal
title ('PWM encoded signal');
xlabel('time in seconds');
ylabel('signal amplitude');