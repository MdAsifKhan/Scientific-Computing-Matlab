function [root,rel_err,no_iter]=secantm(funcn,x_1,x_2,maxm_err,max_iter,varargin)
% secantm: Root finding Method With Two Initial Guess 
% Open end Method
% [root,rel_err,no_iter]=secantm(funcn,x_1,x_2,maxm_err,max_iter,p1,p2,...):
% 
% Written by:M.Asif Khan
% Contact : mak4086@gmail.com

% Input 
% funcn   : Function for which roots are to be finded
% x_1 : Initial Guess
% x_2 : Initial Guess
% maxm_err: Maximum Permitted Relative Error (default = 0.0001%)
% max_iter: Maximum No. of Iterations,if not specified by default 100
% p1,p2... : Additional Parameters can be defined and used by the function

% Output:
% root    : root of the Function
% rel_err : approximate relative error (%)
% iter    : number of iterations

% Sample Test: Remove % and paste the lines on Command Window
% 
% x_1=1;
% x_2=1000;
% [root,rel_err,no_iter]=secantm(funcn,x_1,x_2)
%
%
    if nargin<3,error('minimum 3 input arguments'),end
    if nargin<4, maxm_err=0.005;max_iter=100;end
    if nargin<5, max_iter=100;end
% Initial Step 
    no_iter = 0;
    while(1)
        x_1;
        t1=funcn(x_1);
        x_2
        t2=funcn(x_2)
        if t1==t2,error('Choose Different Interval Result is non convergent');end
        x_3=(x_1*t2-x_2*t1)/(t2-t1)
        funcn(x_3)
        no_iter=no_iter + 1;
        rel_err=abs((x_3-x_2))
        if((rel_err<maxm_err) || max_iter<no_iter),break;end
        x_1=x_2;
        x_2=x_3; 
       
    end
        root=x_3; 
end