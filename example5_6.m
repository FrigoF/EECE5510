% Example 5.6 - p 230 Blandford and Parr
% 
% F. Frigo  20-Sep-2022
% Marquette University
%
% 
% FIRDesignExample.m
fs = 11025;
fpass = 1650;Rp = .01;
fstop = 2000;Rs = .01;
deltaf =((fstop-fpass)/ (fs/2));
len = round(4.4/deltaf);
len = len + 20;
fc = (fpass + fstop)/2;
num = fir1(len-1, fc/(fs/2), hamming(len));
[H, f] = freqz(num, 1, 1024, fs);

% Create & plot another hamming filter with 10 taps
len = 10;
num = fir1(len-1, fc/(fs/2), hamming(len));
[H2, f2] = freqz(num, 1, 1024, fs);

% Plot the magnitude response for different filter lengths
figure (1); clf;
hold on;
a1 = plot(f,abs(H)); M1 = "N = 89";
a2 = plot(f2,abs(H2)); M2 = "N= 10";
legend([a1,a2], [M1, M2]);
xlabel("Magnitude response"); 



