clear all
clc
close all
img1  = imread('01_dr.jpg');
img2 = imread('02_dr.jpg');
img3 = imread('03_dr.jpg');

redC = img1(:,:,1);

%took out one whole column
totalimg = cat(3, img1, img2);
pix = totalimg(500, 500, :);
disp(pix);

totalimg = cat(3, totalimg, img3);
pix2 = totalimg(500, 500, :);
disp('this is pix2'); 
disp(pix2);

listR = totalimg(:,:,1:3:9);

newImg = prctile(listR(:,:,:), 80);

greenC = img1(:,:, 2);
blueC = img1(:,:,3);

redC2 = img2(:,:,1);
greenC2 = img2(:,:,2);
blueC2 = img2(:,:,3);

redC = cat(3, redC, redC2);

redC(:, 1, :);

redC3 = img3(:,:,1);
greenC3 = img3(:,:,2);
blueC3 = img3(:,:,3);

pixelfirst = redC(400, 400, :);
disp('this is pixel first');
disp(pixelfirst);
pixelsecond = img1(400, 400, :);
disp('this is pixel second');
disp(pixelsecond);

sizeI = size(img1);
disp(sizeI);

allImages = cat(3, redC, redC2);
allImages = cat(3, allImages, img3);

pixelVal = allImages(400, 400, :);
disp('the below is peixel value');
disp(pixelVal);
eightypercentile = prctile(pixelVal, 80);
disp(eightypercentile);


%disp(allImages);
% AllImages = cell(2,1);
% AllImages{1} = img1;
% AllImages{2} = img2;
% 
% num = length(AllImages);
% 
% pixelval = AllImages(i
% 



% [x, y, z] = size(AllImages{1});
% 
% redChannelPixels = zeros(x, y);
% greenChannelPixels = zeros(x, y);
% blueChannelPixels = zeros(x, y);
% 
% for row = 1:x
%     for col = 1:y
%         tempRed = zeros(1, num);
%         tempGreen = zeros(1, num);
%         tempBlue = zeros(1, num);
%         
%         for imageNum = 1:num
%             values = impixel(AllImages{imageNum}, row, col);
%             tempRed(1, imageNum) = values(1);
%             tempGreen(1, imageNum) = values(2);
%             tempBlue(1, imageNum) = values(3);
%         end
%         
%         red = prctile(tempRed, 80);
%         blue = prctile(tempGreen, 80);
%         green = prctile(tempBlue, 80);
%         
%         redChannelPixels(row, col) = red;
%         greenChannelPixels(row, col) = green;
%         blueChannelPixels(row, col) = blue;
%     end
% end
% 
% new80PercPicture = cat(3, redChannelPixels, greenChannelPixels, blueChannelPixels);
% figure, imshow(new80PercPicture), title('final product');
