function [theta3_rec_sec, theta3_rec_sec_pi, theta3_rec, theta3_rec_pi, theta3, theta3_pi] = GetTheta_T3(t1, t2, t3, a_up, a_down, pic, time_exa)

g = 9.81; %初始化重力加速度
l = 15;   %缆绳长度为15m
t = 0:time_exa:t3;

theta3_0 = 2 * a_up / g * sin((g / l)^0.5 * t1 / 2) * sin((g / l)^0.5 * (t2 + t1 / 2));
theta3_0rec = 2 * a_up / ((g * l)^0.5) * sin((g / l)^0.5 * t1 / 2) * cos((g / l)^0.5 * (t2 + t1 / 2));
theta3 = a_down / g * (1 - cos((g / l)^0.5 * t)) + theta3_0 * cos((g / l)^0.5 * t) + theta3_0rec * (g / l)^0.5 * sin((g / l)^0.5 * t);
theta3_rec = a_down / g * (g / l)^0.5 * sin((g / l)^0.5 * t) - theta3_0 * (g / l)^0.5 * sin((g / l)^0.5 * t) + theta3_0rec * g / l * cos((g / l)^0.5 * t);
theta3_rec_sec = a_down / l * cos((g / l)^0.5 * t) - theta3_0 * g / l * cos((g / l)^0.5 * t) - theta3_0rec * ((g / l)^1.5) * sin((g / l)^0.5 * t);


theta3_pi = theta3 * 180 / pi;
theta3_rec_pi = theta3_rec * 180 / pi;
theta3_rec_sec_pi = theta3_rec_sec * 180 / pi;
if pic == 1
    figure
    plot(t, theta3_pi);
end


end

