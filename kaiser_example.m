% kaiser_example - p 233 Blandford and Parr
% 
% F. Frigo  28-Sep-2022
% Marquette University
%
% 
len = 50;
alpha1 = 0.5;
alpha2 = 0.4;
kwin1 = kaiser( len, alpha1);
kwin2 = kaiser( len, alpha2);

% Plot the Kaiser windows with different alpha values
figure (1); clf;
hold on;
a1 = plot(kwin1); M1 = "alpha = 0.5";
a2 = plot(kwin2); M2 = "alpha = 0.4";
legend([a1,a2], [M1, M2]);
xlabel("Kaiser Windows"); 



