% 输出 : t(i)阶段各时刻的摆角角度，弧度，一阶导数，二阶导数；
%不需该参数输入为0;
function [theta_degree, theta_radian, theta_deri_st, theta_deri_rd] = Get_theta_t_i(a_speed_up, a_speed_down, is_draw, varargin)
    interval = 0.01; %增量
    g = 9.81; %初始化重力加速度
    rope_len = 15; %缆绳长度为15m

    arg_len = length(varargin);

    switch arg_len
        %阶段一 输入 t1
        case 1
            t_end  =  varargin{1};
            t = 0:interval:t_end;
            theta_radian = a_speed_up / g .* (1 - cos((g / rope_len)^0.5 * t));
            theta_deri_st = a_speed_up / ((g * rope_len)^0.5) * sin((g / rope_len)^0.5 * t);
            theta_deri_rd = a_speed_up / rope_len * cos((g / rope_len)^0.5 * t);
            theta_degree = theta_radian * 180 / pi;
            %theta1_rec_pi = theta_deri_st * 180 / pi;
            %theta1_rec_sec_pi = theta_deri_rd * 180 / pi;
            if is_draw == 1
                figure
                plot(t, theta_degree);
            end

        %阶段三   输入 t1~t2
        case 2
            t_end  =  varargin{2};
            t = 0:interval:t_end;
            theta_radian = 2 * a_speed_up / g * sin((g / rope_len)^0.5 * varargin{1} / 2) * sin((g / rope_len)^0.5 * (t + varargin{1} / 2));
            theta_deri_st = 2 * a_speed_up / ((g * rope_len)^0.5) * sin((g / rope_len)^0.5 * varargin{1} / 2) * cos((g / rope_len)^0.5 * (t + varargin{1} / 2));
            theta_deri_rd =- 2 * a_speed_up / rope_len * sin((g / rope_len)^0.5 * varargin{1} / 2) * sin((g / rope_len)^0.5 * (t + varargin{1} / 2));
            theta_degree = theta_radian * 180 / pi;
            %theta2_rec_pi = theta2_rec * 180 / pi;
            %theta2_rec_sec_pi = theta2_rec_sec * 180 / pi;
            if is_draw == 1
                figure
                plot(t, theta_degree);
            end


        %阶段三   输入 t1~t3
        case 3 

            %微分方程初值条件
            init_condition = 2 * a_speed_up / g * sin((g / rope_len)^0.5 * varargin{1} / 2) * sin((g / rope_len)^0.5 * (varargin{2} + varargin{1} / 2));
            init_condition_deri = 2 * a_speed_up / ((g * rope_len)^0.5) * sin((g / rope_len)^0.5 * varargin{1} / 2) * cos((g / rope_len)^0.5 * (varargin{2} + varargin{1} / 2));

            t_end  =  varargin{3};
            t = 0:interval:t_end;
            theta_radian = a_speed_down / g * (1 - cos((g / rope_len)^0.5 * t)) + init_condition * cos((g / rope_len)^0.5 * t) + init_condition_deri * (g / rope_len)^0.5 * sin((g / rope_len)^0.5 * t);
            theta_deri_st = a_speed_down / g * (g / rope_len)^0.5 * sin((g / rope_len)^0.5 * t) - init_condition * (g / rope_len)^0.5 * sin((g / rope_len)^0.5 * t) + init_condition_deri * g / rope_len * cos((g / rope_len)^0.5 * t);
            theta_deri_rd = a_speed_down / rope_len * cos((g / rope_len)^0.5 * t) - init_condition * g / rope_len * cos((g / rope_len)^0.5 * t) - init_condition_deri * ((g / rope_len)^1.5) * sin((g / rope_len)^0.5 * t);

            theta_degree = theta_radian * 180 / pi;
            %theta3_rec_pi = theta3_deri_init * 180 / pi;
            %theta3_rec_sec_pi = theta3_rec_sec * 180 / pi;
            if is_draw == 1
                figure
                plot(t, theta_degree);
            end


        %阶段三 ： 输入 t1~t4,theta3初值条件，theta3一阶导数初值条件
        case 6
            t_end  =  varargin{4};
            t = 0:interval:t_end;
            theta3_init = varargin{5};
            theta3_deri_init = varargin{6};


            theta_radian = theta3_init(end) * cos((g / rope_len)^0.5 * t) + theta3_deri_init(end) / ((g / rope_len)^0.5) * sin((g / rope_len)^0.5 * t);
            theta_deri_st = -(g / rope_len)^0.5 * theta3_init(end) * sin((g / rope_len)^0.5 * t) + theta3_deri_init(end) * cos((g / rope_len)^0.5 * t);
            theta_deri_rd = - theta3_init(end) * g / rope_len * cos((g / rope_len)^0.5 * t) - theta3_deri_init(end) * ((g / rope_len)^0.5) * sin((g / rope_len)^0.5 * t);
            
            theta_degree = theta_radian * 180 / pi;
            %theta4_rec_pi = theta_deri_st * 180 / pi;
            %theta4_rec_sec_pi = theta_deri_rd * 180 / pi;
            if is_draw == 1
                figure
                plot(t, theta_degree);
            end
    end

    
    
    
    end
    
