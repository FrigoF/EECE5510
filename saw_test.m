% saw_test-  test fouriersaw
%
% EECE 4510 / 5510 - Marquette University
% Fred J. Frigo, Ph.D.
%  
fs = 22050; T = 1/fs;
f0 = 440;
pts = 2^15;
terms = fix(( fs/2/f0 + 1)/2);
sw = fouriersaw( fs, pts, f0, terms);
sw = sw/max(sw) ; % scale
nT = [0:pts-1]*T;
figure();
plot( nT, sw);
sound(sw, fs);
