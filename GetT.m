function [m] = GetT(theta_rec_sec, theta, a)
%本函数用于求解最大拉力下的最大质量
l = 15;%绳长15m
g = 9.81;%重力加速度
T = 20000 * g;
m  = T ./ ((a + l * theta_rec_sec .* (sin(theta) + cos(theta)) - g) ./ (sin(theta) - cos(theta)));
end

