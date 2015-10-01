img = imread('Images/MM6A0370.JPG');
img = imresize(img, [500 500]);
figure, imshow(img), title('orig');
hsv = makeHSV(img);
v = hsv(:,:,3);
figure, imshow(v), title('v channel');