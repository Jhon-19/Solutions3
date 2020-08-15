clear;
clc;
rate = 0:0.1:1;
thetas = [5.6104, 5.1605, 3.4651, ...
    4.6607, 2.193, 1.9534, ...
    2.0989, 2.0979, 0.63204, ...
    0.053385, 0.020148];
vs = [0.40353, 0.50007, 0.50682, ...
    0.50004, 0.50205, 0.49991, ...
    0.49711, 0.49726, 0.50067, ...
    0.49995, 0.35652];
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
