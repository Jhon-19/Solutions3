function value = test_func( x ) %遗传算法的调用函数

    global thetaMax VMax
    
    a_speed_up = 0.5; %初始加速度大小为0.5m/s^2
    a_speed_down = -0.5;
    distance_AB = 60;  %货船——码头：60m
    distance_BC = 15;  %码头宽度：15m
    rope_len = 15;   %缆绳长度为15m
    m_goods = 6000; %货物质量为6000kg
    time_max = 120; %最长用时2分钟
    g = 9.8; %初始化重力加速度
    
    interval= 0.01; %设置时间精度
    
    t1 = x(1);
    t3 = x(2); %将染色体赋值
    
    %阶段一匀加速后速度
    v1 = a_speed_up * t1;

    %阶段三匀减速后速度
    v2 = v1 - a_speed_up * t3;

    %阶段一加速经过距离
    S1 = t1 * v1 / 2;

    %阶段三减速经过距离
    S3 = (v1 + v2) *t3 / 2;

    %所求匀速运动距离
    S2 = distance_AB - S1 - S3;
    t2 = S2 / v1;

    %不需匀速行驶，返回极大值，进行下次搜索
    if S2 <= 0
        value = 10000;
        return
    end

    %码头行驶时间
    t4 = distance_BC / v2;

    t_total = t1 + t2 + t3 + t4;

    %超时，返回极大值，进行下次搜索
    if t_total >120
        value = 10000;
        return
    end
    
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

    %{
    [theta1_rec_sec, theta1_rec_sec_pi, theta1_rec, theta1_rec_pi, theta1, theta1_pi] = GetTheta_T1(t1, a_speed_up, IsPic, time_exa);
    [V_T1] = GetV_T1(t1, a_speed_up, theta1_rec, theta1, IsPic, time_exa);
    [m_1] = GetT(theta1_rec_sec, theta1, a_speed_up);
    [theta2_rec_sec, theta2_rec_sec_pi, theta2_rec, theta2_rec_pi, theta2, theta2_pi] = GetTheta_T2(t1, t2, a_speed_up, IsPic, time_exa);
    [V_T2] = GetV_T2(t1, t2, a_speed_up, theta2_rec, theta2, IsPic, time_exa);
    [m_2] = GetT(theta2_rec_sec, theta2, 0);
    [theta3_rec_sec, theta3_rec_sec_pi, theta3_rec, theta3_rec_pi, theta3, theta3_pi] = GetTheta_T3(t1, t2, t3, a_speed_up, -a_speed_up, IsPic, time_exa);
    [V_T3] = GetV_T3(t1, t3, a_speed_up, -a_speed_up, theta3_rec, theta3,  IsPic, time_exa);
    [m_3] = GetT(theta3_rec_sec, theta3, -a_speed_up);
    [theta4_rec_sec, theta4_rec_sec_pi, theta4_rec, theta4_rec_pi, theta4, theta4_pi] = GetTheta_T4(t4, theta3, theta3_rec, IsPic, time_exa);
    [V_T4] = GetV_T4(t1, t3, t4, a_speed_up, -a_speed_up, theta4_rec, theta4,  IsPic, time_exa);
    [m_4] = GetT(theta4_rec_sec, theta4, 0);
    %}

    thetaMax = max(max(abs(theta4_degree)));
    VMax = abs(v4(end));
    %最大速度不超过0.5
    if VMax > 0.5
        value = 10000;
        return
    end
    
    value = thetaMax; %适应度函数为B-C阶段摆角的最小值
    
    end
    
    