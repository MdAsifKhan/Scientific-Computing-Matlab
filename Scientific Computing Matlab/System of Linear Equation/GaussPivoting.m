function x = GaussPivoting(A,b)
% GaussPivoting: Gauss elimination using pivoting

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
%   B=[8;-10;11];
%x = GaussPivoting(A,b)
%
[m,n]=size(A);
if m~=n, error('Matrix A must be square'); end
nn=n+1;
Aug=[A b];
% Forward Elimination
    for k = 1:n-1
        %Partial Pivoting
        [~,idx]=max(abs(Aug(k:end,k)));
        q=idx+k-1;
        if q~=k
            Aug([k,q],:)=Aug([q,k],:);
        end
        for ii=k+1:n
            factor=Aug(ii,k)/Aug(k,k);
            Aug(ii,k:nn)=Aug(ii,k:nn)-factor*Aug(k,k:nn);
        end
    end
        % back substitution
    x=zeros(n,1);
    x(n)=Aug(n,nn)/Aug(n,n);
    for jj = n-1:-1:1
        x(jj)=(Aug(jj,nn)-Aug(jj,jj+1:n)*x(jj+1:n))/Aug(jj,jj);
    end
end    