%% round1 : 행렬 X 행렬
clear
clc

A = [3 5 -1; 4 0 2; -6 -3 2];
B = [2 -2 3 1; 5 0 7 8; 9 -4 1 1];

C = A*B;
disp(C);
%% round2 : 전치 행렬
clear
clc

A = [5 -8 1; 4 0 0];
a = A';
disp(a);
%% round3 : 선형 연립 방정식 행렬 만들기 예
% 역행렬을 이용해서 AX=B 방정식의 해를 구하면 됩니다
clear
clc

A = [4 6 9; 6 0 -2; 5 -8 1];
B = [6; 20; 10];
X = inv(A)*B;
disp(X);

%% round4 : plot 명령어 실습
clear
clc

x = [1 2 3 4 8 7.5 8 10];
y = [2 6.5 7 7 5.5 4 6 8];
plot(x,y)
%% round5 : plot명령어 옵션 예
clear
clc

x = [1 2 3 4 8 7.5 8 10];
y = [2 6.5 7 7 5.5 4 6 8];

% 1
plot(x,y)
% 2 : 빨간 실선
plot(x,y,'r')
% 3 : 노란 파선
plot(x,y,'--y')
% 4 : 데이터 마커 *로 표시 - 연결 선은 없음
plot(x,y,'*')
%% round 6 : 예제1
clear
clc

year = [1988 1989 1990 1991 1992 1993 1994];
sales = [8 12 20 22 18 24 27];
% 라인: 빨간색, 마커: *, 라인두께: 2, 마커사이즈:12
plot(year,sales, '--r*', 'LineWidth',2,'MarkerSize',12);
%% 예제2(a)
clear
clc

% x값 구간 결정 : -2부터 4사이 0.5단위
x = -2:0.5:4;
y = exp(-0.5.*x).*cos(6.*x);
plot(x,y)
%% 예제2(b)
clear
clc

% x값 구간 결정 : -2부터 4사이 0.01단위
x = -2:0.01:4;
y = exp(-0.5.*x) .* cos(6.*x);
plot(x,y)
%% 예제3 : 항력 계산하기
clear
clc

Cd = 5; p = 1.2; A = 25;
V = 0:2.5:200;
F = Cd * ((p*(V.^2)*A) / 2);
plot(V,F);
%% round7 : 같은 그림에 여러개 곡선 출력 - 방법1
clear; clc;
% plot명령어에 여러 곡선 나열
x = -2:0.01:4;
y = 3*x.^3 - 26*x + 6;
z = 9*x.^2 - 26;
r = 18*x;
% 파란 실선, 빨간 파선, 검은 점선
plot(x,y,'-b', x,z,'--r', x,r,':k')

%% round8 : 같은 그림에 여러개 곡선 출력 - 방법2
clear; clc;
% hold on, hold off 명령어 사용
x = -2:0.01:4;
y = 3*x.^3 - 26*x + 6;
z = 9*x.^2 - 26;
r = 18*x;
% 파란 실선
plot(x,y,'-b')
hold on
% 빨간 파선
plot(x,z,'--r')
% 검은 점선
plot(x,r,':k')
% hold off 명령어를 사용하면, 그래프 그리기 모드를 초기화하여 이전 그래프가 지워짐

%% round8 : 같은 페이지에 여러 그래프 그리기
clear; clc;
% subplot 명령어 
x = -5:0.01:5;
y1 = x.^2 + 4*sin(2*x) - 1;
y2 = sin(x.^2) ./ x.^2;

% 페이지 내 구역 설정
subplot(2,1,1);
% 그래프 그리기
plot(x,y1);
% 가로축 라벨 설정
xlabel('x')
% 세로축 라벨 설정
ylabel('y1')
% 그래프 이름 설정
title('Graph1')

subplot(2,1,2);
plot(x,y2)
xlabel('x')
ylabel('y2')
title('Graph2')
%% round9 : 여러 개 그림창 생성 실습
clear; clc;
% figure명령어 : 기존 그림 창은 그대로 두고, 추가로 그림창 생성
% 번호는 생성 순서대로 붙여짐 : figure(n)
x = -10:0.01:10;
y1 = x.^3 - 4*x.^2 - 5*x - 1;
y2 = (exp(-x.^2).*sin(x)) ./ x;

% figure명령어 뒤에 plot명령어를 넣어준다(,와 함께)
figure(1), plot(x,y1)
% 가로축 라벨 설정
xlabel('x')
% 세로축 라벨 설정
ylabel('y1')
% 그래프 이름 설정
title('Graph1')


% figure명령어 뒤에 plot명령어를 넣어준다(,와 함께)
figure(2), plot(x,y2)
% 가로축 라벨 설정
xlabel('x')
% 세로축 라벨 설정
ylabel('y2')
% 그래프 이름 설정
title('Graph2')

%% 그래프 형식 지정
clear; clc;
% 그래프 형식 지정에는
% 1. 격자 표시
% 2. 축범위 재설정
% 3. 축라벨, 그래프 제목, 범례(legend), 텍스트 라벨 추가
% 스크립트 파일에 명령어를 입력해서 추가하거나, 그림창의 그래프 편집기를 이용해서 지정할 수 있습니다.

% 그래프 형식 지정 예
x = 10:0.1:22;
y = 95000 ./ (x.^2);
xd = 10:2:22;
yd = [950 640 460 340 250 180 140];

plot(x,y,'-','LineWidth',1)
xlabel('거리(cm)')
ylabel('세기(lux)')
title('거리 vs 빛의 세기')
axis([8 24 0 1200])
hold on
plot(xd, yd, '--ro', 'LineWidth',1, 'MarkerSize',10)
legend('Theory', 'Experiment')
grid on



























