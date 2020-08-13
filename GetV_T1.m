function [v] = GetV_T1(t1, a0, theta1_rec, theta1, pic, time_exa)
g = 9.81; %��ʼ���������ٶ�
l = 15;   %��������Ϊ15m
t = 0:time_exa:t1;

vs = t * a0;
vf  = theta1_rec * l;
v = vs - vf .* cos(theta1);

if pic == 1
%    figure
    plot(t, v);
end


end

