% chap2_6.m  - Prob 2.6 p75 Blandford
% EECE 4510 / 5510 - Marquette University
% Fred J. Frigo
% Sep - 2019
% 
% From Fig P2.5

x =[ 0,  0,  0,  0,  2,  2, -4, -4, 0, 0, 0];
u =[ 0,  0,  0,  0,  0,  1,  1,  1, 1, 1, 1];
n =[-5, -4, -3, -2, -1,  0,  1,  2, 3, 4, 5];

figure();
stem( n, x);
ylim([-5 5]);
title( "Fig P2.5");

% part a
xa = fliplr(x);  % reverse
figure()
stem( n, xa.*u); % element wise multiply
ylim([-5 5]);
title("Prob 2.6 part a")

