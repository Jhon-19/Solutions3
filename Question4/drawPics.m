function drawPics(t1, t2, t3, t4, a)
step = 0.01;%ʱ��Ĳ���
T1 = t1;%��һʱ��
T2 = t1+t2;%�ڶ�ʱ��
T3 = t1+t2+t3;%����ʱ��
T4 = t1+t2+t3+t4;%����ʱ��
figure;
%����һ�׶μ��ٶ�ͼ
m_t1 = 0:step:T1;
a1 = a*ones(1, length(m_t1));
plot(m_t1, a1, 'r');
hold on;
%����һ�׶��ٶ�ͼ
v1 = a1.*m_t1;
plot(m_t1, v1, 'b');
hold on;
%����һ�׶�λ��ͼ
x1 = v1.*m_t1/2;
plot(m_t1, x1, 'k');
hold on;

%���ڶ��׶μ��ٶ�ͼ
m_t2 = T1:step:T2;
a2 = zeros(1, length(m_t2));
plot(m_t2, a2, 'r');
hold on;
%���ڶ��׶��ٶ�ͼ
v2 = v1(end)+a2.*(m_t2-T1);
plot(m_t2, v2, 'b');
hold on;
%�������׶�λ��ͼ
x2 = x1(end)+v2.*(m_t2-T1);
plot(m_t2, x2, 'k');
hold on;

%�������׶μ��ٶ�ͼ
m_t3 = T2:step:T3;
a3 = -a*ones(1, length(m_t3));
plot(m_t3, a3, 'r');
hold on;
%�������׶��ٶ�ͼ
v3 = v2(end)+a3.*(m_t3-T2);
plot(m_t3, v3, 'b');
hold on;
%�������׶�λ��ͼ
x3 = x2(end)+(v3+v2(end)).*(m_t3-T2)/2;
plot(m_t3, x3, 'k');
hold on;

%�����Ľ׶μ��ٶ�ͼ
m_t4 = T3:step:T4;
a4 = zeros(1, length(m_t4));
plot(m_t4, a4, 'r');
hold on;
%�����Ľ׶��ٶ�ͼ
v4 = v3(end)+a4.*(m_t4-T3);
plot(m_t4, v4, 'b');
hold on;
%�����Ľ׶�λ��ͼ
x4 = x3(end)+v4.*(m_t4-T3);
plot(m_t4, x4, 'k');
hold on;

%�����ٶ�ͼͻ�䲿�ֲ���
line([T1, T1], [a, 0], 'color', 'r');
line([T2, T2], [0, -a], 'color' ,'r');
line([T3, T3], [-a, 0], 'color', 'r');
hold off;
grid on;
%��λ��ͼ���׶��յ�����ע
text(T1, x1(end), [num2str(T1), ',', num2str(x1(end))]);
text(T2, x2(end), [num2str(T2), ',', num2str(x2(end))]);
text(T3, x3(end), [num2str(T3), ',', num2str(x3(end))]);
text(T4, x4(end), [num2str(T4), ',', num2str(x4(end))]);
end