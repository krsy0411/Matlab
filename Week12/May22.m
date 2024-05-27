clear; clc;

m = 300;
g = 9.81;
p = 2500;
v1 = 0; v2 = 2;
muk = 0.45; % 통나무와 지면 사이의 운동마찰계수


syms theta t
R = muk*m*g*cos(theta); % 마찰력
% 통나무가 2m/s의 속력이 되는데 걸리는 시간을 경사 각도의 함수로 표현한 식 : 적분식
eq1 = int(p - R - m*g*sin(theta), t,0,t) == m*v2; % int 내부 함수 식에 대해 적분(t부터 0까지) : t에 대해서
solve(eq1,t); % t에 대한 값 구하기


theta = 0:0.01:20*pi/180; % theta값(각도) 범위 설정
% 각도 범위에서 solve함수로부터 알아낸 함수에 범위값 대입해서 t값 구하기
t = -600./((26487*cos(theta))/20 + 2943*sin(theta) - 2500);
% 그래프 표현 : 각도를 다시 degree로 변환
plot(theta*180/pi,t), xlabel('incline[degree]'), ylabel('time[second]') 

%%
clear; clc;

ma = 6/1000;
mb = 1;
g = 9.81;
l - 2.2;

syms va1 vb2 theta
eq1 = ma*va1 == (ma+mb)*vb2;

T2 = 0.5*(ma+mb)*vb2^2;
V2 = 0;
T3 = 0;
V3 = (ma+mb)*g*l*(1-cosd(theta));

eq2 = T2 + V2 == T3 + V3;
[va1, vb2] = solve(eq1, eq2, va1, vb2);

theta = 0:0.01:90;