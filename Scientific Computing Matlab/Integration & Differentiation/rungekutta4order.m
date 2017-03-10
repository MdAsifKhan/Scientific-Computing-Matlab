function [tp,yp] = rungekutta4order(derivative,x1,xf,y1,h,varargin)
% rk4sys: fourth-order Runge-Kutta for a system of ODEs
% [t,y] = rk4sys(dydt,tspan,y0,h,p1,p2,...): integrates
% a system of ODEs with fourth-order RK method
% input:
% dydt = name of the M-file that evaluates the ODEs
% tspan = [ti, tf]; initial and final times with output
% generated at interval of h, or
% = [t0 t1 ... tf]; specific times where solution output
% y0 = initial values of dependent variables
% h = step size
% p1,p2,... = additional parameters used by dydt
% output:
% tp = vector of independent variable
% yp = vector of solution for dependent variables
if nargin<4,error('at least 4 input arguments required'), end
if any(diff(tspan)<=0),error('tspan not ascending order'), end
n = length(tspan);
if n == 2
t = (x1:h:xf)'; n = length(t);
if t(n)<xf
t(n+1) = xf;
n = n+1;
end
else
t = tspan;
end
tt = x1; y(1,:) = y1;
np = 1; tp(np) = tt; yp(np,:) = y(1,:);
i=1;
while(1)
tend = t(np+1);
hh = t(np+1) - t(np);
if hh>h,hh = h;end
while(1)
if tt+hh>tend,hh = tend-tt;end
k1 = derivative(tt,y(i,:),varargin{:})';
ymid = y(i,:) + k1.*hh./2;
k2 = derivative(tt+hh/2,ymid,varargin{:})';
ymid = y(i,:) + k2*hh/2;
k3 = derivative(tt+hh/2,ymid,varargin{:})';
yend = y(i,:) + k3*hh;
k4 = derivative(tt+hh,yend,varargin{:})';
phi = (k1+2*(k2+k3)+k4)/6;
y(i+1,:) = y(i,:) + phi*hh;
tt = tt+hh;
i=i+1;
if tt>=tend,break,end
end
np = np+1; tp(np) = tt; yp(np,:) = y(i,:);
if tt>=xf,break,end
end

