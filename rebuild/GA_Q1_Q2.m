clear
clc
close all

global thetaMax VMax 

Aeq = [];
beq = [];
%搜索次数
T = 100;

lb = [1;0];%设置左边界
rb = [16;15];%右边界
options_1 = gaoptimset('Generations', T/2);

%t3-t1 <= 0;
[x, fval, reason, output, last_gener] = ga(@test_func, 2, [-1, 1],[0],Aeq,beq,lb,rb,@nonlcon, options_1);

% last_gener:当前最后一次搜索的种群样本，在此基础再次搜索
options_2 = gaoptimset('Generations', T/2, 'InitialPopulation', last_gener, 'PlotFcns', @gaplotbestf);
[x, fval, reason, output, last_gener] = ga(@test_func, 2, [-1, 1],[0],Aeq,beq,lb,rb,@nonlcon, options_2);%接力进化
% Bestx = x
% BestFval = fval



a0 = 0.5; %初始加速度大小为0.5m/s^2
distance_AB = 60;  %货船——码头：60m
distance_BC = 15;  %码头宽度：15m
rope_len = 15;   %缆绳长度为15m
m_goods = 6000; %货物质量为6000kg
time_max = 120; %最长用时2分钟
g = 9.8; %初始化重力加速度


t1 = x(1);
t3 = x(2); 

v1 = a0 * t1;
v2 = v1 - a0 * t3;
S1 = t1 * v1 / 2;
S3 = (v1 + v2) *t3 / 2;
S2 = distance_AB - S1 - S3;
t2 = S2 / v1;

t4 = distance_BC / v2;
t_total = t1 + t2 + t3 + t4;
disp(['t1 = ', num2str(t1)]);
disp(['t2 = ', num2str(t2)]);
disp(['t3 = ', num2str(t3)]);
disp(['t4 = ', num2str(t4)]);
disp(['t总 = ', num2str(t_total)]);
disp(['最大theta = ', num2str(thetaMax)]);
disp(['最大v = ', num2str(VMax)]);
