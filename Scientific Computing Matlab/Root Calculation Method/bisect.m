function [f_value,root,rel_err,no_iter]=bisect(funcn,x_lower,x_upper,maxm_err,max_iter,varargin)
% bisect: Root finding Method With Two Initial Guess
%  Bracket Method
% [f_value,root,rel_err,no_iter]=bisect(funcn,x_lower,x_upper,maxm_err,max_iter,p1,p2,...):

% Written by:M.Asif Khan
% Contact   : mak4086@gmail.com

% Input:: 
% funcn   : Function for which roots are to be finded
% x_lower : Initial Lower Guess
% x_upper : Initial Upper Guess
% maxm_err: Maximum Permitted Relative Error (default = 0.0001%)
% max_iter: Maximum No. of Iterations,if not specified by default 100
% p1,p2... : Additional Parameters can be defined and used by the function

% Output::
% f_value : Value of Function at root
% root    : root of the Function
% rel_err : approximate relative error (%)
% iter    : number of iterations

% Sample Test: Remove % and paste the lines on Command Window
% 
%funcn=@(x) tanh(x+0.10);
%
%[f_value,root,rel_err,no_iter]=bisect(funcn,1,5,0.0001,20)
%
%
    if nargin<3,error('minimum 3 input arguments'),end
    if nargin<4, maxm_err=0.005;end
    if nargin<5, max_iter=100;end
    if funcn(x_lower)*funcn(x_upper)>0,error('no sign change'),end
% Initial Step 
    no_iter = 0;
    while(1)
        x_lower
        x_upper
        x_new =(x_lower + x_upper)/2
        rel_err=abs((x_new-x_upper)/x_new)
        if((rel_err<maxm_err) || max_iter==no_iter),break;end
        no_iter = no_iter + 1
        funcn(x_new)
        test = funcn(x_lower)*funcn(x_new)
        if test<0
            x_upper = x_new;
        elseif test>0
            x_lower = x_new;
        else
            rel_err = 0;
        end
    end
        root=x_new; 
        f_value =funcn(root);
end