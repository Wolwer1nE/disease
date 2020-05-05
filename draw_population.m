function [frame] = draw_population(population)
    cla;
    [n,~] = size(population);
    for i = 1:n
        p = population(i,:);
        color = get_color(p(5));
        plot(p(1), p(2), 'o', 'color', color, 'markerfacecolor', color);
        hold on
    end
    axis([-10, 1010, -10, 1010]);
    pause(1/100);
    frame = getframe(gcf);
end

