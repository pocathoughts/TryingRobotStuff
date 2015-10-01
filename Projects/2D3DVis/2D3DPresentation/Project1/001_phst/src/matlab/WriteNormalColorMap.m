%  IMPLEMENT YOUR CODE HERE
%  Write normal color map
function [] = WriteNormalColorMap(fnameOut_nc, pData, normals)
% inputs:
% normals values
% fnameOut_nc
% pData
%       

%assuming pData is the color image
[row, col] = size(pData);

halway = 0;
%check and make sure that half of image is an intenger
if mod(col, 2) ~= 0 %we have odd num of cols, makes hard to half 
    tempcol = col;
    tempcol = tempcol + 1; %just added one to make even, could have subtracted one
    halfway = tempcol / 2;
    
elseif mod(col, 2) == 0
    halway = col / 2;
end

%this is where image half is actually colored
pData(:, 1:halway, :) = normals(:, 1:halfway, :);


%   save the results
    imwrite(pData, fnameOut_nc);
end
