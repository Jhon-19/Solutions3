function [ RangeMat ] = GetRange_V(V_T1, V_T2, V_T3, V_T4)
RangeMat = zeros(4, 4);

%��������ÿi�д����i�׶εİڶ�
%��1�б�ʾ��ʼ�ڽǣ��ڶ��б�ʾ����ʱ�İڽǣ������б�ʾ��Сֵ�������б�ʾ���ֵ

RangeMat(1, 1) = V_T1(1);RangeMat(1, 2) = V_T1(end);
RangeMat(1, 3) = min(V_T1);RangeMat(1, 4) = max(V_T1);

RangeMat(2, 1) = V_T2(1);RangeMat(2, 2) = V_T2(end);
RangeMat(2, 3) = min(V_T2);RangeMat(2, 4) = max(V_T2);

RangeMat(3, 1) = V_T3(1);RangeMat(3, 2) = V_T3(end);
RangeMat(3, 3) = min(V_T3);RangeMat(3, 4) = max(V_T3);

RangeMat(4, 1) = V_T4(1);RangeMat(4, 2) = V_T4(end);
RangeMat(4, 3) = min(V_T4);RangeMat(4, 4) = max(V_T4);

end

