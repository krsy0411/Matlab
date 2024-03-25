%% 실습1 : for-end 루프
clear; clc;

% 1,4,7,10의 네 수의 제곱값을 구하기
for k=1:3:10
    x = k^2;
    fprintf("%.0f번째 반복 : %.1f\n", k,x)
end

%% 실습2 : for-end 루프
clear; clc;

% 1부터 사용자가 입력한 N까지의 모든 숫자들의 합을 구하는 프로그램 작성하기
N = input("최종 숫자를 입력하세요 >> ");
% 값을 계속 누적하려면 변수가 미리 지정되어있어야하며, 그 변수는 0이어야한다.
sum = 0;

% 최종 i값은 6이다(항상 N보다 작거나 같음)
for i=1:1:N
    sum = sum+i;
end
fprintf("1부터 %d까지의 모든 수들의 합은 %d입니다\n", N, sum)

%% 예제1 : for-end 루프
clear; clc;

% 1부터 사용자가 입력한 N까지의 모든 홀수들의 합 구하기
N = input("숫자를 입력하세요 >> ");
result = 0;

for i=1:1:N
    result = result + i;
end
fprintf("1부터 %d까지의 모든 수의 합은 %d입니다\n", N, result)

%% 예제2 : for-end 루프
clear; clc;

% 입력 숫자값의 팩토리얼 구하기(단, 음수인 경우엔 음수가 입력되었음을 알리기)
N = input("숫자를 입력하세요 >> ");
% 팩토리얼 문제니까, 1로 해야죠,,,
result = 1;

if(N < 0)
    fprintf("음수를 입력하셨습니다. 다시 실행해주세요\n");
else
    for i=1:1:N
        result = result*i;
    end
    fprintf("팩토리얼 값은 %.0f입니다.\n", result);
end











