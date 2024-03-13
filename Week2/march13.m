%% round1
clear
clc

% Q1
X = [18 48 45 75; 24 55 95 34; 32 78 82 69; 11 84 76 93];
% Q2
[rowLength, columnLength] = size(X);
% Q3
upSorted = sort(X);
% Q4
downSorted = sort(X, 'descend');
% Q5
sortrows(X);
% Q6
sortrows(X,3);

%% round2
clear
clc

% 특수 행렬 만들기
zeroArray = zeros(3,4);
oneArray = ones(4,3);
unitArray = eye(5);

% 배열 원소 개별 접근(벡터)
v = [35 46 78 23 5 14 81 3 55];
fprintf("%d %d %d %d", v(4), v(7), v(1), v(2)+v(4)*v(6));

% 배열 원소 개별 접근(행렬)
M = [3 11 6 5; 4 7 10 2; 13 9 0 8];
fprintf("%d %d", M(3,1), M(2,4)-M(1,2));
% 새로 값을 할당
M(3,1) = 20;
fprintf("%d %d", M(3,1));

% 배열 원소 그룹 접근(벡터)
V = [4 15 8 12 34 2 50 23 11];
% 벡터 V의 3~7번째 원소로 벡터 U를 생성
U = V(3:7);

% 배열 원소 그룹 접근(행렬)
A = [1 3 5 7 9 11; 2 4 6 8 10 12; 3 6 9 12 15 18; 4 8 12 16 20 24; 5 10 15 20 25 30];
B = A(:, 3);
C = A(2, :);
D = A(2:4, :);
E = A(1:3, 2:4);

% 4부터 3씩 더해서 34까지의 값을 배열에 담은 벡터 생성
vector = 4:3:34;
% 벡터로부터 3, 5, 7~10번째 원소들을 빼내 one이라는 벡터에 할당
one = vector([3, 5, 7:10]);
% 4x7 행렬 생성
two = [10:-1:4; ones(1,7); 2:2:14; zeros(1,7)];
% one벡터로부터 1행에서의 1,3,5,6,7열의 원소값을 three벡터에 할당
three = one(1, [1,3,5:7]);
% one벡터로부터 1행,3행에서 각각 1,3,5,6,7열의 원소를 four벡터에 할당
four = one([1,3], [1,3,5:7]);

%% round3
clear
clc










