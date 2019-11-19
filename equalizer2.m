function [num, den] = equalizer2(f0, A, bw, fs, Abw)
%
%equalizer2.m - Creates a second order parametric equalizer
%
% [num den] = equalizer2(f0, A, bw, fs, Abw);
%
% f0 - center frequency
% f0 = 0 for a low pass shelving filter
% f0 = fs/2 for a high pass shelving fitler
% 0 < f0 < fs/2 creates a peak or notch filter
% A - the peak or notch gain
% A > 1 for a peak or boost filter
% 0 < A < 1 for a notch or cut filter
% bw - bandwidth in Hz
% fs - sample frequency in Hz
% Abw - the gain at bandwidth frequency
% Abw defaults to A - (A-l)/sqrt(2)
if (nargin < 4 || nargin > 5)
  disp('error');
  disp('Usage: [num den] = equalizer2(f0, A, bw, fs, Abw);');
  disp('[num den] = equalizer2(f0, A, bw, fs);');
  return;
end 

if (nargin == 4)
  Abw = A - (A-1)/sqrt(2);
end

f0 = f0/fs; w0 = 2*pi*f0;
bw = 2*pi*(bw/fs);
B = sqrt((Abw^2 - 1)/(A^2 - Abw^2))*tan(bw/2);
a0 = (1 + A*B) ;
a1 = -2*cos(w0);
a2 = 1 - A*B;
b0 = 1 + B;
b1 = -2 *cos(w0);
b2 = 1 - B;
num = [a0 a1 a2]/b0;
den = [b0 b1 b2]/b0;
return;