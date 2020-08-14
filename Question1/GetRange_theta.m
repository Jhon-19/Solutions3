function [ RangeMat ] = GetRange_theta(theta1_pi, theta2_pi, theta3_pi, theta4_pi)
RangeMat = zeros(4, 4);

%区间矩阵的每i行代表第i阶段的摆动
%第1列表示起始摆角，第二列表示结束时的摆角，第三列表示最小值，第四列表示最大值

RangeMat(1, 1) = theta1_pi(1);RangeMat(1, 2) = theta1_pi(end);
RangeMat(1, 3) = min(theta1_pi);RangeMat(1, 4) = max(theta1_pi);

RangeMat(2, 1) = theta2_pi(1);RangeMat(2, 2) = theta2_pi(end);
RangeMat(2, 3) = min(theta2_pi);RangeMat(2, 4) = max(theta2_pi);

RangeMat(3, 1) = theta3_pi(1);RangeMat(3, 2) = theta3_pi(end);
RangeMat(3, 3) = min(theta3_pi);RangeMat(3, 4) = max(theta3_pi);

RangeMat(4, 1) = theta4_pi(1);RangeMat(4, 2) = theta4_pi(end);
RangeMat(4, 3) = min(theta4_pi);RangeMat(4, 4) = max(theta4_pi);

end

