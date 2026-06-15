%% 电机参数
% 电机参数来源于袁雷等老师编写的[现代永磁同步电机控制原理及MATLAB仿真](https://baike.baidu.com/item/%E7%8E%B0%E4%BB%A3%E6%B0%B8%E7%A3%81%E5%90%8C%E6%AD%A5%E7%94%B5%E6%9C%BA%E6%8E%A7%E5%88%B6%E5%8E%9F%E7%90%86%E5%8F%8AMATLAB%E4%BB%BF%E7%9C%9F/57866982)

motor.voltage          = 24; % 工作电压: Vpeak
% motor.voltage_constant = ; % 1/Kv = V_{peak}/K_{RPM}, V/rpm
motor.Ke = 0.082; % Ke = V_{peak}/K_{rad/s}, 1/Kv * 6 /1000

motor.pole_pairs       = 4; % 电机极对数
motor.phase_resistance = 0.18; % 相电阻, ohm
motor.phase_inductance = 0.65e-3; % 相电感, H@1kHz，这里的相电感与 Lq/Ld 可能不同

motor.psi_f            = 0.082; % 永磁体磁链(Wb), 这里由 Kt/(1.5*p_n*\psi_f) 得到

motor.torque_constant  = 1.5 * motor.pole_pairs * motor.psi_f; % K_t
motor.inertia          = 0.8e-3; % 转动惯量(kg·m^2)
motor.friction_damping_factor = 0.3e-3; % 摩擦阻尼系数(N·m·s/rad)
% motor.friction_damping_factor = 0.000; % 摩擦阻尼系数(N·m·s/rad)

motor.electrical_time_constant = motor.phase_inductance / motor.phase_resistance; % 电机时间常数
motor.mechanical_time_constant = 2.882e-3; % 机械时间常数，s

%% PWM 参数
%% Set PWM Switching frequency
PWM.frequency 	= 48e3;              % converter s/w freq, Hz
PWM.period      = 1/PWM.frequency;   % PWM switching time period, s
PWM.voltage_ref = 3.3; % PWM 占空比参考电压

%% 电流环参数
current.frequency  = 16e3;                % 电流控制器运行频率, Hz
current.period     = 1/current.frequency; % 电流控制器运行周期, s

current.band_width = 2 * pi / motor.electrical_time_constant;    % 电流环带宽, rad/s
current.kp         = current.band_width * motor.phase_inductance;
current.ki         = motor.phase_resistance / motor.phase_inductance;

current.limit = 7.81;
current.limit_margin = 1.1;

current.torque_constant = 0.04; % [Nm/A] for PM motors, [Nm/A^2] for induction motors. Equal to 8.27/Kv of the motor

motor.torque_max   = 5; % 电机力矩限幅, Nm
