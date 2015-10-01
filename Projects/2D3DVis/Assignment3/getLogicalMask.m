function logical = getLogicalMask(img)
%this method creates the logical matrix to be used to make
%the weighted region mask
gray = rgb2gray(img);
W = gradientweight(gray);
logical = gray > 140;

figure, imshow(W), title('gradient weighted image');
figure, imshow(logical), title('logical image to make region mask');
end