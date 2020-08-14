function [ RangeMat ] = GetRange_V(V_T1, V_T2, V_T3, V_T4)
RangeMat = zeros(4, 4);

%区间矩阵的每i行代表第i阶段的摆动
%第1列表示起始摆角，第二列表示结束时的摆角，第三列表示最小值，第四列表示最大值

RangeMat(1, 1) = V_T1(1);RangeMat(1, 2) = V_T1(end);
RangeMat(1, 3) = min(V_T1);RangeMat(1, 4) = max(V_T1);

RangeMat(2, 1) = V_T2(1);RangeMat(2, 2) = V_T2(end);
RangeMat(2, 3) = min(V_T2);RangeMat(2, 4) = max(V_T2);

RangeMat(3, 1) = V_T3(1);RangeMat(3, 2) = V_T3(end);
RangeMat(3, 3) = min(V_T3);RangeMat(3, 4) = max(V_T3);

RangeMat(4, 1) = V_T4(1);RangeMat(4, 2) = V_T4(end);
RangeMat(4, 3) = min(V_T4);RangeMat(4, 4) = max(V_T4);

end

