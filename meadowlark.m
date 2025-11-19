% Wavelet Analysis of Western Meadowlark sounds 
% EECE 4510 / 5510 - Marquette University
% Fred J. Frigo 
% Nov 20, 2025
%   
% Acknowledgement:  Data acquired from:  Birds Inc.
%  https://www.youtube.com/watch?v=lngs9-X5cPM
% 

tic
% Read audio channel 1 from an MP4 file
filename = 'meadowlark_song.mp4';  
[audio, fs] = audioread(filename);
audio_ch1 = audio(:,1);       % Use channel 1
t = (0:length(audio_ch1)-1) / fs;

% Compute CWT coefficients 
[cfs, freqs] = cwt(audio_ch1, fs);
cwtMag = abs(cfs);

% -------- TOP: CWT results --------
figure;
ax1 = subplot(2,1,1);
imagesc(t, flipud(freqs), cwtMag);   % Flip the freq scale 
axis xy;                    % Ensures lower f is at bottom
axis tight;
xlabel('Time (s)');
ylabel('Frequency (Hz)');
title('CWT Scalogram (Channel 1)');
%colorbar;

% -------- BOTTOM: Time-domain waveform --------
ax2 = subplot(2,1,2);
plot(ax2, t, audio_ch1);
xlabel(ax2, 'Time (s)');
ylabel(ax2, 'Amplitude');
title(ax2, 'Time-domain Signal (Channel 1)');
grid(ax2, 'on');
toc