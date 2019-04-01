cvModel();

function [x, vx, y, vy] = cvModel()
clc;clear;close all;
% generate the 2D trajectory and velocity of a point moving
% according to a Constant Velocity motion model
 dt = 0.05; % time interval
 % initial position and velocity vectors


 %real
 x = csvread('x.csv');
 y = csvread('y.csv');
 
  %velocity real
vx = zeros(100, 1); % x velocity
vy = zeros(100, 1); % y velocity



 % noise vectors
 a = csvread('a.csv');
 b = csvread('b.csv');
 
 
 for i = 1:100
 %velocity noise
 va(i)  = 0.1 * a(i); % a velocity
 vb(i)  = 0.1 * b(i); % b velocity
 end


 % generate trajectory
 for i = 2:100
 x(i) = x(i-1) + (vx(i-1)*dt) + a(i);
 x(i)
 vx(i) = vx(i-1) + va(i);
 y(i) = y(i-1) + vy(i-1)*dt + b(i);
 vy(i) = vy(i-1) + vb(i);
 end
 
 plot(x,y, 'xb');
 hold;
 plot(a,b, '+r');
end