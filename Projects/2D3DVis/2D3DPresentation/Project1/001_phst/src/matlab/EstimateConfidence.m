function confidence = EstimateConfidence(confidences, pColor, errorR, errorG, errorB, normals)
   [rows cols] = size(pColor);
   %since we made pColor iwth 80 percentile, im going to say 80% confident
   %confidence values range from 0 to 1 and assing value of .8
   
   %initialize image
   confidenceIMG = zeros(rows, cols);
   
   %set to .8
   confidenceIMG(:,:) = .8;
   
   %YAY NOW WE HAVE AN INIITAL CONFIDENCE FOR OUR IMAGE
   
    errorIMG = cat(3, errorR, errorG, errorB);
    
    [ex ey] = size(errorIMG);
    %could dividing errors by 255 do anything?
    
    errorIMG = errorIMG(:,:) / 255;
    %normals should hold however many images there are in normal form
    %this is our inital normals to be optimized by the optimizer
    
    %how does confidence affect normals though?
    %error / 255 confidence is 1 - that number 
    errorIMG = 1 - errorIMG(:,:);
    newConfidenceIMG = errorIMG;
    
end   

%  I'm not sure how to go about adding weights to confidences using the
%  noised image
%   I looked up all I could about the twinkle algorithm, couldn't find goo
%   enough source to implement it



%notes from office hours
%     %error we computed in update errors with confidences to update lsq data
%     %a value (look at file) computing errors we have a set of errors
%     %tracking each channel is off form ideal
%     
%     %how do we calculate confidencee %do separatley for each channel 
%     %normalize normals
%     
%     %every value is 0 -1 
%     
%     for num of pixels 
%         
    %noisyPColor = imnoise(pColor,'salt & pepper');
%             add weight to that and give it a confidence
%             max intensity at i for this p color
%             confidence  = max /by noise make sure noise is always the inimum value
%             confidence[i]  1-max/greaternoise);/2 * noise
%             
%             %%confidence i = squrt(rmax(rgb at i) for p color) < = 1
%             confidence = squre(1 - (mas(rgb)/wxnosie) <= 1.0
%     confidence at i = 
%             end
%             
%     error deviation between dot product and confidence
%     
%     %%%Make update error, print imwrite predicted imwrite color
%     imwrite(diff)