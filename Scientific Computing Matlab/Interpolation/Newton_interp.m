function y_value=Newton_interp(x,y,xx)
% Newton_interp: Newton Interpolation Method to Interpolate at Unknown Point
% y_value =Newton_interp(x,y,xx) 

% 
% Written by:M.Asif Khan
% Contact   : mak4086@gmail.com

% Input
% x  :independent column vector
% y  :dependent column vector
% xx :value at which interpolation is to be done
% Output
% y_value :interpolated value at xx

%
%Sample Test: Remove % and paste the lines on Command Window
%x=[2;4;6;8;10;12;14]
%y=exp(-x);xx=5;
% y_value=Newton_interp(x,y,xx);
%
n = length(x);
if length(y)~=n, error('x and y must be same length'); end
b = zeros(n,n);
b(:,1) = y(:);
for j = 2:n
    for i = 1:n+1-j
        b(i,j) = (b(i+1,j-1)-b(i,j-1))/(x(i+j-1)-x(i));
    end
end
xt = 1;
sum = b(1,1);
for j = 2:n
    xt = xt*(xx-x(j-1));
    sum = sum+b(1,j)*xt;
end
y_value=sum;
end