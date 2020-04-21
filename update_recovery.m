function [new_population] = update_recovery(population, recovery_rate, death_rate)
    ill = find(population(:,5) == 1);
    [k,~] = size(ill);
    for i = 1:k
        if (rand <= death_rate)
            population(ill(i), 5) = 3;
        elseif (rand <= recovery_rate)
            population(ill(i), 5) = 2;
        end
    end
    new_population = population;
end

