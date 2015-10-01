% Read image, compute confidence, and update lsq estimation stuff
function [bTerminate, normals, lsqData, pColor] =  CollectEstimates(curIt, lsqData, fname, lights_positions, lights_brightness, normals, pColor)
    [x1 y1 z1] = size(pColor);
    %not sure if above is the way to do it
    %I'm trying to get how many color images are stored in pColor
    %this is under the assumption that each element in pColor is a color
    %image
    %I'm taking that the y value is how many color images are in pColor
   
    
    initialPColorComparison = zeroes(x1, y1, z1);
    trueConfidence = [];
    
    for i = 1:y1
        %the goal of this for loop is average the values of the 80th
        %percentile of the color values for each image together to make one
        %new matrix containing the values of all the 80th percentiles of
        %the images averaged together
        currentImage = pColor{i, 1};
        %remove gamma
        currentImage = currentImage.^(2.2);
        %gets 80th percentile
        eightyPercentColor = prctile(currentImage, 80));
        %averages both matrixes together through a linear combo of half the
        %value of each element in the two images
        trueConfidence = imlincomb(.5, initialPColorComparison, .5, eightyPercentColor);
        %reassigning value for the recusive loop
        initialPColorComparison = trueConfidence;
    end
    
    %when we leave the for loop we should have one image
    %(trueConfidence) that will be our standard of reference

    %%%%UPDATE ERRORS
    %we don't have an initial confidence
    %1st pass - confidence of i is just light direction([i])
    %confidence is going to be constantly updated by l*n
    [x y z] = size(lights_positions);
    initialConfidence = zeros(x, y, z);
    initialConfidence(:, :, :) = lights_positions(:,:,:);
    error = [];
    confidencesEstimated = [];
    for j = 1:y %taking y to be the number of lights/normals
        if(j == 1)
            confidencesEstimated(1) = initialConfidence;
            error(j) = trueConfidence - confidencesEstimated(1);
        else
        %calculate the lambertian model
        confidencesEstimated(j) =  dot(lights_positions(j), normals(j));
        %below command subtracts the actual color values from our
        %calculated values with the normals and the lighting positions
        error(j) = trueConfidence - confidencesEstimated(j);
        %update our confidence value
        end
    end;
    
    % Need to generate confindences and weighted errors, how do I do that
    % and get them to work together, HOW DOES ERROR ADJUST CONFIDENCE
    % VALUES
    %what do i do with errors now that i have them?
    %when do i estimate confidence with noise? Where does noise fit in?
    
    %update lsq data solve uses eigenvalues 

   
    % Be sure to create a call to a new function LSQ to create your optimizer
    % for solving for the normals  
    
    %%%PLACE SOLVE NORMALS HRE
    [bTerminate, normals, lsqData, pColor] = SolveNormals (lsqData, normals, pColor)
    
    bTerminate =  true;
end