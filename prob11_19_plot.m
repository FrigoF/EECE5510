% prob11_19_plot.m  - Blandford p.660 continuous wavelet transform
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
Fs = 1; % Sample Frequency not given, set to 1 Hz
N = max(size(fsig));
duration = N*Fs;
t = linspace(0,duration,N);

wavelet_type = 'morse';
[cfs, frq] = cwt(fsig, wavelet_type, Fs); 
figure();
ax(1) = subplot(3,3,(7:9));
plot(t,fsig)
axis tight
xlabel('Time (sec)')
ylabel('Amplitude');
ax(2) = subplot(3,3,(1:6));
tmp1 = abs(cfs);
t1 = size(tmp1,2);
tmp1 = tmp1';
minv = min(tmp1);
tmp1 = (tmp1 - minv(ones(1,t1),:));
maxv = max(tmp1);
maxvArray = maxv(ones(1,t1),:);
indx = maxvArray < eps;
tmp1 = 240*(tmp1./maxvArray);
tmp2 = 1+fix(tmp1);
tmp2(indx) = 1;
tmp2 = tmp2';
pcolor(t,frq,tmp2);
shading interp;
ylabel('Frequency');
title(wavelet_type);
colormap(jet);
%colorbar;
linkaxes(ax,'x');
