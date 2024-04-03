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

% diff 함수를 이용해 수치미분이 가능하며, 수치미분과 기호미분에 똑같이 diff함수가 사용됨
% 시간에 대한 y의 미분은 "미소 시간의 변화량에 따른 y의 변화량"을 의미
% diff함수는 "배열에서 연속하는 두 원소 값의 변화량(차이)"를 알려줌

%% 수치 미분을 위한 내장함수(diff/gradient)
clear; clc;
% 전방 차분법 : 현재 데이터의 도함수를 그 다음 데이터를 이용해서 근사적으로 구했기 때문
% 전방 차분법은 마지막 데이터의 위치에서는 도함수를 구할 수 없음
% gradient함수는 첫번째 원소값에 대해선 전방차분법을, 마지막 값에 대해선 후방차분법을, 나머지 값에 대해서는 중앙차분법을
% 사용해서 도함수를 근사적으로 계산

x = linspace(0,pi/2,10);
y = sin(x);
dydx_approx2 = gradient(y, x(2)-x(1));
disp(dydx_approx2)

%% 실습3) 수치 미분 : sin(x)의 도함수 비교
clear; clc;

% 해석적 해
x = 0:0.01:pi/2;
y = cos(x);

% diff함수를 이용한 도함수
x1 = linspace(0,pi/2,10);
y1 = sin(x1);

f = diff(y1)./diff(x1);

% gradient함수를 이용한 도함수
g = gradient(y1, x1(2)-x1(1));

% 해석적 해 vs 수치적 해 그래프 비교
plot(x,y,x1(1:end-1), f,'--r',x1,g,'*k')

%% 실습4) 수치 미분
clear; clc;

x = -5:5; % x 범위
y = x.^3 + 2.*x.^2 - x + 3; % 함수

% a) diff함수 : 전방차분법
dy_dx_diff = diff(y)./diff(x);

% b) gradient함수 :  전방차분법, 중앙차분법, 후방차분법
dy_dx_gradient = gradient(y, x(2)-x(1));

% c) 전방 차분법 알고리즘 -> diff와 같은 결과
for i=1:length(x)-1
    dy_dx(i) = (y(y+1) - y(i))/(x(i+1) - x(i));
end

%% 매트랩에서 미분방정식 풀이하는 법
% 1. 내장함수 사용 : ode23 function(2차,3차), ode45 function(4차,5차) : 룽게쿠타 방법
% 2. Symbolic 미분 : dsolve함수
% 3. 미분 알고리즘 이용해서 직접 코드 작성
clear; clc;

%% ode23, ode45 functions
clear; clc;

% matlab solver함수 사용 : ODE solver제공됨
% 일반적으로 ode45 < ode23 속도이지만, ode45가 더 높은 정확성을 제공
% ode45 function은 미분방정식을 풀때, 첫 시도로 적합

%% ODE solver 사용법1
clear; clc;
% t에 대한 y의 도함수 식, 독립변수의 정의역, y의 초기값 등이 필요
% 1. 문제를 표준 형태로 작성
% 2. 해석할 함수를  사용자 정의 함수나 익명함수로 생성
% 3. ODE solver를 하나 선택해서 명령어 실행

%% 실습5) 1계 ODE 풀이
clear; clc;

[t,y] = ode45(@(t,y)t^3-2*y/t, 1:0.01:3, 4.2);
plot(t,y), xlabel('t'), ylabel('y')

%% 예제2) 1계 미분방정식
clear; clc;

% a문제
ta = 0:0.1:4;
ya = ta+cos(ta); % 해석해
[t1, y1] = ode45(@(y,t)1-sin(t), ta, 1); % 수치해

% a문제 그래프 비교
figure(1)
plot(t1,y1,'O',ta,ya)
title('수치해 vs 해석해')
xlabel('time'), ylabel('y-value'), legend('수치해', '해석해')

% b문제
[t2, y2] = ode45(@(y,t)t^2+y, 0:0.1:1, 0); % 수치해
tb = 0:0.1:1;
yb = 2.*exp(tb) - 2.*tb - tb.^2 - 2;

% 수치해 vs 해석해 그래프 그리기
figure(2)
plot(t2, y2, '*', tb,yb)
title("수치해 vs 해석해")
xlabel("time"), ylabel("y-value"), legend("수치해", "해석해")









