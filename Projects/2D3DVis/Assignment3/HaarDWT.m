function final_img = HaarDWT(Image)
%%Main driver method to make the decomposition images of the 
%horizontal, vertical, and diagonal components
%this method is not called on in the driver, but it dispalys the
%Vertical, Horizontal, and Diagonal results of the Haar wavelet decomp
img = imread(Image);
figure, imshow(img), title('img');
[rows, cols, pages] = size(img);

%after trial and error I found that blurring the image produces a better
%image
h = fspecial('gaussian', [rows, cols], 1.0);
img = imfilter(img, h); 
figure, imshow(img), title('gaussian blurred image');
img = img(:, :, 1);
disp(rows);
disp(cols);
disp(pages);
if rows ~= cols
    %from reading, square images are easier to compute
    Image = imresize(img, [cols cols]);
end

pMatrix = make_Perm_Matrix(cols);
hMatrix = make_Haar_Matrix(cols);

firstHelper = pMatrix*hMatrix;
[r1 c1] = size(firstHelper)

secHelper = hMatrix'*pMatrix'; %multiply the transpose of the matrixes

final_img = firstHelper*double(img)*secHelper;

figure, imshow(final_img), title('decomposed images of VIS');
end