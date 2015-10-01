% // IMPLEMENT YOUR CODE HERE
% // Write normal map
function [] = WriteNormalMap(fnameOut_n, normals, w, h, iteration)

%     // use a for loop
%     // for each normal in the normals vector, store the float in the
%     // corresponding pixel location of the image buffer
    newImage = zeroes(h, w, 3);

    %%can i do this instead of a for loop?
    newImage(:,:,:) = normals(:,:,:);
%     for i = 1:h
%         for j = 1:w
%             
% %             p(i,j,:) = [0.2 0.4 0.5];
%             newImage(i,j,:) = normals(h, w);
%         end
%     end

%   save the results
%   should the first input to imwrite be fnameOut_n?
    for i = 1:iteration
        %writes an imdividual name that is numbered for each normal map
        imwrite(newImage,['Normal Map ',num2str(i),'.jpg']);
    end
end
