%% 기호 연산
clear; clc;

% 여기서부터는 앞까지의 "수치연산", 즉, 수와 값이 미리 할당된 변수를 가지고 진행했던 것과는 달리
% "기호 연산", 연산이 수행될때 특정 수치 값을 갖지 않는 변수들을 이용하는 수학적 연산을 할 예정
% 기호 연산을 사용하기 위해선, 기호 도구상자(toolbox)를 설치해야함

% 기호 연산을 위해선, 기호 변수를 먼저 생성해야함 : 기호변수는 "값이 할당되지 않은 변수"
syms x y % 기호 x,y 생성
result1 = 5*x - 2*x;
result2 = (3*x + 2*y) - (x+y);

disp(result1)
disp(result2)

%% 기호 행렬 생성
clear; clc;

% ex1
syms a b c
A = [a b c; b c a; c a b];
disp(A)
% ex2
syms x
B = [cos(x), sin(x); -sin(x), cos(x)];
disp(B)

%% 기호행렬 연산
clear; clc;

syms x
A = [sin(x)^2, sin(x); cos(x)^2, cos(x)];
B = [cos(x)^2, cos(x); sin(x)^2, sin(x)];
result1 = A+B;
disp(result1) % 결과 출력
disp(simplify(result1)) % 정리한 결과값 출력
result2 = A-B;
disp(result2) % 결과 출력
disp(simplify(result2)) % 정리한 결과값 출력

%% 기호행렬의 곱과 역행렬
clear; clc;






