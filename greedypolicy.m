function [pi] = greedypolicy(v, ...
    PA_return, PA_rental, PB_return, PB_rental)

Ncars = 20;
pi = zeros(Ncars);
gamma = 0.9;
for i = 0:Ncars
    for j = 0:Ncars
        value = v(i+1, j+1);
        amin = max(-5, -j); 
        amin = max(amin, -(Ncars-i));
        amax = min(5, i);
        amax = min(amax, Ncars-j);
        maxa = 0;
        for a = amin:amax
            [p, r] = environment([i, j], a, ...
                        PA_return, PA_rental, PB_return, PB_rental);
            expectedreward = r+(gamma*(sum(sum(p.*v))));
            if ((a == -5) || (expectedreward > maxa))
                pi(i+1, j+1) = a;
                maxa = expectedreward;
            end
        end
    end
end
end