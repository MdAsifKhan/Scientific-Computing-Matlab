function x = Tridiagonalmethod(e,f,g,r)
% Tridiagonalmethod: Solving system of equations using Tridiagonal Method.
% x : Tridiagonalmethod(e,f,g,r)
% Input:
% e : subdiagonal vector
% f : diagonal vector
% g : superdiagonal vector
% r : Values of Equation
% output:
% x : Output vector of unknown variables

%
% Sample Test: Remove % and paste the lines on Command Window
% f =[2.04 2.04 2.04 2.04];
% e=[0 -1 -1 -1];
% g=[-1 -1 -1 0];
% r=[40.8 0.8 0.8 200.8]
%x = Tridiagonalmethod(e,f,g,r)
n=length(f);
% forward elimination
for k = 2:n
    ff=e(k)/f(k-1);
    f(k)=f(k)-ff*g(k-1);
    r(k) = r(k)-ff*r(k-1);
end
% back substitution
x(n) = r(n)/f(n);
for k = n-1:-1:1
    x(k)=(r(k)-g(k)*x(k+1))/f(k);
end