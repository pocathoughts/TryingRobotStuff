function trueConfidenceIMG = eightiethPercentileIMG(fnames_radiance_Maps)
% %if i would have had to read them in
% num_of_images = length(fnames_radiance_Maps);
% display(fnames_radiance_Maps);
% f = fullfile('/Users/christinemoore/Desktop/Projects/2D3DPresentation/Project1/001_phst/data/pillow',fnames_radiance_Maps(1));
% display(f);

startingIMG = imread(fnames_radiance_Maps{1,1});
num_of_images = length(fnames_radiance_Maps);

[row col depth] = size(startingIMG);

image_to_be_made = zeros(row, col, depth);
%initialize color channels
rc = startingIMG(:,:,1);
gc = startingIMG(:,:,2);
bc = startingIMG(:,:,3);

%continue layering the images over one another
for i = 2:num_of_images
    tempimg = imread(fnames_radiance_Maps{i,1});
%     startingIMG = cat(3, startingIMG, tempimg);
    tempr = tempimg(:,:,1);
    tempg = tempimg(:,:,2);
    tempb = tempimg(:,:,3);
    
    rc = cat(3, rc, tempr);
    gc = cat(3, gc, tempg);
    bc = cat(3, bc, tempb);
end

%here is where we take percentile for all pixels
for i = 1:row
    for j = 1:col
        image_to_be_made(i, j, 1) = prctile(rc(i, j, :), 80);
        image_to_be_made(i, j, 2) = prctile(gc(i, j, :), 80);
        image_to_be_made(i, j, 3) = prctile(bc(i, j, :), 80);
    end
end

trueConfidenceIMG = image_to_be_made;
end
%result is a rowxcolxnum_of_images matrix for all teh color channels


