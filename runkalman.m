
a = csvread('a.csv');
b = csvread('b.csv');

z = [a,b];

[resX, resY] = kalmanTracking(z)