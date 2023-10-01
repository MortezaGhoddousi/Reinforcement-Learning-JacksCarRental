function [pp, r] = rental(ncar, p)
Ncars = 20;
pp = [];
r = 0;
c = ncar;

for i = 0:Ncars
    if c >= 0
        pp(end+1) = p(c+1); %#ok
    else
        pp(end+1) = 0; %#ok
    end
    c = c-1;
    if i < ncar+1
        r = r+(i*p(i+1));
    else
        r = r+(ncar*p(i+1));
    end
end
r = r*10; % rental credit
end