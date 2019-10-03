% Parseval Example 
% EECE 4510 / 5510 - Marquette University
% Fred J. Frigo, Ph.D.
%  

ff = 25;     % desired frequency in Hz
dur = 2.0;   % duration of the waveform in seconds
tt = 0:1/(100*ff):dur; %-- gives 100 samples per period
xx = sin(2*pi*ff*tt);
N = max(size(tt));  % number of samples

figure();
plot( xx );
title('Input Signal');
sum_time_domain = norm(xx(:))^2

yy=fftn(xx)/sqrt(N);   %Normalize by number of samples
figure();
plot(abs(yy));
title('Magnitude of Fourier transformed input signal');
sum_freq_domain = norm(yy(:))^2
