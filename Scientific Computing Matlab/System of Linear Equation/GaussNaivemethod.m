function x = GaussNaivemethod(A,b)
% GaussNaivemethod: Naive Gauss Elimination without pivoting
% 
% Written by:M.Asif Khan
% Contact : mak4086@gmail.com

% Input
% A : coefficient matrix
% b : Values of Equation
% Output
% x : Output vector of unknown variables

%
% Sample Test: Remove % and paste the lines on Command Window
% A =[1 2 3;4 5 7;1 7 8];
% b=[8;-10;11];
%x = GaussNaivemethod(A,b)
%
[m,n] = size(A);
if m~=n, error('Matrix A must be square'); end
Aug = [A b];
nn=n+1;
    % forward elimination
    for i=1:n-1
        for j=i+1:n
              if Aug(i,i)==0,Aug(i,i)=0.001;warning('Coefficients are going to zero it may result in no solution');end
                u=Aug(j,i)/Aug(i,i);
                Aug(j,i:nn)=Aug(j,i:nn)-u*Aug(i,i:nn);
        end
    end
    % back substitution
x = zeros(n,1);
x(n) = Aug(n,nn)/Aug(n,n);
    for j = n-1:-1:1
        if Aug(j,j)==0,Aug(j,j)=0.001;warning('Coefficients are going to zero it may result in no solution');end
        x(j) = (Aug(j,nn)-Aug(j,j+1:n)*x(j+1:n))/Aug(j,j);
    end
end    