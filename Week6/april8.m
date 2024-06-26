%% 고계 ODE 풀이(1계 연립 ODE 풀이)
clear; clc;

% 고계 ode는 1계 연립 ode형식으로 바꿔서 풀어야합니다
% 1계 ode와 마찬가지로, "[t,y] = solver_name(odefunction, tspan, y0)" 명령어 사용
% 단, ode함수를 정의할때, 두 개의 1계 도함수를 열벡터로 지정해야함
[t,y] = ode45(@twoeq, [-1,1], [0,0]);
y1 = y(:,1);
plot(t,y1)

%% 질점의 운동학
clear; clc;

% 질점은 병진운동만 가능(회전운동은 X)
% 병진운동은 직선운동(스칼라 표현)과 곡선운동(벡터 표현)으로 나뉨.

%% 직선운동 : 시간의 함수로 주어질때
clear; clc;

% 물체의 위치,속도,가속도 중 하나가 함수로 주어지면, 나머지 두 정보를 미분이나 적분을 통해 구할 수 있음

%% 직선운동 : 등속도/등가속도 운동
clear; clc;

% 등속도 운동 : 모든 시간에 대해 질점의 가속도가 0
% 등가속도 운동 : 모든 시간에 대해 질점의 가속도가 일정

%% 예제1) 직선운동
clear; clc;

k = 1; % k는 비례상수
t0 = 0;
t1 = 10/60; % 분
v0 = 8;

% 속도와 시간이 주어짐 -> 미분방정식을 통해 순간 속력에 대해 구하기
% 가속도 함수에 대해서 t0-t1 시간의 정의역에서 초기값v0에 대해 계산한 t,v 구하기
[t, v] = ode45(@(t,v)-k*v^2, [t0, t1], v0);
% 이동한 거리 -> 적분을 통해 속도로부터 거리를 계산
s = trapz(t,v);

% 결과 출력
fprintf('10분 후 항해 속력: %.2f 노트\n', v(end)); % v(end)는 마지막값
fprintf('10분 동안 화물선이 이동한 거리: %.2f 해리\n', s); 

% 그래프 그리기
subplot(2,1,1);
plot(t, v);
xlabel('시간 (분)');
ylabel('속력 (노트)');
title('시간에 따른 화물선의 속력');

subplot(2,1,2);
plot(t, cumtrapz(t, v)); % 누적 이동거리 계산
xlabel('시간 (분)');
ylabel('이동거리 (해리)');
title('시간에 따른 화물선의 이동거리');

%% 예제1) 직선운동 : Symbolic math 사용
clear; clc;

syms k v t
% v변수에 대해 8~v까지의 범위를 적분
int(-1/(k*v^2), v, 8, v)
% 첫번째 인자(함수)에서 v변수에 대해서 해 구하기
solve(t == (1/v - 1/8)/k, v)

% 기호 수학(Symbolic math)에서 t와 v에 대해서 10과 4를 넣어서 계산 -> k는 아직 모름
ans1 = subs(v == 1/(k*t + 1/8), [t v], [1/6 4]);
% 첫번째 인자(함수)에서 k변수에 대해서 해 구하기
disp(solve(ans1, k))

%% 예제2) 발사체 문제(직교 좌표)
clear; clc;

u = 400;
g = 9.81;

syms th t

fn1 = u*cos(th)*t == 5000;
fn2 = (-0.5)*g*(t^2) + u*sin(th)*t == 1500;
% th와 t에 대한 결과값을 변수에 각각 할당
[th, t] = solve(fn1, fn2, th, t);
% 값 변환 : sym -> double
th_db = double(th);
t_db = double(t);

% radian값을 deg값으로 변환
th1 = rad2deg(th_db(1));
th2 = rad2deg(th_db(2));

t1f = t_db(1);
t2f = t_db(2);

% 그래프 그리기
t1 = 0:0.01:t1f; % 시간
x1 = u*cosd(th1)*t1; % 시간에 대한 x축 값
y1 = -0.5*g*t1.^2 + u*sind(th1)*t1; % 시간에 대한 y축 값
plot(x1,y1), xlabel('x축'), ylabel('y축'), title('발사체 문제')




