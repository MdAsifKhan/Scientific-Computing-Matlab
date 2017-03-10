function yy=linearspline(x,y,xx)
% linear interpolation
ch=input('Choice of Look Up Bin 1. Sequential 2. Binary');

switch ch
    case 1, 
        k=Lookupbin_seq(x,xx);
    case 2,
         k = Lookupbin_binary(x,xx);
    otherwise
        disp('Unknown Method');
end        
    
yy = y(k) + (y(k+1)-y(k))/(x(k+1)-x(k))*(xx-x(k));
end
