function [p, r] = rental_return(ncar, prental, preturn)
[p, r] = rental(ncar, prental);
p = sreturn(p, preturn);
end