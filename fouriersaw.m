% fouriersaw.m - Generates a sawtooth wave from the Fourier series
% using a fixed number of points
% sawwave = fouriersaw(11025, 1024, 100, 15);
%
% Evaluates the Fourier expansion for a sawtooth wave
% fs - sample frequency
% pts - number of points in the wave
% fO - base frequency of the square wave
% terms - number of terms in the Fourier sum.
% Maximum frequency of the sawtooth is terms*f0.
function saw = fouriersaw(fs, pts, f0, terms)
T = 1/fs;
n = 1:pts;
nT = n*T;
w = 2*f0*pi;
saw = zeros(1, length(nT));
for k = 1:terms
   saw = saw + 1/(2*k*pi)*sin(k*w*nT);
end