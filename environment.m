function [p, r] = environment(s, a, ...
    PA_return, PA_rental, PB_return, PB_rental)

i = s(1)-a;
j = s(2)+a;
[pa, ra] = rental_return(i, PA_rental, PA_return);
[pb, rb] = rental_return(j, PB_rental, PB_return);

p = pa'*pb;
p = p./sum(sum(p));

r = (-2)*abs(a)+ra+rb;

end