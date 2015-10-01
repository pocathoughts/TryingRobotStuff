function [] = getZgraph(original_img, smoothed_img, bumpy_img)

origZ = get
imshow(img2), title('monst6');
% 
% [r c] = size(img2);
% img = imresize(img, [r c]);
% C = imfuse(img,img2,'falsecolor','Scaling','joint','ColorChannels',[1 2 0]);
% imwrite(C, 'combBumpText.jpg');
% figure, imshow(C);
% C = imfuse(img,img2,'falsecolor','Scaling','joint','ColorChannels',[1 2 0]);
% figure, imshow(C);
% 
% imwrite(C, 'realModelPrintedBumpySim.jpg');
% img = imread('monster6.jpg');
% img = img(:,:,3);
% % plot(import);
% figure, imshow(img);
% imwrite(img, 'ZvalimageObject.jpg');
% 
% bw = edge(img, 'Canny');
% figure, imshow(bw);
% % legend('Location 1','Location 2','Location 3',2)
% xlabel('Time'), ylabel('Vehicle Count')
% title('Traffic Counts at Three Intersections')
% 
% h_im = imshow(img);
% e = impoly(gca,[55 10 120 120]);
% BW = createMask(e,h_im);
% figure, imshow(BW);