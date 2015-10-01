% // IMPLEMENT YOUR CODE HERE
% // Write normal map
function [] = WriteNormalMap(fnameOut_n, normals, w, h)

%     // use a for loop
%     // for each normal in the normals vector, store the float in the
%     // corresponding pixel location of the image buffer
newImage = zeros(h, w, 3);

    %%can i do this instead of a for loop?
newImage(:,:,:) = normals(:,:,:);
%     for i = 1:h
%         for j = 1:w
%             newImage(i,j,:) = normals(h, w, :);
%         end
%     end


%save the results
imwrite(newImage,fnameOut_n);
 
end
