文件夹包含第一、二问两种算法的主函数以及所有调用的子函数

主函数：
GATest             遗传算法求解最优值
Crane_simulink     迭代仿真算法求解所有值并进行排序求最优 / 对遗传算法结果进行检验

子函数：
Fun_GA             遗传算法自适应函数
GetTheta_T1        第一阶段每时刻的摆角值
GetTheta_T2        第二阶段每时刻的摆角值
GetTheta_T3        第三阶段每时刻的摆角值
GetTheta_T4        第四阶段每时刻的摆角值
GetV_T1            第一阶段每时刻货物水平速度
GetV_T2            第二阶段每时刻货物水平速度
GetV_T3            第三阶段每时刻货物水平速度
GetV_T4            第四阶段每时刻货物水平速度
GetT               求得每个阶段的最大载物质量
GetRange_theta     求解每个阶段摆角的范围
GetRange_V         求解每个阶段货物水平速度的范围
nonlcon            无意义，作为遗传算法的调用函数