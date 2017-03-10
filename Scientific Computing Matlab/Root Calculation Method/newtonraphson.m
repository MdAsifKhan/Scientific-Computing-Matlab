function [f_value,root,rel_err,no_iter]=newtonraphson(funcn,funcn_der,x_guess,maxm_err,max_iter,varargin)
% newtonraphson: Root finding Method With Two Initial Guess
% Open end Method
% [f_value,root,rel_err,no_iter]=newtonraphson(funcn,funcn_der,x_guess,maxm_err,max_iter,p1,p2,...):
% 
% Written by:M.Asif Khan
% Contact   : mak4086@gmail.com

% Input:: 
% funcn    : Function for which roots are to be finded
% x_guess  : Initial Guess
% funcn_der: Derivative of Function for which roots are to be finded
% maxm_err : Maximum Permitted Relative Error (default = 0.0001%)
% max_iter : Maximum No. of Iterations,if not specified by default 100
% p1,p2... : Additional Parameters can be defined and used by the function

% Output::
% root    : root of the Function
% f_value : Value of Function at root
% rel_err : approximate relative error (%)
% iter    : number of iterations

% Sample Test: Remove % and paste the lines on Command Window
% 
%funcn=@(x) tanh(x);
%funcn_der=@(x) sech(x).^2;
%[f_value,root,rel_err,no_iter]=newtonraphson(funcn,funcn_der,5,0.001,20);
%
%
    if nargin<3,error('minimum 3 input arguments'),end
    if nargin<4, maxm_err=0.005;end
    if nargin<5, max_iter=100;end
% Initial Step 
    no_iter = 0;
    if funcn_der(x_guess)==0,error('Bad Initial Guess,function is not convergent'),end
    x_new=x_guess;
    while(1)
        funcn(x_new)
        funcn_der(x_new)
        x_new=x_new-funcn(x_new)/funcn_der(x_new)
        no_iter = no_iter + 1;
        if x_new==0,x_new=0.001;warning('Bad function Newtons Method may diverge try different method');end 
        rel_err=abs(x_new-x_guess)
        x_guess=x_new;
        if((rel_err<=maxm_err) || max_iter<no_iter),break;end
    end
        root=x_new; 
        f_value =funcn(root);
end