%% 예제2) 발사체 문제 - 2
clear;clc;
% 아는 변수값 1개
g = 9.81;

% 모르는 변수값 3개
syms th t u
eq1 = -0.5*g*t^2 + u*sin(th)*t - 1500;
% eq1방정식에서 변수t에 세번째인자값을 줍니다 : eq1에서 t를 소거
eq2 = subs(eq1, t, 5000/(u*cos(th))); 
eq3 = solve(eq2, u); % eq2방정식의 u변수에 대해 방정식 풀이 : u=f(th)
eq4 = eq3(2); % eq3의 2번째 방정식을 eq4로 지정 : u가 음수가 되는 식 제거(u=f(th))
eq5 = diff(eq4, th); % theta에 대해 미분 : du/d(th)

th_min = double(solve(eq5, th)); % 4개의 해 중 양수만(1,3번) 의미o
rad2deg(th_min(3)) % rad2deg(th_min(1)) : 143도 -> 의미없는 값
u_min = double(subs(eq3, th_min(3)));

%% 예제3) 야구공 문제
clear; clc;

v0 = 20; % 초기 야구공 속도[m/s]
g = 9.81; % 중력가속도[m/s^2]

theta = 0:0.01:pi/2; % 야구공의 던져지는 각도[rad]

rho_i = v0^2/g./cos(theta); % 던져진 순간에서의 곡률반경[m]
rho_f = (v0*cos(theta)).^2/g; % 최고 높이에서의 곡률반경[m]

plot(rad2deg(theta), rho_i, '--r',rad2deg(theta),rho_f,'k')
xlabel('theta(deg)'), ylabel('radius of curvature(m)'), title('야구공 문제')
axis([0 90 0 400]) % 축 범위 설정

%% 예제4) 극좌표계 문제
clear; clc;

t = 0:0.01:5;
r = 0.2 + 0.04*t.^2;
rd = 0.08*t;
rdd = 0.08;

theta = 0.2*t + 0.02*t.^3;
thetad = 0.2 + 0.06*t.^2;
thetadd = 0.12*t;

vr = rd;
vtheta = r.*theta;
v = sqrt(vr.^2 + vtheta.^2);

