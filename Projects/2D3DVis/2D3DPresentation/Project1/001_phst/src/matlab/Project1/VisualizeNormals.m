% 
%  Called for mode 0
% 
%  It loads in a list of float triplets N(x, y, z) for each normal value.
%  You must complete the functions writeNormalMap and WriteNormalColorMap. 
%  Use the image class ImageBuffer class to store the floats in the I(r, g, b)
%  channels of an image and then save the normal buffer.
function [] = VisualizeNormals(path)

    fnameIn_normals = [path '\' 'leaf_normals.data'];  % the file that stores the normals    
    fnameIn_color = [path  '\'  'leaf_color.jpg'];     % the file that stores the normals
    fnameOut_n =  ['..\..\results\leaf_normalMap.jpg'];  % out normal map    
    fnameOut_nc = ['..\..\results\leaf_colorNormalMap.jpg'];% out color normal map

    % save a normal map
    [w h normals] = LoadNormals(fnameIn_normals);         % load the normals
    WriteNormalMap(fnameOut_n, normals, w, h);              % save a normal map
   
    pColorData =  imread(fnameIn_color);                                  % load the color image
    WriteNormalColorMap(fnameOut_nc, pColorData, normals.*255);  % save a color-normal map

end
