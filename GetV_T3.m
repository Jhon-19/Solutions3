function [v] = GetV_T3(t1, t3, a_up, a_down, theta3_rec, theta3,  pic, time_exa)
g = 9.81; %初始化重力加速度
l = 15;   %缆绳长度为15m
t = 0:time_exa:t3;

vs = a_down * t + t1 * a_up;
vf  = theta3_rec * l;
v = vs - vf .* cos(theta3);

if pic == 1
%    figure
    plot(t, v);
end


end

