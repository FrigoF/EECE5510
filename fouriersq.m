%fouriersq.m - Generates a square wave from the Fourier series
% using a fixed number of points
%
% sqwave = fouriersq(11025, 1024, 100, 15);
%
% Evaluates the Fourier expansion for a square wave
% fs - sample frequency
% pts - number of points in the wave
% fO - base frequency of the square wave
% terms - number of terms in the Fourier sum.
% Maximum frequency is (2*terms - l)*f0.
function sq = fouriersq(fs, pts, f0, terms)
T = 1/fs;
n = 1:pts ;
nT = n*T;
w = 2*f0*pi;
sq = zeros (1, length (nT) );
for k = 1:2:2*terms
sq = sq + (4/ (k*pi))*sin(k*w*nT) ;
end