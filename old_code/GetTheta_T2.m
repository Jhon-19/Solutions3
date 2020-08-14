function [theta2_rec_sec, theta2_rec_sec_pi, theta2_rec, theta2_rec_pi, theta2, theta2_pi] = GetTheta_T2(t1, t2, a, pic, time_exa)
%该程序用于求解t1时间段，吊车开始加速时的摆角

g = 9.81; %初始化重力加速度
l = 15;   %缆绳长度为15m
t = 0:time_exa:t2;

theta2 = 2 * a / g * sin((g / l)^0.5 * t1 / 2) * sin((g / l)^0.5 * (t + t1 / 2));
theta2_rec = 2 * a / ((g * l)^0.5) * sin((g / l)^0.5 * t1 / 2) * cos((g / l)^0.5 * (t + t1 / 2));
theta2_rec_sec = - 2 * a / l * sin((g / l)^0.5 * t1 / 2) * sin((g / l)^0.5 * (t + t1 / 2));
theta2_pi = theta2 * 180 / pi;
theta2_rec_pi = theta2_rec * 180 / pi;
theta2_rec_sec_pi = theta2_rec_sec * 180 / pi;
if pic == 1
    figure
    plot(t, theta2_pi);
end


end

