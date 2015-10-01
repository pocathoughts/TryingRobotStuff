function [lsq_data] = LSQ(pColor, confidences, light_intensities, light_pos, lsqData)
%     so the idea is that we have Ax = y
%     for us A is light direction, b is intensities, and x is normals
%         see slides in notes
%     to solve for normals we want to rearrange everything
%     we get:
%        x = (A(transpose)*A)^-1 * A(transpose)B
%            * A(transpose) is 3x36 and A is 36x3 so the resulting matrix is
%              a 3x3 matrix A that we can store in the lsq struct!!!
%            *FINALLY FOUND IT wheee
%            * A(transpose) is 3x36 and B is 36x1 so we get a 3x1 matrix
%            *if we compute A(transpose)B for all the color channels we have 
%            *our 3x1 components of the lsq data! YAY!
  
    matrixA = zeros(3);
    matrixA = inv(light_pos.'*light_pos)
    
    rgbStructStarter = light_pos.'*light_intensities;
    
    lsqR = rgbStructStarter(:,:,1);
    lsqG = rgbStructStarter(:,:,2);
    lsqB = rgbStructStarter(:,:,3);
    
    lsqData.A = matrixA;
    lsqData.red = lsqR;
    lsqData.green = lsqG;
    lsqData.blue = lsqB;
    
    %not sure how this ties into the lsq_optimization method
end