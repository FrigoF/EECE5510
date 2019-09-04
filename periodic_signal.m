% periodic_signal.m - periodic signal with 10 cycles
% EECE 4510 / 5510 - Marquette University
%
% Fred J. Frigo
% Sep-2019

ff = 10;     % desired frequency in Hz
dur = 1.0;   % duration of the waveform in seconds

tt = 0:1/(100*ff):dur; %-- gives 100 samples per period
xx = sin(2*pi*ff*tt);

figure();
plot( xx );
title('Input Signal');

