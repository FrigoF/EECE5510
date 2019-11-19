
function [num, den] = equalizer1(low, A, fs, fc, Ac)
% equalizerl.m - Creates a first order parametric equalizer
%
% [num den] = equalizer1(low, A, fs, fc, Ac);
%
% low - Determines low or high filter
% low = 0 for a high pass shelving filter
% low = 1 for a low pass shelving fitler
% A - the gain for the boost or the cut
% A > 1 for a boost filter
% 0 < A < 1 for a cut filter
% fs - sample frequency in Hz
% fc - the cutoff frequency
% Ac - the gain at fc. If Ac is omitted the default value is
% Ac = (sqrt(2)/2)*(A - 1) + 1 for a boost
% Ac = (sqrt(2)/2)*(1 - !) + A for a cut

if (nargin < 4 || nargin > 5)
  disp ('error');
  disp('Usage: [num den] = equalizerl(low, A, fs, fc, Ac);');
  disp('Usage: [num den] = equalizerl(low, A, fs, fc);');
  return;
end

if (nargin == 4 && A > 1)
  Ac = (sqrt(2)/2)* (A - 1) + 1;
end

if(nargin == 4 && A < 1)
  Ac = 1 - (sqrt(2)/2)*(1 - A);
end

alpha = pi*fc/fs;
if (low == 1)
  d = sqrt((Ac^2 - 1)/(A^2 - Ac^2));
else
  d = sqrt((Ac^2 - A^2)/(1 - Ac^2));
end

p1 = (1 - d * tan(alpha ) ) / ( 1 + d*tan(alpha) );
beta = (1 - p1 ) / ( 1 + p1 );

if(low == 1)
  z1 = (1 - A*beta)/(1 + A*beta);
  K = (1 + pi) / (1 + z1) ;
else
  z1 = (A - beta)/(A + beta);
  K = (1 - pi)/ (1 - z1) ;
end
num = K*[1 -z1];
den = [1 -p1];
return;