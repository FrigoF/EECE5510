% Prob 9.14 -  Save Chirp signal to audio file for playback
%
% EECE 4510 / 5510 - Marquette University
% Fred J. Frigo, Ph.D.
%  
fs = 8000; T = 1/fs;
t = (0:3*fs)*T; % 3 seconds
u = .49*(chirp(t, 10, 3, 1000)+1);

% wavwrite(u, fs, 'ChirpWav');  % wavwrite is replaced by audiowrite()
sound(u,fs);  % play sound
audiowrite('ChirpSound.wav',u,fs);  % *.wav format

% For *.mp4 audiowrite() supports only 44100 or 48000 Hz Sample Rate
originalFs = fs;
desiredFs = 44100; % 48000 also supported for mp4
[p,q] = rat(desiredFs / originalFs);
y = resample(u,p,q);
ynorm = y/max(y); % after resampling limit signal to +1/-1
audiowrite('ChirpSound.mp4',ynorm, desiredFs);  % *.mp4 format

dtime = 0.001; % [0.08  0.01 0.001] delay time in seconds
k = 1; 
delay = fix(fs*dtime);
disp('Filter delay taps =');
disp(delay);
num = zeros(1, delay);
num(1) = 1;
num(delay) = k; 
den = zeros(1, delay);
den(1) = 1;
[H f] = freqz(num, den, 8192, fs);
figure(1);clf;
subplot(2, 1, 1);
plot(f, abs(H)/max(abs(H)));
axis([0 fs/2 0 1.2]);
xlabel('frequency in Hz');
ylabel('gain');
title(['Frequency response: delay = '...
num2str(dtime) 'seconds']);
subplot(2, 1, 2);
zplane(num, den);
y = filter(num, den, u);
sound(y, fs);  % Play the new sound
