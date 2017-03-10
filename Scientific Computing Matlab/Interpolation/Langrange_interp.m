function y_value=Langrange_interp(x,y,xx)
% Langrange_interp: Langrange Interpolation Method to Interpolate at Unknown Point
% yint =Linear_interp(x,y,xx) 

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
%y=4*x+5;xx=5;
% y_value=Langrange_interp(x,y,xx);
%

n=length(x);
if length(y)~=n, error('x and y must be same length'); end
sum=0;
for i=1:n
    prod=1;
    for j=1:n
        if i~=j,prod= prod*(xx-x(j))/((x(i)-x(j)));end
    end
    sum=sum+prod*y(i);
end    
y_value=sum;
end