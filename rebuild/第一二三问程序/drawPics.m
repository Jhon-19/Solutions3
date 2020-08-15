function drawPics(t1, t2, t3, t4, a)
    step = 0.01;%时间的步长
    T1 = t1;%第一时刻
    T2 = t1+t2;%第二时刻
    T3 = t1+t2+t3;%第三时刻
    T4 = t1+t2+t3+t4;%第四时刻
    figure;
    %作第一阶段加速度图
    m_t1 = 0:step:T1;
    a1 = a*ones(1, length(m_t1));
    plot(m_t1, a1, 'r');
    text(m_t1(end),a1(end)-1,  'a');
    hold on;
    %作第一阶段速度图
    v1 = a1.*m_t1;
    plot(m_t1, v1, 'b');
    text(m_t1(end)+ 1,v1(end),  'v');
    hold on;
    %作第一阶段位移图
    x1 = v1.*m_t1/2;
    plot(m_t1, x1, 'k');
    text(m_t1(end)-3 ,x1(end),  'x');
    hold on;
    
    %作第二阶段加速度图
    m_t2 = T1:step:T2;
    a2 = zeros(1, length(m_t2));
    plot(m_t2, a2, 'r');
    hold on;
    %作第二阶段速度图
    v2 = v1(end)+a2.*(m_t2-T1);
    plot(m_t2, v2, 'b');
    hold on;
    %作第二阶段位移图
    x2 = x1(end)+v2.*(m_t2-T1);
    plot(m_t2, x2, 'k');
    hold on;
    
    %作第三阶段加速度图
    m_t3 = T2:step:T3;
    a3 = -a*ones(1, length(m_t3));
    plot(m_t3, a3, 'r');
    hold on;
    %作第三阶段速度图
    v3 = v2(end)+a3.*(m_t3-T2);
    plot(m_t3, v3, 'b');
    hold on;
    %作第三阶段位移图
    x3 = x2(end)+(v3+v2(end)).*(m_t3-T2)/2;
    plot(m_t3, x3, 'k');
    hold on;
    
    %作第四阶段加速度图
    m_t4 = T3:step:T4;
    a4 = zeros(1, length(m_t4));
    plot(m_t4, a4, 'r');
    hold on;
    %作第四阶段速度图
    v4 = v3(end)+a4.*(m_t4-T3);
    plot(m_t4, v4, 'b');
    hold on;
    %作第四阶段位移图
    x4 = x3(end)+v4.*(m_t4-T3);
    plot(m_t4, x4, 'k');
    hold on;
    
    %将加速度图突变部分补齐
    line([T1, T1], [a, 0], 'color', 'r');
    line([T2, T2], [0, -a], 'color' ,'r');
    line([T3, T3], [-a, 0], 'color', 'r');
    hold off;
    grid on;
    %将位移图各阶段终点做标注
    text(T1, x1(end), [num2str(T1), ',', num2str(x1(end))]);
    text(T2, x2(end), [num2str(T2), ',', num2str(x2(end))]);
    text(T3, x3(end), [num2str(T3), ',', num2str(x3(end))]);
    text(T4, x4(end), [num2str(T4), ',', num2str(x4(end))]);

	xlabel('t/s');
	ylabel('a/(m/(s^2)) - v/(m/s) - x/m');
	% legend('a', 'v', 's');
end
    