fileName = mfilename('fullpath');
fileName = erase(fileName,'grayvsblue');
file1 = strcat(fileName, 'images\ISIC_0000416.jpg');
file2 = strcat(fileName, 'images\ISIC_0011210.jpg');
file3 = strcat(fileName, 'images\ISIC_0011357.jpg');

img1 = imread(file1);
img2 = imread(file2);
img3 = imread(file3);

img1blue = img1(:,:,3);
img2blue = img2(:,:,3);
img3blue = img3(:,:,3);

img1gray = rgb2gray(img1);
img2gray = rgb2gray(img2);
img3gray = rgb2gray(img3);

ax1 = subplot(3,2,1);
imshow(img1blue);
title("Blue Channel 1");

ax4 = subplot(3,2,2);
imshow(img1gray);
title("Gray Image 1");

ax2 = subplot(3,2,3);
imshow(img2blue);
title("Blue Channel 2");

ax5 = subplot(3,2,4);
imshow(img2gray);
title("Gray Image 2");

ax3 = subplot(3,2,5);
imshow(img3blue);
title("Blue Channel 3");

ax6 = subplot(3,2,6);
imshow(img3gray);
title("Gray Image 3");
