function k=Lookupbin_seq(x,xx)
%Look Up Bin: Figure out the bin using sequential search
n = length(x);
if xx < x(1) || xx > x(n),error('Interpolation outside range');end % sequential search
k = 1;
while(1)
    if xx <x(k + 1), break, end
    k = k + 1;
end
end