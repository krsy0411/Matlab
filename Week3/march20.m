%% 입력창
clear; clc;

% a = input("값을 입력해주세요 >> ");
string = input("Input a sentence \n");
disp(a)

%% disp 함수 : 변수 이름은 표시하지 않고 내용만 화면에 출력 or 문자열 텍스트를 적고 싶을때
clear; clc;

x = [1,2,3];
disp(x);
disp("The values in the x matirx are: ");

%% 실습 : disp
clear; clc;
game1 = input('첫 번째 게임에서 기록된 점수를 입력하라 : ');
game2 = input('두 번째 게임에서 기록된 점수를 입력하라 : ');
game3 = input('세 번째 게임에서 기록된 점수를 입력하라 : ');

ave_points = (game1+game2+game3)/3;
% 빈 줄 출력
disp(" ");

disp('게임에서 기록된 점수들의 평균값: ');

% 빈 줄 출력
disp(" ");
disp(ave_points);

%% fprintf함수 : 텍스트와 데이터 출력을 화면에 표시하거나 파일에 저장
clear; clc; 
% 기본 형태
fprintf('입력한 문제에는 해가 없습니다. \n 입력 데이터를 확인하세요');
disp(" ");
% 텍스트 와 수치데이터 혼합 출력을 위한 fprintf 명령어 형식
x = exp(3);
% "%" 기호는 텍스트 내에 수가 삽입될 위치를 표시
% "%5.2f"는 수의 형식을 정의하는 형식 지정 요소들 (5는 필드너비, 2는 소수점아래 자리수) : 필드너비는 별로 사용 잘 안함
fprintf('문자열 텍스트 %5.2f \n추가 텍스트', x)

%% 실습 : fprintf함수
clear; clc;

game1=input('첫 번째 게임에서 기록된 점수를 입력하라 : ');
game2=input('두 번째 게임에서 기록된 점수를 입력하라 : ');
game3=input('세 번째 게임에서 기록된 점수를 입력하라 : ');

ave_points=(game1+game2+game3) / 3;
% 숫자형태는 f형태 : 고정소수점 표기법 - 2번째 소수점자리수까지
fprintf('세 게임에서 평균 %.2f 점이 기록되었다. \n', ave_points)

%% fprintf 함수 여러 변수들 출력 : 텍스트 사이사이에 변수가 들어갈 부분은 %f, %g, %e를 이용해서 숫자 변수의 형태를 지정
clear; clc;
% 실습 : fprintf함수 여러 변수들 출력

v = 1584; % 발사체 속도(km/h)
theta = 30; % 발사체 각도(deg)
vms = v*1000 / 30; % 발사체 속도(m/s)
t = vms * sind(30) / 9.81; % 발사체가 날아간 시간(s)
d = vms * cosd(30)*2*t / 1000; % 발사체가 날아간 거리(km)
% '%g'는 소수점을 보통 다 날려주는듯?
fprintf("%4.2f km/h의 속도로 %3.2f 각도에서 발사된 발사체는 %gkm를 날아갈 것이다\n", v, theta, d)
fprintf("%4.2f km/h의 속도로 %3.2f 각도에서 발사된 발사체는 %.2fkm를 날아갈 것이다\n", v, theta, d)
 
%% 실습1 : 관계 연산자
clear; clc;

first = 5>8;
a = 5<10;
% 3개의 관계 연산자 식이 참인지 거짓인지 판단하고 그 값을 y에 저장
y = (6<10) + (7>8) + (5*3 == 60/4);
b = [15 6 9 4 11 7 14]; c = [8 20 9 2 19 7 10];
% 배열 b 각 원소를 c의 각 원소 보다 같거나 작은지 비교해서 참 거짓 값을 변수 d에 저장
d = c >= b;

disp(first)
disp(y)
disp(d)
% 배열 b의 각 요소가 배열c랑 같은 지 비교하고 참거짓 값을 출력
disp(b==c)
% b의 요소들이 c의 요소들과 같지 않은 지 확인
disp(b~=c)

% b에서 c를 빼고 요소들이 0 보다 큰지 확인
f = b-c > 0;
A = [2 9 4; -3 5 2; 6 7 -1];
% "A의 각 요소"가 2보다 작거나 같은 지 확인하고, 그 결과값을 B에 저장
B = A <= 2;

disp(f);
disp(B);


%% 실습2: 논리 연산자
clear; clc;

disp(3 & 7) % 3과 7은 참 -> 1 출력
disp(5 | 0) % 5만 참 -> or명령어이므로 1 출력
disp(~25) % 25는 참 -> 부정 연산자 -> 0 출력

t = 25 * ((12 & 0) + (~0) + (0 | 5));
disp(t);

%% 실습3 : if-end 구조
clear; clc;

x = input("x의 값을 입력하세요 >> ");

if(x>=0)
    y = sqrt(x);
    disp(y)
end

%% 실습4 : if-end 구조
clear; clc;

x = input("x의 값을 입력하세요 >> ");
y = input("y의 값을 입력하세요 >> ");

if(x>=0 && y>=0)
    z = sqrt(x) + sqrt(y);
    w = log(x) + log(y);
    fprintf("z값: %g\nw값: %g\n", z, w);
end

%% 예제1 : if-end 구조
% 실행시, 사용자는 근로시간과 시간당 임금을 입력, 프로그램은 급료 출력
clear; clc;

pay = input("시간당 임금을 입력하세요 >> ");
workTime = input("근로시간을 입력하세요 >> ");

if(workTime >= 40)
    % 40시간에 대해서는 원래임금, 초과시간에 대해서는 1.5배
    result = (40)*pay + (workTime-40)*(pay*1.5);
    fprintf("초과 임금 받는 경우 : %g\n", result);
end

%% 실습5 : if-else-end 구조
clear; clc;

x = input("x의 값을 입력하시오 >> ");

if x>=0
    y = sqrt(x);
    disp(y)
else
    y = -x;
    disp(y)
end

%% 실습6 : if-else-end 구조
clear; clc;

x=input("x의 값을 입력하시오 >> ");
y=input("y의 값을 입력하시오 >> ");

if(x>=0 && y>=0)
    z = sqrt(x) + sqrt(y);
    w = log(x) + log(y);
    fprintf("<둘 다 양수인 경우>\nz값: %.2f\nw값: %.2f\n", z,w)
else
    z = sqrt(x) + sqrt(y);
    w = z;
    fprintf("<아닌 경우>\nz값: %.2f\nw값: %.2f\n", z,w)
end

%% 예제2 : if-else-end 구조
clear; clc;

type = input("등기 or 보통 >> ");
count = input("소포 개수를 입력하세요 >> ");

if(type == "등기")
    result = 4000*count;
    fprintf("등기배달 요금은 %.0f입니다\n", result)
else
    result = 2700*count;
    fprintf("보통배달 요금은 %.0f입니다\n", result);
end

%% 실습7 : if-elseif-else-end 구조
clear; clc;

x = input("x의 값을 입력하시오 >> ");

if x>=0
    y = sqrt(x);
    fprintf("if문 y값 : %.0f\n", y)
elseif (x<0 && x>-2)
    y = -x;
    fprintf("elseif문 y값 : %.0f\n", y)
else
    y = -x^2;
    fprintf("else문 y값 : %.0f\n", y)
end












