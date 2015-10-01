% Read image, compute confidence, and update lsq estimation stuff
function [bTerminate, normals, lsqData, pColor, trueConfidence] =  CollectEstimates(curIt, lsqData, fname, lights_positions, lights_brightness, normals, pColor, fnames_radianceMaps)
    [x1 y1 z1] = size(pColor);
    numImages = length(pColor);
 
    %since to compute error it is colorImage - n*l we would be trying to
    %subtract a scalar from a vector. So to alleviate problem we took the
    %color channels of the image and subtractin n*l so we have a scalar - a
    %scalar hence the below code
    rcTCI = pColor(:,:,1);
    gcTCI = pColor(:,:,2);
    bcTCI = pColor(:,:,3);
    
    %normals should hold however many images there are in normal form
    %this is our inital normals to be optimized by the optimizer
    normals = CalculateInitialNormals(lights_brightness, lights_positions); %(I, L)

    [row_normals col_normals] = size(normals);
    errorR = zeros(row_normals, col_normals);
    errorG = zeros(row_normals, col_normals);
    errorB = zeros(row_normals, col_normals);
    
    %below, calclulates error per pixel for each channel
    for i = 1:row_normals
        for j = 1:col_normals
            errorR(i, j) = rcTCI(i, j) - normals(i, j, 1);
            errorG(i, j) = gcTCI(i, j) - normals(i, j, 2);
            errorB(i, j) = bcTCI(i, j) - normals(i, j, 3);
        end
    end

    %using these errors get confidence estimate
    confidenceValues = EstimateConfidence(confidences, pColor, errorR, errorG, errorB, normals)

    % Be sure to create a call to a new function LSQ to create your optimizer
    % for solving for the normals  
    
    %%%PLACE SOLVE NORMALS HRE
    [bTerminate, normals, lsqData, pColor] = SolveNormals (lsqData, normals, pColor)
    
    bTerminate =  true;
end

%collect estimates matrix where every entry  confidences 0 -1 