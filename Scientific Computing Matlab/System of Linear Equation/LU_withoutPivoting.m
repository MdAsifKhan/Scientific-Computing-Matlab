function x = LU_withoutPivoting(A,b)
% LU_withoutPivoting: Solving system of Linear Equation using LU Decomposition without Pivoting 
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
%x = LU_withoutPivoting(A,b)
%
[m,n] = size(A);
if m~=n, error('Matrix A must be square'); end
% Estimating U
    for i=1:n-1
        for j=i+1:n
              if A(i,i)==0,A(i,i)=0.001;warning('Coefficients are going to zero it may result in no solution');end
                fact=A(j,i)/A(i,i);
                A(j,i+1:n)=A(j,i+1:n)-fact*A(i,i+1:n);
        end
    end
 %Estimating L
 d=zeros(n,1);
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