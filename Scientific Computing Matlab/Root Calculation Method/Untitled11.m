t = [0 20 40 56 68 80 84 96 104 110];
 v = [0 20 20 38 80 80 100 100 125 125];
 tt = linspace(0,110);
 vl = interp1(t,v,tt);
plot(t,v,'o',tt,vl)