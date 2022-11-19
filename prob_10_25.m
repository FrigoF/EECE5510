% prob_10_25 - Generate 2D Blackman filter
%
% Fred J. Frigo
% Marquette University
% Nov 29, 2022
%
% Create a two-dimensional ideal low pass filter which has a normalized 
% sample frequency of 2 and a cutoff frequency of 0.18. Apply a Blackman 
% window to this filter and display the results.
%
fs = 2;
fc = .18;
N = 65;
[f1, f2] = freqspace(N, 'meshgrid');
r = sqrt(f1.^2 + f2.^2);
Hd = ones(N);
Hd(r>fc) = 0;
figure(1);clf;
subplot(2, 2, 1);
mesh(f1, f2, Hd);
title('Ideal filter');
iHdFFT = ifft2(ifftshift(Hd));
subplot(2, 2, 2);
mesh(f1, f2, abs(fftshift(iHdFFT)));
title('Inverse FFT magnitude');
[t1, t2] = freqspace(N, 'meshgrid');
wBlk1 = blackman(N);
wBlk2 = wBlk1*wBlk1';
subplot(2, 2, 3);
mesh(t1, t2, wBlk2);
title('Blackman window');
subplot(2, 2, 4);
freqz2(wBlk2.*fftshift(iHdFFT));
title('Final filter');