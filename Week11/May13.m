clear; clc;

syms x vc mu
eq_cable = (250*(1.2-x)) / (sqrt((1.2-x)^2 + 0.9^2));
% 방정식에서 x변수에 대해, 0~1.2구간에서 적분
result_cable = int(eq_cable, x,[0,1.2]);
% disp(result_cable);

eq = 10*9.81*(-1.2*sind(30)) + (1/2)*60*(mu^2 - (1.2 + mu)^2) + 150 == 1/2*10*(vc^2);
vc = solve(eq, vc);
disp(vc);

% plot
plot_eq = (3^(1/2)*10^(1/2)*(799 - 1200*mu)^(1/2))/50;
fplot(plot_eq, [-0.4, 0.8]);