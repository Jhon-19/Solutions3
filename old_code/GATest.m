clear
clc

%该程序为第一问动态规划程序。
%遗传算法

close all

global thetaMax VMax 

Aeq = [];
beq = [];
T = 100;
lb = [1;0];%设置左边界
rb = [16;15];%右边界
optionsOrigin = gaoptimset('Generations', T/2);
[x, fval, reason, output, finnal_pop] = ga(@Fun_GA, 2, [-1, 1],[0],Aeq,beq,lb,rb,@nonlcon, optionsOrigin);
options1 = gaoptimset('Generations', T/2, 'InitialPopulation', finnal_pop, 'PlotFcns', @gaplotbestf);
[x, fval, reason, output, finnal_pop] = ga(@Fun_GA, 2, [-1, 1],[0],Aeq,beq,lb,rb,@nonlcon, options1);%接力进化
% Bestx = x
% BestFval = fval

t1 = x(1);
t3 = x(2);

a0 = 0.5; %初始加速度大小为0.5m/s^2
D1 = 60;  %货运船到码头的距离为60m
D2 = 15;  %整个码头的宽度为15m
l = 15;   %缆绳长度为15m
m = 6000; %货物质量为6000kg
T_limit = 120; %整个吊运时间不超过120s
g = 9.81; %初始化重力加速度
t1 = x(1);
t3 = x(2); %将染色体赋值

v1 = a0 * t1;
v2 = v1 - a0 * t3;
S1 = t1 * v1 / 2;
S3 = (v1 + v2) *t3 / 2;
S2 = D1 - S1 - S3;
t2 = S2 / v1;

t4 = D2 / v2;
t_total = t1 + t2 + t3 + t4;
disp(['t1 = ', num2str(t1)]);
disp(['t2 = ', num2str(t2)]);
disp(['t3 = ', num2str(t3)]);
disp(['t4 = ', num2str(t4)]);
disp(['t总 = ', num2str(t_total)]);
disp(['最大theta = ', num2str(thetaMax)]);
disp(['最大v = ', num2str(VMax)]);
