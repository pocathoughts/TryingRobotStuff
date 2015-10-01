%  IMPLEMENT YOUR CODE HERE
%  Write normal color map
function [] = WriteNormalColorMap(fnameOut_nc, pData, normals)
% inputs:
% normals values
% fnameOut_nc
% pData
%       
%  use a for loop
%      for each normal in the normals vector, store the float in the
%      corresponding pixel location of the image buffer for HALF of the image
%      The ImageBuffer set functions should be used
%      see the std::vector class for accessing normals
img = imread(fnameOut_nc);

[row, col] = size(img);

halfway = col / 2;

img(:, 0:halway, :) = normals(:, 0:halfway, :);

% for index = 0:size(normals):
%     temp[] = normals[index];
%     dsf
%     
% end
%   save the results
    imwrite(pData, fnameOut_nc);
end
