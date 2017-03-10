function [root,rel_err,no_iter]=successive_approx(funcn,x_1,maxm_err,max_iter,varargin)
% successive_approx: Root finding Method With One Initial Guess 

% [root,rel_err,no_iter]=successive_approx(funcn,x_1,maxm_err,max_iter,p1,p2,...):
% 
% Written by:M.Asif Khan
% Contact : mak4086@gmail.com

% Input 
% funcn   : Function for which roots are to be finded
% x_1     : Initial Guess
% maxm_err: Maximum Permitted Relative Error (default = 0.0001%)
% max_iter: Maximum No. of Iterations,if not specified by default 100
% p1,p2... : Additional Parameters can be defined and used by the function

% Output:
% root    : root of the Function
% rel_err : approximate relative error (%)
% iter    : number of iterations

% Sample Test: Remove % and paste the lines on Command Window
% 
% funcn=@(x) 2*sin(sqrt(x))-x;
% 
% [f_value,root,rel_err,no_iter]=successive_approx(funcn,0.5,0.00001);
%
%
    if nargin<2,error('minimum 2 input arguments'),end
    if nargin<3, maxm_err=0.005;max_iter=100;end
    if nargin<4, max_iter=100;end
% Initial Step 
    no_iter = 0;
    while(1)
        x_new=funcn(x_1);
        rel_err=abs((x_new-x_1)/x_new);
        if((rel_err<maxm_err) || max_iter<=no_iter),break;end
        x_1=x_new;
        no_iter=no_iter + 1;
    end
        root=x_new; 
end