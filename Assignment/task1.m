close all
fileName = mfilename('fullpath');
fileName = erase(fileName,'task1');
file1 = strcat(fileName, 'images\ISIC_0000416.jpg');
file2 = strcat(fileName, 'images\ISIC_0011210.jpg');
file3 = strcat(fileName, 'images\ISIC_0011357.jpg');

file4 = strcat(fileName, 'images\ISIC_0000416_Segmentation.png');
file5 = strcat(fileName, 'images\ISIC_0011210_Segmentation.png');
file6 = strcat(fileName, 'images\ISIC_0011357_Segmentation.png');

img1 = imread(file1);
img2 = imread(file2);
img3 = imread(file3);

img4 = imread(file4);
img5 = imread(file5);
img6 = imread(file6);

imageArray = {img1,img2,img3};
imageActualArray = {img4,img5,img6};

for i = 3:3
img = imageArray{i}; 
actImage = imageActualArray{i};

img = img(:,:,3); %get blue channel

ax1 = subplot(3,2,1);
imshow(img);
title("Blue Channel");

se = strel('disk',3);
se2 = strel('disk',30);

img = imdilate(img,se);
ax2 = subplot(3,2,2);
imshow(img);
title("Dilate");


img = imbinarize(img,0.5);
ax3 = subplot(3,2,3);
imshow(img);
title("Binarized");

[height, width, dim] = size(img);

for i = 1:height-1
    for j = 1:width-1
         
        if img(i,j) == 0
            img(i,j) = 1;
            continue;
        end
        if img(i,j) == 1
            img(i,j) = 0;
            continue;
        end
    end
end

img = bwareafilt(img,1);
ax4 = subplot(3,2,4);
imshow(img);
title("area filt and flip b/w");

img = imdilate(img,se2);
ax5 = subplot(3,2,5);
imshow(img);
title("Dilate");


ax6 = subplot(3,2,6);
imshow(actImage);
title("Ground truth");

img = im2double(img);
actImage = im2double(actImage);

DS = dice(img,actImage)


end