function [] = normalize_channels( s_channel, v_channel )
%%this funciton was an attempt to normalize histograms to 
%make the weighted region mask but sadly I couldnt get it to work

s_normal = imhist(s_channel)./numel(s_channel);
v_normal = imhist(v_channel)./numel(v_channel);
figure,
imagesc(s_normal); title('sc norm');
figure, imshow(s_normal), title('s_norm');

disp('hey')
figure, imshow(v_normal), title('v_norm');
end

