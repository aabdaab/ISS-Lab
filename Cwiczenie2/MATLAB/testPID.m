function testPID(start, step, stop)
load_system('model.mdl');
hold on;
td = start;
i = 0;
color = char('r', 'k', 'b', 'g', 'y', 'm');
set_param('model/Gain', 'Gain', num2str(2));
set_param('model/Gain1', 'Gain', num2str(0.1));
while (td <= stop)
    set_param('model/Gain2', 'Gain', num2str(td));
    sim('model.mdl');
    wy = simout.signals.values;
    figure(1);
    plot(tout, wy, 'Color', color(mod(i,6)+1));
    i = i + 1;
    q(i) = sum(wy.^2)/length(wy);
    tede(i) = td;
    td = td + step;
end
figure(2);
plot(tede, q);
end