%% 예제3) for-end 루프
clear; clc;

N = input("숫자를 입력하세요>> ");
result = 0;
% 1부터 N까지 반복되도록 설정
for k=1:1:N
    result = result + (((-1)^k)*k / 2^k);
end

fprintf("결과값은 %g입니다.\n", result);

%% 예제4) for-end 루프
clear; clc;

V = [5,17,-3,8,0,-7,12,15,20,-6,6,4,-2,16];
% 배열 초기화
A = 1:1:length(V);

for i=1:1:length(V)
    if (V(i)/2 == 0 && V(i) > 0)
        A(i) = V(i)*2;
    elseif (V(i) < 0 && V(i) > -5)
        A(i) = V(i)^3;
    else
        A(i) = V(i);
    end
end

disp(A);
%% 실습1) while-end 루프 예
clear; clc;

m = 1;
while m<=7
    m = 2*m;
    disp(m)
end
%% 실습2) while루프 vs for루프
clear; clc;

% 1부터 N까지의 정수의 합을 구하는 프로그램
N = input("숫자를 입력하세요 >>> ");
sum = 0;
for i=1:N
    sum = sum + 1;
end

k=1; sum_while = 0;
while k<=N
    sum_while = sum_while + k;
    % 조건식의 변수 업데이트 해줘야 반복문 탈출 가능
    k = k+1;
end

disp(sum)
disp(sum_while)

%% 예제1) while-end 루프
clear; clc;

result = 1;
index = 1;
N = input("반복횟수를 나타내는 숫자를 입력해주세요 >> ");

% 사용자가 입력한 값보다 작거나 같은 동안에만 유효한 블록
while index<=N
    % 음수인 경우엔 메시지만 출력
    if N<0
        fprintf("다시 숫자를 입력해주세요..");
    else
        result = result*index;
        % update index
        index = index + 1;
    end
end
fprintf("팩토리얼의 결과값 >> %.0f\n", result);

%% 예제2) while-end 루프
clear; clc;

result = 0;
index = 1;
N = input("숫자를 입력해주세요 >>> ");

while index <= N
    result = result + (((-1)^index * index) / (2^index));
    % 항상 인덱스값 변경시켜주기
    index = index + 1;
end
disp(result)

%% 예제3) while-end 루프
clear; clc;

i = 1;
result = 0;
x = input("지수값을 하나 넣어주세요 >> ");

while i<=30
    tempValue = x^i / factorial(i);
    if (tempValue > 0.0001 && i==30)
        fprintf("30개 이상의 항이 필요합니다.\n");
        break;
    end

    if abs(tempValue) < 0.0001
        % 더해줄 값이 기준치 이하면, 그냥 반복문 탈출
        break;
    else
        result = result + tempValue;
    end
    % 항상 인덱스값은 업데이트
    i = i+1;
end
disp(result);












