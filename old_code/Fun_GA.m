function f = Fun_GA( x ) %�Ŵ��㷨�ĵ��ú���

global thetaMax VMax

a0 = 0.5; %��ʼ���ٶȴ�СΪ0.5m/s^2
D1 = 60;  %���˴�����ͷ�ľ���Ϊ60m
D2 = 15;  %������ͷ�Ŀ��Ϊ15m
l = 15;   %��������Ϊ15m
m = 6000; %��������Ϊ6000kg
T_limit = 120; %��������ʱ�䲻����120s
g = 9.81; %��ʼ���������ٶ�

time_exa = 0.01; %����ʱ�侫��

t1 = x(1);
t3 = x(2); %��Ⱦɫ�帳ֵ

v1 = a0 * t1;
v2 = v1 - a0 * t3;
S1 = t1 * v1 / 2;
S3 = (v1 + v2) *t3 / 2;
S2 = D1 - S1 - S3;
t2 = S2 / v1;
if S2 <= 0
    f = 10000;
    return
end
t4 = D2 / v2;
t_tol = t1 + t2 + t3 + t4;
if t_tol >120
    f = 10000;
    return
end

IsPic = 0; %�Ƿ񻭳�ͼ��

[theta1_rec_sec, theta1_rec_sec_pi, theta1_rec, theta1_rec_pi, theta1, theta1_pi] = GetTheta_T1(t1, a0, IsPic, time_exa);
[V_T1] = GetV_T1(t1, a0, theta1_rec, theta1, IsPic, time_exa);
[m_1] = GetT(theta1_rec_sec, theta1, a0);
[theta2_rec_sec, theta2_rec_sec_pi, theta2_rec, theta2_rec_pi, theta2, theta2_pi] = GetTheta_T2(t1, t2, a0, IsPic, time_exa);
[V_T2] = GetV_T2(t1, t2, a0, theta2_rec, theta2, IsPic, time_exa);
[m_2] = GetT(theta2_rec_sec, theta2, 0);
[theta3_rec_sec, theta3_rec_sec_pi, theta3_rec, theta3_rec_pi, theta3, theta3_pi] = GetTheta_T3(t1, t2, t3, a0, -a0, IsPic, time_exa);
[V_T3] = GetV_T3(t1, t3, a0, -a0, theta3_rec, theta3,  IsPic, time_exa);
[m_3] = GetT(theta3_rec_sec, theta3, -a0);
[theta4_rec_sec, theta4_rec_sec_pi, theta4_rec, theta4_rec_pi, theta4, theta4_pi] = GetTheta_T4(t4, theta3, theta3_rec, IsPic, time_exa);
[V_T4] = GetV_T4(t1, t3, t4, a0, -a0, theta4_rec, theta4,  IsPic, time_exa);
[m_4] = GetT(theta4_rec_sec, theta4, 0);

thetaMax = max(max(abs(theta4_pi)));
VMax = abs(V_T4(end));
if VMax > 0.5
    f = 10000;
    return
end

f = thetaMax; %��Ӧ�Ⱥ���ΪB-C�׶ΰڽǵ���Сֵ

end

