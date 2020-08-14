clear
clc

%�ó���Ϊ��һ�ʶ�̬�滮����
%�Ŵ��㷨

close all

global thetaMax VMax 

Aeq = [];
beq = [];
T = 100;
lb = [1;0];%������߽�
rb = [16;15];%�ұ߽�
optionsOrigin = gaoptimset('Generations', T/2);
[x, fval, reason, output, finnal_pop] = ga(@Fun_GA, 2, [-1, 1],[0],Aeq,beq,lb,rb,@nonlcon, optionsOrigin);
options1 = gaoptimset('Generations', T/2, 'InitialPopulation', finnal_pop, 'PlotFcns', @gaplotbestf);
[x, fval, reason, output, finnal_pop] = ga(@Fun_GA, 2, [-1, 1],[0],Aeq,beq,lb,rb,@nonlcon, options1);%��������
% Bestx = x
% BestFval = fval

t1 = x(1);
t3 = x(2);

a0 = 0.5; %��ʼ���ٶȴ�СΪ0.5m/s^2
D1 = 60;  %���˴�����ͷ�ľ���Ϊ60m
D2 = 15;  %������ͷ�Ŀ��Ϊ15m
l = 15;   %��������Ϊ15m
m = 6000; %��������Ϊ6000kg
T_limit = 120; %��������ʱ�䲻����120s
g = 9.81; %��ʼ���������ٶ�
t1 = x(1);
t3 = x(2); %��Ⱦɫ�帳ֵ

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
disp(['t�� = ', num2str(t_total)]);
disp(['���theta = ', num2str(thetaMax)]);
disp(['���v = ', num2str(VMax)]);
