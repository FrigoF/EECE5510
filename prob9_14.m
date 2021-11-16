% Prob 9.14 -  Save Chirp signal to audio file for playback
%
% EECE 4510 / 5510 - Marquette University
% Fred J. Frigo, Ph.D.
%  
fs = 8000; T = 1/fs;
t = (0:3*fs)*T; % 3 seconds
u = .49*(chirp(t, 10, 3, 1000)+1);

% wavwrite(u, fs, 'ChirpWav');  % wavwrite is replaced by audiowrite()
sound(u,fs); % play sound
audiowrite('ChirpSound.wav',u,fs);  % *.wav format

% For *.mp4 audiowrite() supports only 44100 or 48000 Hz Sample Rate
originalFs = fs;
desiredFs = 44100; % 48000 also supported for mp4
[p,q] = rat(desiredFs / originalFs);
y = resample(u,p,q);
ynorm = y/max(y); % after resampling limit signal to +1/-1
audiowrite('ChirpSound.mp4',ynorm, desiredFs);  % *.mp4 format
