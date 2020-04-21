function [new_population] = update_positions(population)
    speed = 1;
    alive = find((population(:,5) ~= 3) & (population(:,6) == 0));
    [n, ~] = size(alive);
    for i = 1:n
        p = population(alive(i),:); 
        if (p(1) == p(3) && p(2) == p(4))
            p(3) = randi([0, 1000]);
            p(4) = randi([0, 1000]);
        end
        p(1) = p(1) + speed*sign(p(3) - p(1));
        p(2) = p(2) + speed*sign(p(4) - p(2));
        population(alive(i),:) = p;
    end
    new_population = population;
end

