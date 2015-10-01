function [mask] = makeMaskROI(img)
%%%%%%%%%%%%%%A mask image that I previously made is in the zip
%the image is called binaryMask.jpg
%mask was created by manually picking the points using roipoly

BW = roipoly(img);
mask = createMask(BW);
figure, imshow(BW), title('pick region');
figure, imshow(mask), title('mask');

end
