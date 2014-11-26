figure,
img = imread('fundus3.png');
%gray = rgb2gray(img);
%J = imadjust(gray);
im = im2bw(img);

[bw, maskedRGBImage] = FMask(img); 
%calls FMask to convert to binary
%uses best thresholds

BW2 = bwareaopen(bw, 6);
%above stuff gets ride of noise, only keeps big chunks of OD

subplot(3,4,1);
imshow(BW2);
title('after');

subplot(3,4,2);
imshow(masked_image);
title('before');

% just to double check everything is correct
% [x,y]=size(BW2); need height and width
% disp(x);
% disp(y);

%takes our thresholded image and find the center of the OD
[x, y] = getCenterPoint(BW2);
disp(x);

imagesc(img);
hold on;
imshow(plot(x, y,'*')); %shows our detected center

%NOW WE NEED TO MAKE AN ROI AROUND THE OD
%the roi is necessary because the OD finder algorithm used
%is SUPA time intensive so we only wnat it to work on the area we need!


