% prob11_19_cwt.m  - Blandford p.660 continuous wavelet transform
%                Use 'morse', 'amor' & 'bump' instead of 'haar' & 'mexh'
%
% F. Frigo
% Marquette University
% Nov 11, 2020
% 

hr = [50 80 100 75 60 125 40 30];
wr = [80 60 80 100 50 50 100 60];
f = hr(1)*ones(1, wr(1));
for i=2:length(hr);
   f = [f hr(i)*ones(1, wr(i))];
end

fsig = f;
figure;
plot(fsig);
title('input signal');
 
figure;
cwt(fsig)  % default using 'morse'