% Chapter 7 - prob 7.18
% EECE 4510 / 5510 - Marquette University
% Fred J. Frigo, Ph.D.
%
% Nov 2022
%
fs = 1500;T = 1/fs;
Pts = 1024;
t = 0:T:(Pts - 1)*T;
s = chirp(t, 0, Pts*T, 400);
nT = [0:Pts-1]*T;
figure(1);clf;

% find rational scale factors
[p,q]=rat(fs/3500);
sUp = upsample(s, q); %upsample by factor of 'q'

% %Create interpolation filter
fpass = 400;rPass = .001;
fstop = 750;rStop = .001;
F = ([fpass fstop]);M = ([1 0]);
Dev = [rPass rStop];
[N F A W] = firpmord(F, M, Dev, q*fs);
h1 = firpm(N, F, A, W);
% %Filter result
sF = filter(h1, 1, sUp);

% Down sample by factor of 'p'
sUpDn = downsample(sF, p);
nTDn = [0:Pts*q/p]*p*T/q;
stem(nTDn, q*sUpDn, 'Markersize', 1);
axis([.05 .06 -1.2 1.2]);
title('Final signal');
xlabel('time in seconds');
ylabel('voltage');