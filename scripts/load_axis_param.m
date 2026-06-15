%% 获取电机参数
run('load_motor_param.m');

axis.transmission_ratio = 1; % 传动比

speed.band_width = 3871/60 * 2*pi; % 速度环带宽：4000 rpm

speed.ctrl_frequency = current.ctrl_frequency / 10; % 转速环运行频率
speed.ctrl_period = 1/speed.ctrl_frequency; % 速度环运行周期

% speed.Ba = (speed.band_width * motor.inertia - motor.friction_damping_factor) / (1.5*motor.pole_pairs * motor.psi_f); % 有功阻尼系数
speed.Ba = (speed.band_width * motor.inertia - motor.friction_damping_factor) / motor.torque_constant;

speed.kp = (speed.band_width * motor.inertia) / motor.torque_constant;
speed.ki = speed.band_width * speed.kp;
