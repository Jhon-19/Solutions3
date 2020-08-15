function [ output_Matrix ] = value_range(input_1, input_2, input_3, input_4)

%第i行:第i阶段的摆动; 列分别表示初始值，结束值，最小值，最大值;
    
    output_Matrix = zeros(4, 4);
    
    
    %阶段一
    output_Matrix(1, 1) = input_1(1);
    output_Matrix(1, 2) = input_1(end);
    output_Matrix(1, 3) = min(input_1);
    output_Matrix(1, 4) = max(input_1);

    %阶段二
    output_Matrix(2, 1) = input_2(1);
    output_Matrix(2, 2) = input_2(end);
    output_Matrix(2, 3) = min(input_2);
    output_Matrix(2, 4) = max(input_2);
    
    %阶段三
    output_Matrix(3, 1) = input_3(1);
    output_Matrix(3, 2) = input_3(end);
    output_Matrix(3, 3) = min(input_3);
    output_Matrix(3, 4) = max(input_3);
    
    %阶段四
    output_Matrix(4, 1) = input_4(1);
    output_Matrix(4, 2) = input_4(end);
    output_Matrix(4, 3) = min(input_4);
    output_Matrix(4, 4) = max(input_4);
    
    end
    
    