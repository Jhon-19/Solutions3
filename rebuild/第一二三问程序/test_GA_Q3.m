clear
clc
close all


    a_speed_up = 0.5; %初始加速度大小为0.5m/s^2
    a_speed_down = -0.5;
    distance_AB = 60;  %货船——码头：60m
    distance_BC = 15;  %码头宽度：15m
    rope_len = 15;   %缆绳长度为15m
    m_goods = 6000; %货物质量为6000kg
    time_max = 120; %最长用时2分钟
    g = 9.8; %初始化重力加速度
    
    interval= 0.01; %设置时间精度
    

    %最小加速度值
    a = 0.1;
    %加速度增量
for k = 0:0.1:0.9
        a = a + k;
        Store = [];%存储不同t1,t3时的角度，质量，速度
    
    %修改t1，测试GA
    for t1 = 0.1:interval:16 
    
        %初始化t1~t4,S1~S4，初值为考虑无匀减速情况
        S1 = a * t1^2 / 2;
        S4 = distance_BC;

        %阶段2,3剩余最短时间
        t_remain_min = (distance_AB - S1) / (a * t1);

        S2 = a * t1 * t_remain_min;
        t2 = t_remain_min;

        t3 = 0;
        t4 = S4 / (a * t1);
        t_total = t1 + t2 + t3 + t4;
        
        %增量interval，测试Ga
        while t_total <= 120
            S3 = (t1 * a * 2 - a * t3) * t3 / 2;
            t2 = (distance_AB - S1 - S3) / (a * t1);
            
            %无匀速阶段，进行下次搜索
            if t2 <= 0
                t3 = t3 + interval;
                continue;
            end


            t4 = S4 / (a * t1 - a * t3);

        %t1，t3和达到最大值，跳出循环
            if t4 <= 0 
                break;
            end
            t_total = t1 + t2 + t3 + t4;
            
            is_draw = 0; %是否画出图像
            
             %计算各阶段角度
    [theta1_degree, theta1_radian, theta1_deri_st, theta1_deri_rd] = Get_theta_t_i(a_speed_up, a_speed_down, is_draw, t1);
    [theta2_degree, theta2_radian, theta2_deri_st, theta2_deri_rd] = Get_theta_t_i(a_speed_up, a_speed_down, is_draw, t1,t2);
    [theta3_degree, theta3_radian, theta3_deri_st, theta3_deri_rd] = Get_theta_t_i(a_speed_up, a_speed_down, is_draw, t1,t2,t3);
    [theta4_degree, theta4_radian, theta4_deri_st, theta4_deri_rd] = Get_theta_t_i(a_speed_up, a_speed_down, is_draw, t1,t2,t3,t4,theta3_radian, theta3_deri_st);

    %计算各阶段水平速度
    [v1] = Get_V_i_Hori(a_speed_up,a_speed_down, theta1_deri_st,  theta1_radian, is_draw,  t1);
    [v2] = Get_V_i_Hori(a_speed_up,a_speed_down, theta2_deri_st,  theta2_radian, is_draw,  t1,t2);
    [v3] = Get_V_i_Hori(a_speed_up,a_speed_down, theta3_deri_st,  theta3_radian, is_draw,  t1,t2,t3);
    [v4] = Get_V_i_Hori(a_speed_up,a_speed_down, theta4_deri_st,  theta4_radian, is_draw,  t1,t2,t3,t4);


    %计算各阶段给定theta和最大拉力下重物的最大质量
    [m1] = quality(theta1_deri_rd, theta1_radian, a_speed_up);
    [m2] = quality(theta2_deri_rd, theta2_radian, a_speed_up);
    [m3] = quality(theta3_deri_rd, theta3_radian, a_speed_up);
    [m4] = quality(theta4_deri_rd, theta4_radian, a_speed_up);
            
            %求各阶段角度初始值，结束值，最小值，最大值;
            [ theta_array ] = value_range(theta1_degree, theta2_degree, theta3_degree, theta4_degree);
            thetaMax = max(max(abs(theta_array(4, :))));
            VMax = abs(v4(end));
            m_max = min([m1 m2 m3 m4]);
            
            %超速，进行下次测试
            if VMax > 0.5
                t3 = t3 + interval;
                continue;
            else
                %保存结果，进行下次测试
                Store = [Store;[t1 t2 t3 t4 t_total a VMax thetaMax m_max]];
                t3 = t3 + interval;
            end     
        end
    end

    %显示不同a时,t1,t3取值时各阶段角度，最大质量，最大速度
    disp(['a = ', num2str(a)]);
    disp(Store);
end
    