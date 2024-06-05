%% 예제) 강체의 회전운동
clear; clc; close;

% 변수 선언
syms r k Ot On w alpha theta g m
% 식 3개
eq1 = On - m*g*sin(theta) == m*r*w^2;
eq2 = -Ot + m*g*cos(theta) == m*r*alpha;
eq3 = m*g*r*cos(theta) == m*k^2*alpha;

alpha1 = solve(eq3, alpha); % 3번식 : alpha변수에 대해서 식 정리
w1 = sqrt(2*int(alpha1, theta, 0, theta)); % 운동학 식으로부터 적분해서 w값 구하기
On = solve(subs(eq1, w, w1), On);
Ot = solve(subs(eq2, alpha, alpha1), Ot);
O = sqrt(On^2 + Ot^2);

% 함수 그리기
r = 0.25; k = 0.295; m = 7.5; g = 9.81;
theta = 0:0.01:pi;
td = 180*theta/pi;

On = g*m*sin(theta) + (2*g*m*r^2*sin(theta)) / k^2;
Ot = g*m*cos(theta) - (g*m*r^2*cos(theta)) / k^2;
O = sqrt(On.^2 + Ot.^2);

plot(td,O, td,On, td,Ot);
xlabel("theta [degs]"), ylabel("Force at O [N]")

%% 예제 6.12
clear; clc; close;

