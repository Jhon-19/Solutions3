function [m] = quality(theta_deri_rd, theta_radian, a)
    %求给定theta和最大拉力下rope承受的最大质量


    rope_len = 15;%绳长15m
    g = 9.8;%重力加速度
    T = 20000 * g;%最大拉力
    
    m  = T ./ ((a + rope_len * theta_deri_rd .* (sin(theta_radian) + cos(theta_radian)) - g) ./ (sin(theta_radian) - cos(theta_radian)));
    end
    