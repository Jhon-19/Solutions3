clear;
clc;
rate = 0:0.1:1;
thetas = [7.787, 6.4801, 5.7476, ...
    5.5666, 4.9486, 1.7486, ...
    1.3642, 0.73956, 0.30605, ...
    0.11272, 0.00012065];
ms = [14835.0069, 15254.566, 16125.1436, ...
    16242.0124, 16644.0309, 17685.0455, ...
    17598.4932, 18714.1508, 16474.9455, ...
    17504.8214, 19157.6947];
vs = [0.49262, 0.48898, 0.49969, ...
    0.49985, 0.49832, 0.49561, ...
    0.50062, 0.50094, 0.49414, ...
    0.50243, 0.45308];
cftool;
% maxs = [max(thetas), max(ms), max(vs)];
% t_r = polyfit(rate, thetas, 1);
% m_r = polyfit(rate, ms, 1);
% v_r = polyfit(rate, vs, 1);
% m_rate = 0:0.001:1;
% m_thetas = polyval(t_r, m_rate);
% m_ms = polyval(m_r, m_rate);
% m_vs = polyval(v_r, m_thetas);
% figure(1);
% plot(m_rate, m_thetas, 'r');
% figure(2);
% plot(m_rate, m_ms, 'g');
% figure(3);
% plot(m_rate, m_vs, 'y');