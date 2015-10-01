function [weightMask] = makeWeightedRegion(img)
    %function is supposed to make the weighted region as described
    %by section 3.1 in the research Paper
%     disp('this is norms');
%     disp(norm_s);
%     disp('this is s_channel');
%     disp(s_channel);
%     
%     [r, c, p] = size(img)  
%     
%     %%Making W_s first
%     W_s = uint8(zeros(r, c, p));
%     W_s(:,:,:) = 1 - exp(norm_s(:,:,:) * abs(s_channel(:,:,:) - 1));
%     
%     %making W_v 
%     W_v = uint8(zeros(r, c, p));
%     W_v(:,:,:) = 1 - exp(norm_v(:,:,:) * abs(v_channel(:,:,:) - 1));
%     
%     S%making the final images
%     W_final = W_s * W_v;
    
%%%%%I ENDED UP USING MATLAB FUNCTIONS TO GET SIMILAR RESULTS%%%%%
    logical = getLogicalMask(img);
    
    [rl cl pl] = size(logical)
    [r c p] = size(img)
    if rl ~= r || cl ~= c
        logical = imresize(logical, r, c);
    end
    
    img_v = img(:,:,3);

    weightMask = graydist(img_v, logical);
end