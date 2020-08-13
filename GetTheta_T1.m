function [theta1_rec_sec, theta1_rec_sec_pi, theta1_rec, theta1_rec_pi, theta1, theta1_pi] = GetTheta_T1(t1, a, pic, time_exa)
%该程序用于求解t1时间段，吊车开始加速时的摆角

g = 9.81; %初始化重力加速度
l = 15;   %缆绳长度为15m
t = 0:time_exa:t1;

theta1 = a / g .* (1 - cos((g / l)^0.5 * t));
theta1_rec = a / ((g * l)^0.5) * sin((g / l)^0.5 * t);
theta1_rec_sec = a / l * cos((g / l)^0.5 * t);
theta1_pi = theta1 * 180 / pi;
theta1_rec_pi = theta1_rec * 180 / pi;
theta1_rec_sec_pi = theta1_rec_sec * 180 / pi;
if pic == 1
    figure
    plot(t, theta1_pi);
end

end

