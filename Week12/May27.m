% 예제) 각속도 문제 : plot time vs the number of revolutions
clear; clc;

t1 = 0:0.01:2; 
N1 = (12*t1 - t1.^3) / 2/pi;
t2 = 2:0.01:4;
N2 = (32 - 12*t2 + t2.^3) / 2/pi;
plot(t1, N1, 'b', t2, N2, 'b'), xlabel("time[sec]"), ylabel("total number of revolutions");
