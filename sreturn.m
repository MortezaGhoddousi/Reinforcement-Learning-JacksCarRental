function [pp] = sreturn(pcar, p)
Ncars = 20;
pp = [];
for j = 0:Ncars
    pp(end+1) = sum(pcar(1:j+1).*flip(p(1:j+1))); %#ok
end
end