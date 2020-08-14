function [theta4_rec_sec, theta4_rec_sec_pi, theta4_rec, theta4_rec_pi, theta4, theta4_pi] = GetTheta_T4(t4, theta3, theta3_rec, pic, time_exa)

g = 9.81; %初始化重力加速度
l = 15;   %缆绳长度为15m
t = 0:time_exa:t4;

theta4 = theta3(end) * cos((g / l)^0.5 * t) + theta3_rec(end) / ((g / l)^0.5) * sin((g / l)^0.5 * t);
theta4_rec = -(g / l)^0.5 * theta3(end) * sin((g / l)^0.5 * t) + theta3_rec(end) * cos((g / l)^0.5 * t);
theta4_rec_sec = - theta3(end) * g / l * cos((g / l)^0.5 * t) - theta3_rec(end) * ((g / l)^0.5) * sin((g / l)^0.5 * t);
theta4_pi = theta4 * 180 / pi;
theta4_rec_pi = theta4_rec * 180 / pi;
theta4_rec_sec_pi = theta4_rec_sec * 180 / pi;
if pic == 1
    figure
    plot(t, theta4_pi);
end


end

