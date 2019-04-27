clear; close all; clc;
fileName = mfilename('fullpath');
fileName = erase(fileName,'task2');
file1 = strcat(fileName, 'images\imgPIA.jpg');


img1 = imread(file1);
img1 = rgb2gray(img1);

img2 = zeros(120,120);
img2 = uint8(img2);

img3 = zeros(200,200);
img3 = uint8(img3);

for x = 331:470
   for y = 110:230
       img2(x-330,y-109) = img1(y,x);     
   end    
end

for x = 180:380
   for y = 280:480
       img3(x-179,y-279) = img1(y,x);      
   end    
end



fourier(img2);
figure;
fourier(img3);

figure;

cooccurance(img2);
figure;
cooccurance(img3);

function fourier(img1) 

subplot(2,4,1);
imshow(img1);
title("Original image");

F = fft2(img1); 
subplot(2,4,2);
imshow(F);
title("Fourier");

F = fftshift(F); % Center FFT
subplot(2,4,3);
imshow(F);
title("Fourier Shift to Center");

min(min(abs(F)));
max(max(abs(F)));
subplot(2,4,4);
imshow(abs(F),[0, 1000]); 
title("min");
subplot(2,4,5);
imshow(log(1+abs(F)),[0,5]); 
title("max");

subplot(2,4,6);
imshow(angle(F),[-pi,pi]);  colormap(jet); 
title("Angle");

end 



function cooccurance(img1) 
glcm_0_s = graycomatrix(img1, 'offset', [0 1],'NumLevels', 256, 'Symmetric',true);
imshow(glcm_0_s);
glcm_0_ns = graycomatrix(img1, 'offset', [0 1], 'NumLevels', 256,'Symmetric',false);
figure;
imshow(glcm_0_ns);

end


