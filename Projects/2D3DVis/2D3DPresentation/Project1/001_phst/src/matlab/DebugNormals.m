% IMPLEMENT YOUR CODE HERE
%  paint the pixels of the image white if the 
% correspondin normal at that pixel has a lenght less than 1
function [] = DebugNormals(path)

    white = [1.0, 1.0, 1.0];
    
    %I HARD CODED IN THE PICTURE BECAUSE I WAS HAVING PATH ISSUES :)
    %FINALLY GOT IT TO WORK!!!!
    fnameIn_normals = ['leaf_normals_debug.data'];  % the file that stores the normals    
    fnameOut_n =  ['leaf_normal_debug.jpg'];  % out normal map    


    % save a normal map
    [w, h, normals] = LoadNormals(fnameIn_normals);         % load the normals 

    % use a for loop
    % for each normal value
    % check to if it is normalized
    % if not update the corresponding pixel by painting it black
    [h, w, ch] = size(normals);
        for rows = 1:h
            for  cols = 1:w
                val = sqrt(normals(rows, cols, 1)^2 + normals(rows, cols, 2)^2 + normals(rows, cols, 3)^2);
                if(val < 1)
                    normals(rows, cols, :) = 1;
                end
            end
        end

    figure, imshow(normals), title('nomrlas');
%   save the results
    imwrite(normals, fnameOut_n);    
end