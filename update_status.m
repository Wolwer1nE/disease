function [new_population] = update_status(population, transmission_rate, transmission_radius)
    ill = find(population(:,5) == 1);
    [k,~] = size(ill);
    in_danger = find(population(:,5) == 0); 
    [m,~] = size(in_danger);
    for i = 1:k
        p = population(ill(i), :);
        for j = 1:m
            a = population(in_danger(j), :);
            if (norm(p(1:2)-a(1:2)) < transmission_radius && rand <= transmission_rate)
                a(5) = 1;
                population(in_danger(j), :) = a;
            end
        end
    end
    new_population = population;
end

