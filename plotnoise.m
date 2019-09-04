% plotnoise.m -  Plot random noise signal 
% EECE 4510 / 5510 - Marquette University
% Fred J. Frigo
% Sep - 2019
% 
noise = rand(256,1);
plot(noise);

std(noise)
mean(noise)