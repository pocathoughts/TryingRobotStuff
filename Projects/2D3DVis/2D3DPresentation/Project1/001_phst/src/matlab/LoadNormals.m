% loads a list of points stored as floating point triplets
% the two entries are the width and height of the pixel map
function [w, h, normals] = LoadNormals(fname)
    f = fopen(fname, 'r');
    w = 0;
    h = 0;
    normals = zeros(h, w, 3); %x y z
    if(f ~= -1) 
        M = fscanf(f, '%g');
        w = M(1,1);
        h = M(2,1);
        npts = w*h;
     
        p = 3;
        for rows = 1:h
            for  cols = 1:w
                normals(rows, cols, :) = M(p:p+2, 1);
                p = p+3;
            end
        end
        fclose(f);
    end
 end