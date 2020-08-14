%求各个t(i)时刻重物水平速度，varargin为t(i)时间长，无需t(i)时输入0;
function [v] = Get_V_i_Hori(a_speed_up,a_speed_down,w, theta, is_draw, varargin)
    g = 9.81; %初始化重力加速度
    rope_len = 15; %缆绳长度为15m
    interval = 0.01;

    switch varargin
        %阶段1
        case 1
            t = 0:interval:varargin(1);
            vs = t * a_speed_up;
            vf = w * rope_len;
            v = vs - vf .* cos(theta);
            if is_draw == 1
                %    figure
                plot(t, v);
            end

        %阶段2
        case 2
            t = 0:interval:varargin(2);
            vs = varargin(1) * a_speed_up;
            vf = w * rope_len;
            v = vs - vf .* cos(theta);
            if is_draw == 1
                %    figure
                plot(t, v);
            end
        
        %阶段3   
        case 3
            t = 0:interval:varargin(3);
            vs = varargin(1) * a_speed_up + a_speed_down * t;
            vf = w * rope_len;
            v = vs - vf .* cos(theta);
            if is_draw == 1
                %    figure
                plot(t, v);
            end

        %阶段4  
        case 4
            t = 0:interval:varargin(4);
            vs = varargin(1) * a_speed_up + a_speed_down * varargin(3);
            vf = w * rope_len;
            v = vs - vf .* cos(theta);
            if is_draw == 1
                %    figure
                plot(t, v);
            end
    end
end
