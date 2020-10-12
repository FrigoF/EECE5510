% Example 6.12 - p 319 Blandford and Parr
% Implementation of elliptic filter 
%
% F. Frigo  11-Oct-2020
%
fs = 11025;
fpass = 2000;
Rpass = 0.01;RpassDB = -20*log10(1-Rpass);
fstop = 2700;
Rstop = 0.05;RstopDB = -20*log10(Rstop);
[N fp] = ellipord(fpass/(fs/2), fstop/(fs/2), RpassDB, RstopDB);
[num den] = ellip(N, RpassDB, RstopDB, fp);
[H f] = freqz(num, den, 1024, fs);
figure(1);clf;
subplot(2, 1, 1);
plot(f, abs(H), 'b');
axis([0 fs/2 0 1.2]);
title('Elliptic IIR filter');
xlabel('frequency in Hz');
ylabel('gain');
subplot(2, 1, 2);
plot(f, unwrap(angle(H))*180/pi, 'b');
title('Phase');
xlabel('frequency in Hz');
ylabel('phase in degrees');
fprintf(1, ['Elliptic order is ' num2str(N) '\n']);
