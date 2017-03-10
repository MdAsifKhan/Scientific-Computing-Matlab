function I = compsimpson(funcn,a,b,n,varargin)
% compsimpson: composite trapezoidal rule quadrature
% composite trapezoidal rule
% input:
% funcn :function to be integrated
% a,b   :Integration limits
% n     :number of data point, by default=100
% output:
% I     :Integral Value
%
%funcn=@(x) x^2+3*x+1; a=0;b=2;n=5;
% I=compsimpson(funcn,a,b,n)
%

if nargin<3,error('at least 3 input arguments required'),end
if (b<a),error('upper bound must be greater than lower'),end
if nargin<4,n=100;end
x=a;h=(b-a)/(n-1);
sum=0;sum1=0;
for i=2:2:floor(n-1)
    x=x+h;sum=sum+4*funcn(x);
end
x=a;
for i=3:2:floor(n-2)
    x=x+h;sum=sum+2*funcn(x);
end
    I=h/3*(funcn(a)+sum+sum1+funcn(b));
end
