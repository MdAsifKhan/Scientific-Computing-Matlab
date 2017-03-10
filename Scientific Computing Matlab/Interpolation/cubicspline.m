function yy=cubicspline(x,y,xx)
% cubicspline: Cubic Polynomial Method to Interpolate at Unknown Point
% yy =cubicspline(x,y,xx) 

% 
% Written by:M.Asif Khan
% Contact   : mak4086@gmail.com

% Input
% x  :independent column vector
% y  :dependent column vector
% xx :value at which interpolation is to be done
% Output
% yy :interpolated value at xx

%
%Sample Test: Remove % and paste the lines on Command Window
%x=[2;4;6;8;10;12;14]
%y=exp(-x);xx=5;
% y_value=cubicspline(x,y,xx);
%

ch=input('Choice of Look Up Bin 1. Sequential 2. Binary');
n=length(x);
a_i=y;
h_i=x(1,2:n)-x(1,1:n-1);
i=2:n-1;
ff_i=2*(h_i(1,1:n-2)+h_i(1,2:n-1));
r_i=3*((y(1,i+1)-y(1,i))./h_i(1,2:n-1)-(y(1,i)-y(1,i-1))./h_i(1,1:n-2));
switch ch
    case 1, 
        k=Lookupbin_seq(x,xx);
    case 2,
         k=Lookupbin_binary(x,xx);
    otherwise,
        disp('Unknown Method');
end  
ff=[1 ff_i 1];
e_i=[0 h_i(1:n-2) 0];
g_i=[0 h_i(2:n-1) 0];
r=[0 r_i 0]; 
addpath('F:\MAK\Study\COP\System of Linear Equation');
c_i=Tridiagonalmethod(e_i,ff,g_i,r);
d_i=(c_i(1,2:n)-c_i(1,1:n-1))./(3*h_i);
b_i=(((y(1,2:n)-y(1,1:n-1))./h_i)-(h_i/3).*(2*c_i(1,1:n-1)+c_i(1,2:n)));
yy= a_i(k) + b_i(k)*(xx-x(k))+c_i(k)*(xx-x(k))^2+d_i(k)*(xx-x(k))^3;
end
