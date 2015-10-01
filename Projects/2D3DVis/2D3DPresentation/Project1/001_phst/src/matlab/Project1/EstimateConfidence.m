function confidence = EstimateConfidence(confidences, pColor)
    %confidence is size of pColo(num of pixels)
    noisyPColor = imnoise(pColor,'salt & pepper');
    
    for num of pixels 
        
            add weight to that and give it a confidence
            max intensity at i for this p color
            confidence  = max /by noise make sure noise is always the inimum value
            confidence[i]  1-max/greaternoise);
            
            %%confidence i = squrt(rmax(rgb at i) for p color) < = 1
            confidence = squre(1 - (mas(rgb)/wxnosie) <= 1.0
    confidence at i = 
            end
            
    error deviation between dot product and confidence