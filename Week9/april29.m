%% 예제1) 경사면 위의 물체
clear; clc;

% 기호연산
syms P N
% 주어진 값 설정
m = 30;
s = 4;
t = 2;
uk = 0.2;
g = 9.81;
a = 2;

% 수식 설정
eq1 = P*cosd(30) - 0.2*N - m*g*sind(30) == m*2;
eq2 = P*sind(30) + N - m*g*cosd(30) == 0;
% 연립방정식 계산
[N, P] = solve(eq1, eq2);
N = double(N); P = double(P); % 형 변환

fprintf("N : %g\tP : %g\n", N,P)

%% 예제2) 운동역학 문제
clear; clc;

