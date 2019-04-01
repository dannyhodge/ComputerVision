clear; close all; clc;

fileName = mfilename('fullpath');
fileName = erase(fileName,'task3');

xPath = strcat(fileName, 'x.csv');
yPath = strcat(fileName, 'y.csv');
aPath = strcat(fileName, 'a.csv');
bPath = strcat(fileName, 'b.csv');

x = fopen(xPath, 'r');