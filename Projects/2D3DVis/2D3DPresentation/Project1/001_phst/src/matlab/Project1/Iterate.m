% IMPLEMET CODE HERE
% now continually re-estimate your normal maps using your optimizer
% for each input image, compute
% then find the normals
% be sure to write your normal map with a unique name after each estimation
function [normals] = Iterate (fnames_radianceMaps, lights_positions, lights_brightness, pColor)

    [h,w,nch] = size(pColor);
    [num, XX] = size(fnames_radianceMaps);
    
    normals = 0;
   
    % create lparams structure here for optimizer lsqData
    %%INSERT LSQU OPTIMIZER
    field1 = 'alpha';  value1 = zeros(3);
    field2 = 'l';  value2 = zeros(3, 1);
    field3 = 'b';  value3 = zeros(3,1);
    field4 = 'bb';  value4 = zeros(3,1);

    lsqData = struct(field1,value1,field2,value2,field3,value3,field4,value4);
   
    numRounds = 74; %double number of images there are in the set (for pillows there are 37

    
    % Now iteratively re-estimate
    for curIt = 1:numRounds
        % clear your lparams in lsqData
        bTerminate = 0; %%%%%%%%WHAT IS BTERMINATE%%%%%%%%%%%%

        for  i = 1:numRounds
            % insert code here to call CollectEstimates
            % remember to check for terminating conditions
            fname = fnames_radianceMaps{i, 1};
            [bTerminate, normals, lsqData, pColor] = CollectEstimates(curIt, lsqData, fname, lights_positions, lights_brightness, normals, pColor);
        end
    end

    
    %%eigen value decomposition
    
    %inital estimate is what collect estimates returns
    
        % solve for the normals
        %[normals, lsqData, pColor] = SolveNormals(lsqData, normals, pColor);
%for loop names -> collct estimates
%solve for normals
        
        
        %imwrite(
     for i = 1:curIt
         WriteNormalMap(fnameOut_n, normals, w, h, i)
        % insert code here to write a unique normal map for each iteration
     end
end