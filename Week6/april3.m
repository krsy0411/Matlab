%% 수치해석
% matlab에서 방정식의 해를 구하는 법
% 1. matlab 내장함수
% roots, fzero, fsolve
% 2. symbolic math
% solve
% 3. 알고리즘 이용한 직접 코딩

%% 일변수 방정식의 해 구하기 : roots/fzero
clear; clc;

% roots : 다항식만 가능
% fzero : 모든 일변수 방정식이 가능하나, 하나의 해만 찾아줌

%% 실습1) roots 함수
clear; clc;

p = [1 -12.1 40.59 -17.015 -71.95 35.88];
r = roots(p);
disp(r)

%% 실습2) fzero 함수
clear; clc;

x1 = fzero("x^2+7*x+10", -1);
x2 = fzero("x^2+7*x+10", -4);
disp(x1)
disp(x2)

%% 실습3) fzero
clear; clc;
Y = @(x)2*x+exp(-x)-2;

x1 = fzero(Y, 0.5);
x2 = fzero(Y, 1.5);
x3 = fzero("2*x+exp(-x)-2", 0.5);
x4 = fzero("2*x+exp(-x)-2", 1.5);
fprintf("%g %g %g %g\n", x1,x2,x3,x4)

%% 예제1) fzero
clear; clc;

% Q1
y1 = @(x)2*exp(x)-x^3+3*x^2-3*x-3;
y2 = @(x)x-10^x+2;
y3 = @(x)x^3+3;

a1 = fzero(y1, -0.3810);
a2 = fzero(y1, 0.6853);
fprintf("%g %g\n", a1,a2)

a3 = fzero(y2, 0.3758);
a4 = fzero(y2, -1.9898);
fprintf("%g %g\n", a3,a4)

a5 = fzero(y3, -1.4422);
fprintf("%g\n", a5)

%% 비선형 연립 방정식 해 구하기 : fsolve : 다중 변수로 구성된 비선형 연립방정식
clear; clc;
x = fsolve(@fs1, [-5;-5]);
disp(x)

%% matlab에서 수치적분 하는 법
% 1. 내장함수 : trapz, quad, integral
% 2. symbolic 적분
% 3. 적분 알고리즘을 이용해서 직접 코드 작성

%% 실습1) trapz함수를 이용한 sin함수 적분
clear; clc;

x = 0:pi/100:pi;
y = sin(x);
T = trapz(x,y);
fprintf("%g\n", T)

%% 실습2) quad/integral 함수를 이용한 sin함수 적분
clear; clc;

Q = integral("sin(x)",0,pi); % 0~pi까지의 x범위에서 sin(x) 적분
fprintf("%g\n",Q)

%% 예제1) trapz/quad/integral 함수의 수치적분
clear;clc;

sol1 = integral(@(x)x.*exp(-x.^0.8) + 0.2, 0, 8);
sol2 = integral(@(x)sin(x)./(1+sin(x)),0, pi);
sol3 = integral(@(x)exp(-(x.^2)),-inf, inf);
fprintf("sol1: %g, sol2: %g, sol3: %g\n", sol1,sol2,sol3)

%% matlab에서 수치미분 하는 법
% 1. 내장함수 사용 : diff, gradient : 수치적 미분 값
% 2. symbolic 미분 : diff : 해석적 해
% 3. 미분 알고리즘을 이용한 코드 작성














