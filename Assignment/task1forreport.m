close all; clc;


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

imageArray = {img1,img2,img3};


img4 = imread(file4);
img5 = imread(file5);
img6 = imread(file6);


imageActualArray = {img4,img5,img6};

for i = 1:3
img = imageArray{i}; 
actImage = imageActualArray{i};


img = img(:,:,3);            %get blue channel
img = imbinarize(img,0.51);  %convert to black and white based on threshold
img = ~img;                  %flip black and white



se = strel('disk',3);     %a relatively small structuring element, to remove hairs
img = imerode(img,se);    %remove borders of images based on the stucturing element
img = bwareafilt(img,1);  %return largest remaining image



img = imfill(img,'holes'); %fill in spaces inside image
se2 = strel('disk',20);    %larger structuring element
img = imdilate(img,se2);   %expand image back to full size



img = im2double(img);
actImage = im2double(actImage);
DS = dice(img,actImage)
figure;

end