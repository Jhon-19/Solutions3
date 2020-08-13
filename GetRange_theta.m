function [ RangeMat ] = GetRange_theta(theta1_pi, theta2_pi, theta3_pi, theta4_pi)
RangeMat = zeros(4, 4);

%��������ÿi�д����i�׶εİڶ�
%��1�б�ʾ��ʼ�ڽǣ��ڶ��б�ʾ����ʱ�İڽǣ������б�ʾ��Сֵ�������б�ʾ���ֵ

RangeMat(1, 1) = theta1_pi(1);RangeMat(1, 2) = theta1_pi(end);
RangeMat(1, 3) = min(theta1_pi);RangeMat(1, 4) = max(theta1_pi);

RangeMat(2, 1) = theta2_pi(1);RangeMat(2, 2) = theta2_pi(end);
RangeMat(2, 3) = min(theta2_pi);RangeMat(2, 4) = max(theta2_pi);

RangeMat(3, 1) = theta3_pi(1);RangeMat(3, 2) = theta3_pi(end);
RangeMat(3, 3) = min(theta3_pi);RangeMat(3, 4) = max(theta3_pi);

RangeMat(4, 1) = theta4_pi(1);RangeMat(4, 2) = theta4_pi(end);
RangeMat(4, 3) = min(theta4_pi);RangeMat(4, 4) = max(theta4_pi);

end

