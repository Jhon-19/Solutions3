function [v] = GetV_T2(t1, t2, a0, theta2_rec, theta2,  pic, time_exa)
g = 9.81; %初始化重力加速度
l = 15;   %缆绳长度为15m
t = 0:time_exa:t2;

vs = t1 * a0;
vf  = theta2_rec * l;
v = vs - vf .* cos(theta2);

if pic == 1
%    figure
    plot(t, v);
end


end
