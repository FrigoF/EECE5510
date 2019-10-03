% Zero Padding / Interpolation example 
% EECE 4510 / 5510 - Marquette University
% Fred J. Frigo, Ph.D.
%

ff = 5;     % desired frequency in Hz
dur = 2;   % duration of the waveform in seconds
tt = 0:1/(100*ff):dur; %-- gives 100 samples per period
xx = sin(2*pi*ff*tt);
N = max(size(tt));  % number of samples

figure();
plot( xx );
title('Input Signal');

% Fourier transform the original signal
yy=fft(xx);   
figure();
plot(abs(yy));
title('Magnitude of Fourier transformed input signal');


% Zero pad the frequecy coefficients array by factor of 4
ZP = 4;
zz=zeros(1,ZP*N);
N2=int16(0.5*N);
% Copy first half of FFT results to array.
zz(1:N2)= yy(1:N2);
% Copy last half of FFT results to array.
zz((ZP*N)-N2:ZP*N)= yy(N2-1:N);

figure();
plot(abs(zz));
title('Magnitude of zero-padded Fourier transformed input signal');

% Inverse Fourier transform and plot interpolated signal
znew=ifft(zz); 
figure();
plot(real(znew));
title('Magnitude of zero padded inverse Fourier transformed input signal');