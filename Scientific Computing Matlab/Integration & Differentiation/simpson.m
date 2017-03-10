function I = simpson(funcn,a,b,choice,varargin)
% simpson: composite trapezoidal rule quadrature
% composite trapezoidal rule
% input:
% funcn  :function to be integrated
% a,b    :Integration limits
% choice :Whether one-third or three-eight rule by default 'one-third' 
% output :
% I      :Integral Value
%
%funcn=@(x) x^2+3*x+1; a=0;b=2;n=5;choice='one-third';
% I=trapezoidal(funcn,a,b,n)
%

if nargin<3,error('at least 3 input arguments required'),end
if (b<a),error('upper bound must be greater than lower'),end
if strcmp(choice,'one-third')
    x(1)=a;x(2)=(a+b)/2;x(3)=b;
    h=(b-a)/2;
    I=(h/3)*(funcn(x(1))+4*funcn(x(2))+funcn(x(3)));
elseif strcmp(choice,'three-eight')
    x=linspace(a,b,4);
    h=(b-a)/3;
    I=(3*h/8)*(funcn(x(1))+3*funcn(x(2))+3*funcn(x(3))+funcn(x(4)));
end    
end