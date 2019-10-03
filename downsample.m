% Down sample -  Example of resampling 
% EECE 4510 / 5510 - Marquette University
% Fred J. Frigo, Ph.D.
%
% The GE MRI scanner provides a sampled signal at 125 KHz.
% The doctor would like to use 100 KHz (Siemens)
% 


% Example of how to call rat when converting from 125 kHz to 100 kHz:
originalFs = 125000;
desiredFs =  100000;

[p,q] = rat(desiredFs / originalFs);

tEnd = 0.1;  % 100 msec long signal
Tx = 0:1/originalFs:tEnd;
f = 100; % freq of time domain signal is 100 Hz
x = sin(2*pi*f*Tx);

y = resample(x,p,q);
Ty = (0:numel(y)-1)/desiredFs;

plot(Tx,x,'. ')
hold on
plot(Ty,y,'o ')
hold off
legend('Original','Resampled')

