function [x_n,y] = euler(derivative,x1,y1,xf,h,varargin)
% euler: Euler Method to solve ODE
% input:
% derivative : Derivative function that evaluates ODE
% y0         : Initial value of dependent variable
% h          : step size
% output:
% x_n        : vector of independent variable
% y          : vector of solution for dependent variable
%
%
if nargin<4,error('at least 4 input arguments required'),end
if xf<x1,error('upper limit must be greater than lower'),end
n= floor((xf-x1)/h)+1;
x_n=linspace(x1,xf,n);
if x_n(n)<xf,x_n(n+1)=xf;n=n+1;end % if last datapoint is less than upper limit append x_f
y = y1*ones(n,1); %preallocation
for i = 1:n-1 %Euler's method
    y(i+1) = y(i) + (x_n(i+1)-x_n(i))*derivative(x_n(i),y(i));
end