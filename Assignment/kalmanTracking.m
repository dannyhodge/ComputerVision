function kalmanTracking()
% Track a target with a Kalman filter
% z: observation vector
clc;clear;close all;


a = csvread('a.csv');
b = csvread('b.csv');
x1 = csvread('x.csv');
y = csvread('y.csv');
size(x1)

z = [a,b];

% Return the estimated state position coordinates (px,py)
dt = 0.05; % time interval
N = length(z); % number of samples
F = [1 dt 0 0; 0 1 0 0; 0 0 1 dt; 0 0 0 1]; % CV motion model
Q = [0.2 0 0 0; 0 0.5 0 0; 0 0 0.2 0; 0 0 0 0.5]; % motion noise
H = [1 0 0 0; 0 0 1 0]; % Cartesian observation model
R = [4 0; 0 4]; % observation noise
x = [0 0 0 0]'; % initial state
P = Q; % initial state covariance
s = zeros(4,N);
e = zeros(1,100);
e2 = zeros(1,100);
for i = 1 : N
 [xp Pp] = kalmanPredict(x, P, F, Q);
 [x P] = kalmanUpdate(xp, Pp, H, R, z(:,i));
 s(:,i) = x; % save current state
 
end
px = s(1,:); % NOTE: s(2, :) and s(4, :), not considered here,
py = s(3,:); % contain the velocities on x and y respectively

for i = 1: 100
   e(i) = sqrt((x1(i)-px(i))^2 + (y(i)-py(i))^2);
   e2(i) = sqrt((a(i)-px(i))^2 + (b(i)-py(i))^2);
end

av = mean(e)
standD = std(e)


ptotal = [px,py];

rms1 = rms(e);
rms2 = rms(e2);
plot(x1,y,'xb') ;
title(rms1);
hold;
plot(px,py,'+r');

figure;

plot(a,b,'xb') ;
title(rms2);
hold;
plot(px,py,'+r');


end

