% Prepare image
clear; close all; clc;
f = imread('ImgPIA.jpg');
f = rgb2gray(f);


imshow(f);
title("Original");
figure;

f = imbinarize(f)
imshow(f);
title("binarize");
figure;
se = strel('disk', 1);
f = imerode(f,se);
imshow(f);
title("erode");
figure;
im1 = bwareafilt(f,1);
imshow(im1);
title("area filt");
figure;
% Compute Fourier Transform
F = fft2(f,256,256);

imshow(F);
title("Fourier");
F = fftshift(F); % Center FFT
figure;
imshow(F);
title("Shift");
% Measure the minimum and maximum value of the transform amplitude
min(min(abs(F)))
max(max(abs(F)))
figure;
imshow(abs(F),[0 200]); colormap(jet); colorbar
title("Max");
figure;
imshow(log(1+abs(F)),[0,4000]); colormap(jet); colorbar
title("Min");

% Look at the phases
figure;
imshow(angle(F),[-pi,pi]); colormap(jet); colorbar
title("Angle");
I = ifft2(F, 256, 256);

figure;
imshow(I);
title("Inverse");
