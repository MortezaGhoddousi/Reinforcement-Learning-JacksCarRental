function [v] = valueiteration(v, ...
    PA_return, PA_rental, PB_return, PB_rental)

thresh = 1e-4;
Ncars = 20;
gamma = 0.9; % discount factor
nappar = true;
while nappar
    diff = 0;
    for i = 0:Ncars
        for j = 0:Ncars
            value = v(i+1, j+1);
            % actions = -5:5 
            amin = max(-5, -j); 
            amin = max(amin, -(Ncars-i));
            amax = min(5, i);
            amax = min(amax, Ncars-j);
            maxa = [];
            for a = amin:amax
                if ((0 <= (i-a)) && (0 <= (j+a)))
                    [p, r] = environment([i, j], a, ...
                        PA_return, PA_rental, PB_return, PB_rental);
                    expectedreward = r+(gamma*(sum(sum(p.*v))));
                end
                maxa(end+1) = expectedreward; %#ok
            end
            v(i+1, j+1) = max(maxa);

            diff = max(diff, abs(v(i+1, j+1)-value));
        end
    end
    disp(['diffrence is = ', num2str(diff)])
    if diff < thresh
        break
    end
end
end