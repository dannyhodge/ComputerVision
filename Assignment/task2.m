clear; close all; clc;
fileName = mfilename('fullpath');
fileName = erase(fileName,'task2');
file1 = strcat(fileName, 'images\imgPIA.jpg');
img1 = imread(file1);
img1 = rgb2gray(img1);
imshow(img1);
figure;
img1 = imbinarize(img1);
imshow(img1);
figure;

subplot(2,4,1);
imshow(img1);
title("Original image");

F = fft2(img1, 256,256); 
subplot(2,4,2);
imshow(F);
title("Fourier");

F = fftshift(F); % Center FFT
subplot(2,4,3);
imshow(F);
title("Fourier Shift to Center");

min(min(abs(F)))
max(max(abs(F)))
subplot(2,4,4);
imshow(abs(F),[0 100]); colormap(jet); colorbar
title("min");
subplot(2,4,5);
imshow(log(1+abs(F)),[0,3]); colormap(jet); colorbar 
title("max");

subplot(2,4,6);
imshow(angle(F),[-pi,pi]); colormap(jet); colorbar
title("Angle");

I = ifft2(F, 256, 256);
subplot(2,4,7);
imshow(I);