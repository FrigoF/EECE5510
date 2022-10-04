% Example 6_4 - Blandford   p297
% Creates a Butterworth filter such that
% fs = 44,100 Hz
% pass band 0 - 4000 Hz; stopband 6000 Hz to fs/2
% pass band ripple = .01; stopband ripple = .03
fs = 44100;
fs2 = fs/2;
fpass = 4000; Rp = .01; RpDB = -20*log10(1-Rp);
fstop = 6000; Rs = .03; RsDB = -20*log10(Rs);
[N fc] = buttord(fpass/fs2, fstop/fs2, RpDB, RsDB);
[num den] = butter(N, fc) ;
[H f] = freqz(num, den, 1024, fs) ;
figure(1);clf;
subplot(2, 1, 1);
plot(f, abs(H));
title('Low-pass Butterworth filter');
axis([0 fs/2 0 1.2]);
xlabel('frequency in Hertz');
ylabel('gain');
subplot(2, 1, 2);
plot(f, 180*angle(H)/pi);
axis([0 fs/2 -180 180]);
xlabel('frequency in Hertz');
ylabel('Phase in degrees');