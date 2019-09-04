% Chapter 3 - prob 3.7
% EECE 4510 / 5510 - Marquette University
% Fred J. Frigo, Ph.D.
%
% Calls fouriersq() function - See Appendix D.1 p 690
%
% Sep 2019
%
fs=5000;
pts=1000;
terms=50;  % N=50
f0=10;
y=3*fouriersq(fs,pts,f0,terms);
y(1001)=0;
dt=1/fs;
t=(0:dt:pts*dt);
figure;
plot(t,y);
title_string=sprintf("Square wave generated from %d terms",terms);
title(title_string);
grid;


