%% 电机仿真参数初始化脚本

clear; clc; close all;

%% 关闭2024版新增严格报错校验
% warning('off','all');
% set_param(0,'StrictBusMatching','off');
% set_param(0,'AlgebraicLoopMsg','none');

%% 仿真配置
Ts              = 1e-6;          % 固定仿真步长(s)
Ts_speed        = 10*Ts;         %Sec Sample time for speed controller

%% 仿真工况参数（2024版适配最优工况）
T_load = 0.5;       % 恒定负载转矩(N·m)

%% 添加脚本路径
addpath('./scripts')

%% 加载电机参数
run('scripts\load_motor_param.m');
run('scripts\load_axis_param.m');
