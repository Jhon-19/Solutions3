function [theta1_rec_sec, theta1_rec_sec_pi, theta1_rec, theta1_rec_pi, theta1, theta1_pi] = GetTheta_T1(t1, a, pic, time_exa)
%�ó����������t1ʱ��Σ�������ʼ����ʱ�İڽ�

g = 9.81; %��ʼ���������ٶ�
l = 15;   %��������Ϊ15m
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

