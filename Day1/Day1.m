%% Round 1
clear
clc

% 예제 1
first = (5+3) / (9-1);
second = 2^3 - (4/(5+3));
third = 5^(2+1) / (4-1);
fourth = (4/2) * (5*(2/3));
fifth = (5 + 6 + (7/3) - 2^2) / ((2/3) * (3/(3*6)));

fprintf("%d %d %d %d %d\n", first, second, third, fourth, fifth);

% 예제2
a = 1.3654; b = 0.8454; c = 3.1458; d = 15.3; a1 = 0.154;
x = a * a1 * (d^3/2) * (1/b*c);
y = (1/((-1/a) + (1/b))) * ((4*a1) / ((1/b) + (1/d)));
z = x + (1 / ((-1/a) + (1/b))) + (4*a1 / ((1/b) + (1/d)));

fprintf("%d %d %d\n", x,y,z);

%% Round 2
clear
clc

x=9; a=1; b=3; c=5;
shared = a*x^2 + b*x + c;
f = (log(shared) - sin(shared)) / (4*pi*x^2 + (cos(x-2)*shared));

disp(f);

