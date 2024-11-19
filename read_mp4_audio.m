% read_mp4_audio.m - Reads audio from channel 1 of mp4 file 
% EECE 4510 / 5510 - Marquette University
% Fred J. Frigo 
% Nov 20, 2024
%   
% 

function read_mp4_audio( afile )

if(nargin == 0)
    [fname,dname] = uigetfile('*.*', 'Select MP4 audio file');
    afile = strcat(dname, fname);
end

% Read mp4 file
audioinfo(afile)
[y, Fs] = audioread(afile);
sample_period = 1/Fs;  % Fs = 44.1 kHz for mp4 
num_samples = max(size(y));
sample_time = sample_period * num_samples;

x1 = y(:,1); % first channel
x2 = y(:,2); % second channel

t = linspace(0,sample_time, num_samples);
%
% plot input signal
%
figure();
plot( t, x1);
title('Channel 1 audio');

figure();
plot( t, x2);
title('Channel 2 audio');

