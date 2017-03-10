function [x,A] = LU_withPivoting(A,b)
% LU_withPivoting: Solving system of Linear Equation using LU Decomposition with Pivoting 
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
%x = LU_withPivoting(A,b)
%
[m,n] = size(A);
 P=eye(n);
if m~=n, error('Matrix A must be square'); end
    for i=1:n-1
      %Partial Pivoting
        [~,idx]=max(abs(A(i:end,i)));
        q=idx+i-1;
        if q~=i
            A([i,q],:)=A([q,i],:);
            P([i,q],:)=P([q,i],:);
        end
        % Estimating U
        for j=i+1:n
              if A(i,i)==0,A(i,i)=0.001;warning('Coefficients are going to zero it may result in no solution');end
                fact=A(j,i)/A(i,i);
                A(j,i)=fact;
                A(j,i+1:n)=A(j,i+1:n)-fact*A(i,i+1:n);
        end
    end
% Estimating L
  d=zeros(n,1);b=P*b;
  for i=1:n
      d(i)=b(i)-A(i,1:i-1)*d(1:i-1);
  end    
x = zeros(n,1);
x(n) = d(n,1)/A(n,n);
    for j = n-1:-1:1
        if A(j,j)==0,A(j,j)=0.001;warning('Coefficients are going to zero it may result in no solution');end
        x(j) = (d(j)-A(j,j+1:n)*x(j+1:n))/A(j,j);
    end
end    