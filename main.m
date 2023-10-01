clc; clear; close all;

Ncars = 20;
lA_request = 3; 
lB_request = 4;
lA_return = 3;
lB_return = 2;

for i = 0:Ncars
    PA_return(i+1) = poisspdf(i, lA_return); %#ok
    PA_rental(i+1) = poisspdf(i, lA_request); %#ok
    PB_return(i+1) = poisspdf(i, lB_return); %#ok
    PB_rental(i+1) = poisspdf(i, lB_request); %#ok
end

v = zeros(Ncars+1);
v = valueiteration(v, PA_return, PA_rental, PB_return, PB_rental);

figure
heatmap(v)
title('heatmap of state value function')

pi = greedypolicy(v, PA_return, PA_rental, PB_return, PB_rental);

figure
heatmap(flip(pi))
title('heatmap of greedy solution')


