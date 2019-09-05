% chap2_7.m  - Prob 2.7 p75 Blandford
% EECE 4510 / 5510 - Marquette University
% Fred J. Frigo
% Sep - 2019
% 
% From Fig P2.4

x =[ 0, 0, 1, 2, 4, 8, 16, 32, 0, 0, 0];
n =[-2,-1, 0, 1, 2, 3,  4,  5, 6, 7, 8];

figure();
stem( n, x);
title( "Fig P2.4");

% part a
na = n + 2;
figure()
stem( na, x);
title("Prob 2.7 part a")