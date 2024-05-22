clc;clear;close all;

% Sim Constants
t0 = 0;
tf = 600;
dt = 0.01;
missDistanceThreshold = 1;

% Initialize Missile States
mslPosX0 = 0;
mslPosY0 = 0;

mslVelX0 = 10;
mslVelY0 = 0;

% Initialize Target States
tgtPosX0 = 300.0;
tgtPosY0 = 60.0;

tgtVelX0 = 5;
tgtVelY0 = 5;

% Guidance Constants
proNavConst = 30;

% Run sim
sim("ProvNavModel.slx")

% Post processing
missDist = sqrt((mslPosX - tgtPosX).^2 + (mslPosY - tgtPosY).^2);

% Plotting
clear ax
figure
ax(1) = subplot(211);
hold on;grid on
plot(tout, mslPosX, 'DisplayName', 'Msl')
plot(tout, tgtPosX, 'DisplayName', 'Tgt')
xlabel('Time (sec)');ylabel('X Pos (m)')
title('Position Time History')
legend('location', 'best')

ax(2) = subplot(212);
hold on;grid on
plot(tout, mslPosY, 'DisplayName', 'Msl')
plot(tout, tgtPosY, 'DisplayName', 'Tgt')
xlabel('Time (sec)');ylabel('Y Pos (m)')
legend('location', 'best')

linkaxes(ax, 'x');


clear ax
figure
ax(1) = subplot(211);
hold on;grid on
plot(tout, mslVelX, 'DisplayName', 'Msl')
plot(tout, tgtVelX, 'DisplayName', 'Tgt')
xlabel('Time (sec)');ylabel('X Vel (m/sec)')
title('Velocity Time History')
legend('location', 'best')

ax(2) = subplot(212);
hold on;grid on
plot(tout, mslVelY, 'DisplayName', 'Msl')
plot(tout, tgtVelY, 'DisplayName', 'Tgt')
xlabel('Time (sec)');ylabel('Y Vel (m/sec)')
legend('location', 'best')

linkaxes(ax, 'x');

figure
hold on;grid on
plot(tout, missDist)
xlabel('Time (sec)');ylabel('Range (m)')
title('Slant Range Time History')
legend('location', 'best')

figure
hold on;grid on
plot(tout, accelY, 'DisplayName', 'Msl')
xlabel('Time (sec)');ylabel('Y Accel Cmd (m/sec^2)')
title('Accel Command Time History')
legend('location', 'best')

