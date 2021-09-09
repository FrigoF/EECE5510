% This MATLAB program performs the convolution operation of
% Example 2.12  (Blandford)
% Establish the input unit-step function.
x=ones (1,11);
% Compute the system impulse response.
for k = 1:10
  h(k) = 0.6^(k-1);
end
% Convolve the input with the impulse response and plot.
c=conv (x,h);

for k=1:11
  n(k)=k-1;
  y(k) =c(k);
end
figure();
stem(n, y, 'fill');