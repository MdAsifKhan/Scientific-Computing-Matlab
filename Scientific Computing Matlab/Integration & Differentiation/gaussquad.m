function I = gaussquad(funcn,a,b)
% gaussquad: Method of undetermined coefficient
%
% input:
% funcn :function to be integrated
% a,b   :Integration limits
% output:
% I     :Integral Value
%
%funcn=@(x) x^2+3*x+1; a=0;b=2;
% I=gaussquad(funcn,a,b)
%

if (b<a),error('upper bound must be greater than lower'),end
x1=-1/sqrt(3);x2=1/sqrt(3);
p=(a+b)/2;q=(b-a)/2;
g=@(x) funcn(p+q*x)*q;
I=g(x1)+g(x2);
end