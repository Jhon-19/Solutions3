%本程序运行时间约为5min

clear
clc
close all

%%初始化变量

a0 = 0.5; %初始加速度大小为0.5m/s^2
D1 = 60;  %货运船到码头的距离为60m
D2 = 15;  %整个码头的宽度为15m
l = 15;   %缆绳长度为15m
m = 6000; %货物质量为6000kg
T_limit = 120; %整个吊运时间不超过120s
g = 9.81; %初始化重力加速度

time_exa = 0.01; %设置时间精度
TSet = []; %初始化存储变量

%%开始使用迭代仿真法进行计算
for t1 = time_exa:time_exa:16 %迭代法对t1赋值
    
    %由限制条件可以输入t1、t3的值，确定其余变量的值
    S1 = a0 * t1^2 / 2;
    S4 = D2;
    t2_3_min = (D1 - S1) / (a0 * t1);
    S2 = a0 * t1 * t2_3_min;
    t2 = t2_3_min;
    t3 = 0;
    t4 = 15 / (a0 * t1);
    t_tol = t1 + t2 + t3 + t4;
    
    
    while t_tol <= 120 %迭代法对t3赋值
        S3 = (t1 * a0 * 2 - a0 * t3) * t3 / 2;
        t2 = (60 - S1 - S3) / (a0 * t1);
        if t2 <= 0
            t3 = t3 + time_exa;
            continue;
        end
        t4 = S4 / (a0 * t1 - a0 * t3);
        if t4 <= 0 
            break;
        end
        t_tol = t1 + t2 + t3 + t4;
        
        IsPic = 0; %是否画出图像
        
        %调用8个子函数，分别计算每个阶段每时每刻的摆角变化以及货物的水平速度值
        [theta1_rec_sec, theta1_rec_sec_pi, theta1_rec, theta1_rec_pi, theta1, theta1_pi] = GetTheta_T1(t1, a0, IsPic, time_exa);
        [V_T1] = GetV_T1(t1, a0, theta1_rec, theta1, IsPic, time_exa);
        [theta2_rec_sec, theta2_rec_sec_pi, theta2_rec, theta2_rec_pi, theta2, theta2_pi] = GetTheta_T2(t1, t2, a0, IsPic, time_exa);
        [V_T2] = GetV_T2(t1, t2, a0, theta2_rec, theta2, IsPic, time_exa);
        [theta3_rec_sec, theta3_rec_sec_pi, theta3_rec, theta3_rec_pi, theta3, theta3_pi] = GetTheta_T3(t1, t2, t3, a0, -a0, IsPic, time_exa);
        [V_T3] = GetV_T3(t1, t3, a0, -a0, theta3_rec, theta3,  IsPic, time_exa);
        [theta4_rec_sec, theta4_rec_sec_pi, theta4_rec, theta4_rec_pi, theta4, theta4_pi] = GetTheta_T4(t4, theta3, theta3_rec, IsPic, time_exa);
        [V_T4] = GetV_T4(t1, t3, t4, a0, -a0, theta4_rec, theta4,  IsPic, time_exa);
        
        %调用区间求值函数，得到三个阶段的摆角范围
        [ RangeMat_theta ] = GetRange_theta(theta1_pi, theta2_pi, theta3_pi, theta4_pi);
        thetaMax = max(max(abs(RangeMat_theta(4, :))));
        VMax = abs(V_T4(end));
        
        if VMax > 0.5
            t3 = t3 + time_exa;
            continue;
        else
            TSet = [TSet;[t1 t2 t3 t4 t_tol VMax thetaMax]];
            t3 = t3 + time_exa;
        end     
    end
end

disp('所有线路结果存储在变量TSet中');

