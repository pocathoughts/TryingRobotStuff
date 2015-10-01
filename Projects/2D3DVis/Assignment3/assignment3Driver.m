function [improved_image] = assignment3Driver(vis_image, nir_image)
%reading in the vis image
vis_img = imread(vis_image);
figure, imshow(vis_img), title('visible aligned image');
%reading in the nir image
nir_img = imread(nir_image);
figure, imshow(nir_img), title('near infrared aligned image');

%resize the images to be square 
[vr vc vp] = size(vis_img);
[nr nc np] = size(nir_img);

if vr ~= vc || nr ~= nc
    vis_img = imresize(img, [500 500]);
    nir_img = imresize(img, [500 500]);
end

%get vChannel of the images
%hsv_vis = makeHSV(vis_img);
%hsv_nir = makeHSV(nir_img);
%v_VIS = hsv_vis(:,:,3);
%v_NIR = hsv_nir(:,:,3);

%get the decomposition for the VIS image
[cAVIS, cHVIS, cVVIS, cDVIS] = getHaarCoeffs(vis_img);

%get the decomposition for the NIR image
[cANIR, cHNIR, cVNIR, cDNIR] = getHaarCoeffs(nir_img);

%combine the coefficients
cA = (cANIR/2 + cAVIS/2);
cH = (cHVIS/2 + cHNIR/2);
cV = (cVVIS/2 + cVNIR/2);
cD = (cDVIS/2 + cDVIS/2);

%inverse transform the coefficients to get our resulting image
improved_image = idwt2(cA,cH,cV,cD,'haar'); 
% X = X';

figure, imshow(improved_image), title('final');
