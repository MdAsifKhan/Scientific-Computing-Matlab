function k = Lookupbin_binary(x,xx)
%Look Up Bin: Figure out the bin using Binary search

n = length(x);
if xx < x(1) || xx > x(n),error('Interpolation outside range');end
% binary search
k_lower = 1; k_upper = n;
while (1)
    if k_upper - k_lower <= 1, break, end
    k_medium = fix((k_lower + k_upper) / 2);
    if x(k_medium) < xx
        k_lower = k_medium;
    else
        k_upper = k_medium;
    end
end
k=k_lower;
end