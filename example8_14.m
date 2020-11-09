% Example 8.14 - p 375 Blandford and Parr
% 
% F. Frigo  10-Nov-2020
% Marquette University
%
num = [ 1 2 1 ] ; 
den = [1 -1 0.8];

A=[0 1.0; -0.8 1]; % Controllable Form
B=[0; 1];
C=[2 3];
D=[1];

r = roots(den);
alpha = real(r(1,1));
beta = imag (r(1,1));
T = [(-1/beta) 0; (-alpha/beta) 1];
At = T^-1*A*T;
Bt = T^-1*B;
Ct = C*T;
figure (1) ;clf;
axis([-1.2 1.2 -1.2 1.2]);
line([1 -1], [1 1]);line([-1 -1], [1 -1] );
line([-1 1],[-1 -1]);line([1 1],[-1 1] );
v = [0.95; -0.95] ;count = 0;
while ((( v(1,1) ~= 0) && (v(2,1) ~= 0) ) && count < 50)
   Vnew = At*v;
   % Use twos complement overflow
   Vnew = twosover(Vnew);
   x = [v(1,1) Vnew(1,1)];
   y = [v(2,1) Vnew(2,1)];
   line(x,y,'Color','blue');
   v = Vnew;
   count = count + 1;
end
disp('At =');disp(At);
disp('Bt =');disp(Bt);
disp('Ct =');disp(Ct);
disp('D =');disp(D);
