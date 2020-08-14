function value = test_func_Q3(x)%遗传算法的调用函数

    global thetaMax VMax
    weight = [0.4 0.6];

    a_speed_up = 0.5; %初始加速度大小为0.5m/s^2
    a_speed_down = -0.5;
    distance_AB = 60; %货船——码头：60m
    distance_BC = 15; %码头宽度：15m
    rope_len = 15; %缆绳长度为15m
    m_goods = 6000; %货物质量为6000kg
    time_max = 120; %最长用时2分钟
    g = 9.8; %初始化重力加速度

    interval = 0.01; %设置时间精度

    t1 = x(1);
    t3 = x(2);
    a0 = x(3); 

    %阶段一匀加速后速度
    v1 = a_speed_up * t1;

    %阶段三匀减速后速度
    v2 = v1 - a_speed_up * t3;

    %阶段一加速经过距离
    S1 = t1 * v1 / 2;

    %阶段三减速经过距离
    S3 = (v1 + v2) * t3 / 2;

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
    if t_total > 120
        value = 10000;
        return
    end

    is_draw = 0; %是否画出图像

    %计算各阶段角度
    [theta1_degree, theta1_radian, theta1_deri_st, theta1_deri_rd] = Get_theta_t_i(a_speed_up, a_speed_down, is_draw, t1);
    [theta2_degree, theta2_radian, theta2_deri_st, theta2_deri_rd] = Get_theta_t_i(a_speed_up, a_speed_down, is_draw, t1, t2);
    [theta3_degree, theta3_radian, theta3_deri_st, theta3_deri_rd] = Get_theta_t_i(a_speed_up, a_speed_down, is_draw, t1, t2, t3);
    [theta4_degree, theta4_radian, theta4_deri_st, theta4_deri_rd] = Get_theta_t_i(a_speed_up, a_speed_down, is_draw, t1, t2, t3, t4, theta3_radian, theta3_deri_st);

    %计算各阶段水平速度
    [v1] = Get_V_i_Hori(a_speed_up, a_speed_down, theta1_deri_st, theta1_radian, is_draw, t1);
    [v2] = Get_V_i_Hori(a_speed_up, a_speed_down, theta2_deri_st, theta2_radian, is_draw, t1, t2);
    [v3] = Get_V_i_Hori(a_speed_up, a_speed_down, theta3_deri_st, theta3_radian, is_draw, t1, t2, t3);
    [v4] = Get_V_i_Hori(a_speed_up, a_speed_down, theta4_deri_st, theta4_radian, is_draw, t1, t2, t3, t4);

    %计算各阶段给定theta和最大拉力下重物的最大质量
    [m1] = quality(theta1_deri_rd, theta1_radian, a_speed_up);
    [m2] = quality(theta2_deri_rd, theta2_radian, a_speed_up);
    [m3] = quality(theta3_deri_rd, theta3_radian, a_speed_up);
    [m4] = quality(theta4_deri_rd, theta4_radian, a_speed_up);

    thetaMax = max(max(abs(theta4_degree)));
    VMax = abs(v4(end));
    m_max = min([m1 m2 m3 m4]);

    %最大速度不超过0.5
    if VMax > 0.5
        value = 10000;
        return
    end

    value = ((thetaMax / 10 * weight(1))^2 + ((1 - m_max / t_total / 672) * weight(2))^2)^0.5; ; %适应度函数为B-C阶段摆角的最小值

end
