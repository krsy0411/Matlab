function dydt = twoeq(t,y)
dydt(1) = y(2); % y1은 식에서 y, y2는 식에서 z
dydt(2) = y(1) + t - y(2);

dydt = dydt'; % ode solver의 출력은, 열벡터가 되어야함
end

