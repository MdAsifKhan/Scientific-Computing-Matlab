function yy=cubicspline(x,y,xx)

ch=input('Choice of Look Up Bin 1. Sequential 2. Binary');

n=length(x);
a_i=y;
h_i=x(1,3:n)-x(1,2:n-1);
h_i_1=x(1,2:n-1)-x(1,1:n-2);
i=2:n-1;
r_i=3*((y(1,i+1)-y(1,i))./h_i-(y(1,i)-y(1,i-1))./h_i_1);
switch ch
    case 1, 
        k=Lookupbin_seq(x,xx);
    case 2,
         k=Lookupbin_binary(x,xx);
    otherwise
        disp('Unknown Method');
end        
e_i=[0 h(1:n-2) 0];
g_i=[0 h(2:n-1) 0];
r=[0 r_i 0]; 
addpath('F:\MAK\Study\COP\System of Linear Equation');
c_i=Tridiagonalmethod(e_i,y,g_i,r);
d_i=(c_i(1,2:n)-c_i(1,1:n-1))./h_i;

yy= a_i(k) + b_i(k)*(xx-x(k))+c_i(k)*(xx-x(k))^2+d_i(k)*(xx-x(k))^3;
end
