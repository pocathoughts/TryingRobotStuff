function [img] = doubleToImg (data)


[h1, w1, ch1] = size(data);
t1 = reshape(data, h1*w1, 1);
min1 = min(t1);
d1 = 0 - min1;
img = data + d1;
t1 = reshape(img, h1*w1, 1);
max1 = max(t1);
img = img/max1;
