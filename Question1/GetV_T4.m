function [v] = GetV_T4(t1, t3, t4, a_up, a_down, theta4_rec, theta4,  pic, time_exa)
g = 9.81; %��ʼ���������ٶ�
l = 15;   %��������Ϊ15m
t = 0:time_exa:t4;

vs = a_down * t3 + t1 * a_up;
vf  = theta4_rec * l;
v = vs - vf .* cos(theta4);

if pic == 1
%    figure
    plot(t, v);
end


end
