function drawPics(t1, t2, t3, t4, a)
step = 0.01;
T1 = t1;
T2 = t1+t2;
T3 = t1+t2+t3;
T4 = t1+t2+t3+t4;
figure(1);
m_t1 = 0:step:T1;
a1 = a*ones(1, length(m_t1));
plot(m_t1, a1, 'r');
hold on;
v1 = a1.*m_t1;
plot(m_t1, v1, 'b');
hold on;
x1 = v1.*m_t1/2;
plot(m_t1, x1, 'k');
hold on;

m_t2 = T1:step:T2;
a2 = zeros(1, length(m_t2));
plot(m_t2, a2, 'r');
hold on;
v2 = v1(end)+a2.*(m_t2-T1);
plot(m_t2, v2, 'b');
hold on;
x2 = x1(end)+v2.*(m_t2-T1);
plot(m_t2, x2, 'k');
hold on;

m_t3 = T2:step:T3;
a3 = -a*ones(1, length(m_t3));
plot(m_t3, a3, 'r');
hold on;
v3 = v2(end)+a3.*(m_t3-T2);
plot(m_t3, v3, 'b');
hold on;
x3 = x2(end)+(v3+v2).*(m_t3-T2)/2;
plot(m_t3, x3, 'k');
hold on;

m_t4 = T3:step:T4;
a4 = zeros(1, length(m_t4));
plot(m_t4, a4, 'r');
hold on;
v4 = v3(end)+a4.*(m_t4-T3);
plot(m_t4, v4, 'b');
hold on;
x4 = x3(end)+v4.*(m_t4-T3);
plot(m_t4, x4, 'k');
hold on;

line([T1, T1], [a, 0], 'color', 'r');
line([T2, T2], [0, -a], 'color' ,'r');
line([T3, T3], [-a, 0], 'color', 'r');
hold off;
grid on;
text(T1, x1(end), [num2str(T1), ',', num2str(x1(end))]);
text(T2, x2(end), [num2str(T2), ',', num2str(x2(end))]);
text(T3, x3(end), [num2str(T3), ',', num2str(x3(end))]);
text(T4, x4(end), [num2str(T4), ',', num2str(x4(end))]);
end