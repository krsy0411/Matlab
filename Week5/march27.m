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

syms x
A = [cos(x), sin(x); sin(x), cos(x)];
B = [sin(x), cos(x); cos(x), sin(x)];
disp(simplify(A*B)) % 수식을 정리한 결과값 출력
disp(simplify(inv(A))) % 역행렬 A^(-1) 구하기
disp(simplify(det(A))) % 행렬식 A 구하기

%% expand와 factor 명령어
clear; clc;

% expand 명령어: 식을 전개함
% factor 명령어: 다항식을 다항식의 곱으로 변환
syms a x y
S = (x+5)*(x-a)*(x-4);
T = expand(S);
disp(T) % print expand command : 식 전개
disp(sin(x-y)) % print expand command : 식 전개
disp(factor(T)) % print factor cmd : 다항식들의 곱으로 변환

%% 급수의 합 1
clear; clc;
% 급수의 합은 symsum 명령어를 사용해 계산 가능
syms k n
symsum(k,1,100) % 1+2+...+100
symsum(k^2,1,n) % 1^2 + 2^2 +...+ n^2

%% 급수의 합 2
clear; clc;

syms k x
% inf : 무한대
symsum((-1)^(k+1) / k,1,inf) % 첫번째 인자(식)에 대해 1부터 무한대까지 급수 계산
% 변수가 두 개인 경우(x,k) : 어떤 변수에 대해 수열을 바꿀지 결정해야함(두번째 인자)
symsum(x^k / factorial(k),k,0,inf) % 첫번째 인자(식)에 대해 0부터 무한대까지 급수 계산

%% 함수의 극한 1
clear; clc;
% 함수의 극한 값은, limit() 함수를 사용해 계산 가능

syms x
limit(sin(x)/x) % sin(x)/x 함수에 대해 x인자를 0으로 보낸다
limit(sin(x)/x, x, inf) % sin(x)/x 함수에 대해 x인자를 무한대로 보낸다

%% 함수의 극한 2
clear; clc;

syms x n
limit((1+x/n)^n, n, inf) % (1 + x/n)^n 함수에 대해 n값을 무한대로 보낸다

%% 기호 수식에 값 대입하기 : subs 함수
clear; clc;

% subs함수를 쓰면, 기호변수에 쉽게 값을 대입 가능
syms x a b c
e1 = a*x^2 + b*x + c;
e2 = subs(e1,x,3); % e1식에서 x대신 3을 대입
disp(e1)
disp(e2)

%% 기호수식의 그래프 그리기 : ezplot
clear; clc;

% 기호식을 그래프로 그릴땐, ezplot이라는 명령어 사용 -> 요새는 fplot을 권장하는 듯
syms x y
S1 = (3*x + 2)/(4*x - 1);
ezplot(S1)
% S2 = 4*x^2 - 18*x + 4*y^2 + 12*y - 11;
% ezplot(S2)

%% 기호수식의 그래프 그리기 : fplot
clear; clc;
% 함수를 그릴때 사용된 fplot은, 기호수식에서 함수의 그래프를 그릴때도 사용됨

syms x
y = x^2 - 2;
fplot(y)
axis([-4 4 -4 15])


