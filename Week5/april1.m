% 수치해석

% 이전까지는 해석적 방법을 통해, 문제의 정확한 해를 구했지만
% 이젠부터는 논리연산을 반복적으로 수행해서 근사한 해를 구하는 "수치적 방법"을 사용한다

% 수치해석에선 보통
% 1. 방정식의 해를 구하기 : 일변수 방정식, 선형 연립방정식, 비선형 연립방정식
% 2. 미분
% 3. 적분
% 4. 미분방정식(Differential equation) : 상미분 방정식(Ordinary differential
% equation), 편미분 방정식(Partial differential equation)
%% 방정식의 해 구하기
clear; clc;

% 일변수 방정식 & 연립방정식(선형 및 비선형)의 해를 solve 명령어를 사용해서 구하기 가능
% 구한 해의 데이터 타입은 symbolic -> 숫자 타입으로 바꿔주기 위해선 "double명령어" 사용해야함

%% 실습1) 일변수 방정식 풀이
clear; clc;

syms a b c x
% 예제1
eq1 = a*x^2 + b*x + c == 0;
S1 = solve(eq1, x);

% 예제2 : x-cos(x) == 0의 해 구하기
syms e
eq2 = e - cos(e) == 0;
S2 = solve(eq2);

disp(S1)
disp(S2)

%% 실습1) 일변수 방정식 풀이 2
clear; clc;
% y=10*(1-e^(-x/4))에 대해 y(xt)가 9.8을 만족하는 xt 구하기
syms x
eq3 = 10*(1-exp(-x/4)) == 9.8;
S3 = solve(eq3,x);
disp(double(S3))

%% 실습2) 선형 연립 방정식 풀이
clear; clc;

syms x y z
eq1 = 3*x + 2*y - z == 10;
eq2 = -x + 3*y + 2*z == 5;
eq3 = x - y - z == -1;

[x,y,z] = solve(eq1, eq2, eq3);
fprintf("x값: %d\n", double(x))
fprintf("y값: %d\n", double(y))
fprintf("z값: %d\n", double(z))
% 혹은 이렇게 대괄호를 통해서 여러 수식을 하나의 변수에 넣을 수 있음
% eqns = [eq1, eq2, eq3];
% [x,y,z] = solve(eqns, [x,y,z]);

%% 실습3) 비선형 연립 방정식 풀이
clear; clc;

syms x y
eq1 = 2*x^2 + y == 1;
eq2 = x + y == 2;
% eqns = [eq1, eq2];
% [x,y] = solve(eqns, [x,y]);
[x,y] = solve(eq1, eq2);
fprintf("x값: %d\ty값: %d\n", double(x), double(y))

%% 미분 : 기호미분은, diff명령어를 사용해서 수행 가능
clear; clc;
% 실습4) 미분

syms x y t
s = exp(x^4);
diff(s) % 식을 x에 대해서 미분

diff((1-4*x)^3)
R = 5*y^2*cos(3*t);
diff(R,t) % t에 대해서 식을 미분
diff(R,t,2) % t에 대해서 식을 2번 미분

%% 적분 : 기호적분은, int명령어를 사용해서 수행 가능
% 정적분과 부정적분을 계산 가능
clear; clc;

% 실습5) 적분1
syms x y t a
s = 2*cos(x) - 6*x;
int(s) % 식을 x에 대해 적분
int(x*sin(x))

R = 5*y^2*cos(4*t);
int(R,t) % 식을 t에 대해서 적분

%% 실습5) 적분2
clear; clc;

int(1/sqrt(x-1), 1, 4) % 식을 x에 대해서 1부터 4까지 적분
int(exp(-x^2), 0, inf)

S = 1/sqrt(a^2 - x^2);
int(S,0,a) % 식을 x에 대해서 0부터 a까지 적분

%% 미분 방정식 용어
% 상미분 방정식 : 독립변수가 하나인 미분 방정식
% 편미분 방정식 : 두 개 이상의 독립변수와 이들의 편미분 도함수가 있는 포함된 방정식
% 계 : 미분 방정식의 도함수 중 가장 많이 미분된 숫자
% 차수 : 미분 방정식에서 가장 높은 계의 도함수의 차수

%% 상미분 방정식 풀이 : dsolve
clear; clc;

% 공학 문제에서 시간에 따라 변하는 물리적 현상들 -> 미분 방정식으로 표현
% 기호수학에서 dsolve명령어를 사용해 상미분 방정식을 풀기 가능

% 실습6) 일계 미분 방정식 풀이1
syms y(t) % y가 시간에 대해 미분된 함수. y(t)로 정의하면 t를 따로 정의하지 않아도 됨
dsolve(diff(y,t) == y)
dsolve(diff(y,t) == sin(t))

%% 실습6) 일계 미분 방정식 풀이2
clear; clc;

syms y(t)
dsolve(t*diff(y,t) - 4*y == t^6*exp(t))
%% 초기값 문제 : dsolve(수식, 초기조건)
% 미분 방정식의 일반해는 C(임의 상수)를 포함해서 무한 개의 해를 가짐
% 초기 조건이 있다면, 상수 C값이 결정됨

% 실습7) 초기값 문제1
syms y(t)
equation = diff(y,t)-y == sin(t);
condition = y(0) == 10;
result = dsolve(equation, condition);
expand(result) % 표현식을 전개해서 단순하게끔 정리

%% 실습7) 초기값 문제2
clear; clc;

syms y(t) a
equation1 = diff(y,t) == a*y;
condition = y(0) == 5;
y_solution = dsolve(equation1, condition);
disp(y_solution)

%% n계 미분 방정식 : dsolve(수식) || dsolve(수식, 초기조건)
clear; clc;

% 실습8) n계 미분 방정식1
syms y(t)
eq2 = diff(y,t,2)+16*y == 0;
dsolve(eq2)
%% n계 미분 방정식 : dsolve(수식) || dsolve(수식, 초기조건)
clear; clc;

% 실습8) n계 미분 방정식2
syms y(t)
eq3 = diff(y,t,3)+diff(y,t) == 2*sin(t);
Dy = diff(y,t);
D2y = diff(y,t,2);
% 여러 초기조건을 줄때는, 배열로 넣어서 사용
condition2 = [y(0)==1, Dy(0)==1, D2y(0)==-1]; % n계 미분방정식인 만큼, 초기조건도 n개 제공
sol = dsolve(eq3, condition2);
simplify(sol) % 식 단순화

%% 경계값 문제 : dsolve(수식, 초기조건)
clear; clc;

syms y(t)
eq = t^2*diff(y,t,2) - 5*diff(y,t) + 8*y - 24 == 0;
% 2계 미분 방정식인 만큼, 경계조건을 2개 줘야 상수C값이 하나만 나옴
cond = [y(1)==3, y(2)==1];
dsolve(eq,cond)

%% 연립 미분 방정식1 : 미분 방정식이 하나가 아니라 연립된 경우에도, dsolve로 풀이 가능
clear; clc;

syms y1(t) y2(t)
eq1 = diff(y1,t) - y1 + 2*y2 == 4*cos(t) - 2*sin(t);
eq2 = diff(y2,t) - 3*y1 + 4*y2 == 5*cos(t) - 5*sin(t);
cond = [y1(0)==1, y2(0)==2];
S = dsolve(eq1, eq2, cond); % 결과값이 struct 형태로 저장됨
% struct 구조 안의 값을 각각 저장하는 법 : "."으로 접근
y1sol = S.y1;
y2sol = S.y2;
disp(y1sol)
disp(y2sol)