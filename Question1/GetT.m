function [m] = GetT(theta_rec_sec, theta, a)
%���������������������µ��������
l = 15;%����15m
g = 9.81;%�������ٶ�
T = 20000 * g;
m  = T ./ ((a + l * theta_rec_sec .* (sin(theta) + cos(theta)) - g) ./ (sin(theta) - cos(theta)));
end

