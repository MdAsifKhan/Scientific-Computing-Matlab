function I = trapezoidaluneq(x,y)
% trapezoidaluneq: unequal spaced trapezoidal rule quadrature
% Applies the trapezoidal rule to determine the integral
% for n data points, where x and y must be of the same length
% input :
% x     : vector of independent variables
% y     : vector of dependent variables
% output:
% I     : integral Value
%
%x=[];y=[];
% I=trapezoidaluneq(x,y)
%
if nargin<2,error('at least 2 input arguments required'),end
if any(diff(x)<0),error('x is not monotonically increasing'),end
n=length(x);
if length(y)~=n,error('x and y must be same length'); end
sum=0;
for i=1:n-1
    sum=sum+0.5*(x(i+l)-x(i))*(y(i)+y(i+l));
end
I=sum;
end