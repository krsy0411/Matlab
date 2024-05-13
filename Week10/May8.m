clear; clc;

ma = 125; mb = 200; g = 9.81;

syms aA aB T R mu

eq1 = ma*g - T == ma*aA;
eq2 = 2*T - R - mb*g*sind(30) == mb*aB;
eq3 = R == mu*mb*g*cosd(30);
eq4 = aA == 2*aB;

% 마찰계수 mu에 대해서 나머지 변수들을 정리
[aA, aB, T, R] = solve(eq1, eq2, eq3, eq4, aA, aB, T, R);

syms x
% int : 적분 : aA라는 식을 x에 대해 0~6까지 적분
vA = sqrt(2*int(aA,x,0,6));

subplot(2,1,2), fplot(mu,aA), axis([0 1 -1 5]), xlabel("mu(k)"), ylabel("a [m/s^2]")
subplot(2,1,1), fplot(mu, vA), axis([0 1 0 8]), xlabel("mu(k)"), ylabel("v [m/s^2]")