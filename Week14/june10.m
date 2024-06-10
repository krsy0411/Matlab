%% 예제) 강체의 평면운동
clear; clc; close;

syms m g L theta alpha a % 변수 선언

eq1 = m*g*L/2*sin(theta) == 1/12*m*L^2*alpha + m*L/2*alpha*L/2 - m*a*L/2*cos(theta);
alpha = solve(eq1, alpha); % 알파에 대해서 식 정리
w = sqrt(2*int(alpha, theta, 0, theta)); % 각속도 구하기

% plot : 그래프 그리기
% 기본 변수들에 대해서 값 할당
L = 3.6; g = 9.81; a = 0.9; 
theta = 0:0.01:pi/2;

w = 3^(1/2)*((a*sin(theta))/L - (g*(cos(theta)-1)/L)).^(1/2); % 위에서 정리해서 얻어낸 W식을 그냥 풀어서 다시 대입
% 호도법->rad으로 바꿔서 x축 표현, 각도에 따른 w(각속도)값 그래프 그리기
plot(theta*180/pi,w), xlabel("theta [deg]"), ylabel("w [rad/s]")