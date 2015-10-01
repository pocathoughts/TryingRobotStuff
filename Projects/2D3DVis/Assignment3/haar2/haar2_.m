function [] =  haar2(indir, outpath, basename, ext)


infile = [indir '\' basename '.' ext];




v=imread(infile);
v=rgb2gray(v);

[row col] = size(v);
inp=v;

op=zeros(col,row);
while(col>64)
len=0;
    while(len<2)
for j=1:row
    for i=0:col/2-1
    display(sprintf('i %d, col %d, j %d\n', i, col, j)); 
    op(j,i+1)=(v(j,floor(2*i+2))+v(j,floor(2*i+1)))*.5;
    op(j,floor(col/2+i+1))=(v(j,floor(2*i+1))-v(j,floor(2*i+2)))*.5;
    end
end

v=op';
len=len+1;
    end
col=col/2;
row=row/2;

v=op';
end

[nr, nc] = size(v);
x1start =  1;
x1end   =  (nr/2);
y1start =  1;
y1end   =  (nc/2);
x2start =  (nc/2) + 1;
x2end   =  nr;
y2start =  1;
y2end   =  nr/2;
x3start =  1;
x3end   =  (nc/2);
y3start =  (nr/2) + 1;
y3end   =  nr;
x4start =  (nc/2) + 1;
x4end   =  nc;
y4start =  (nc/2) + 1;
y4end   =  nc;



h_orig = zeros(nr/2, nc/2);
h_orig(:, :) = v(x1start:x1end, y1start:y1end);


h_H = zeros(nr/2, nc/2);
h_H(:, :) = v(x2start:x2end, y2start:y2end);
h_H2 = doubleToImg(h_H);
h_H3 = haarnorm(h_H, nr/2, nc/2);

h_V = zeros(nr/2, nc/2);
h_V(:, :) = v(x3start:x3end, y3start:y3end);
h_V2 = doubleToImg(h_V);
h_V3 = haarnorm(h_V, nr/2, nc/2);

h_D = zeros(nr/2, nc/2);
h_D(:, :) = v(x4start:x4end, y4start:y4end);
h_D2 = doubleToImg(h_D);
h_D3 = haarnorm(h_D, nr/2, nc/2);


figure(1);
imshow(uint8(v));

figure(2);
imshow(h_orig);


figure(3);
imshow(h_H);

figure(4);
imshow(h_V);


figure(5);
imshow(h_D);

figure(6);
imshow(h_H2);

figure(7);
imshow(h_V2);

figure(8);
imshow(h_D2);


imwrite(uint8(v), [outpath '\' 'haar_all' '.' ext]);
imwrite(h_orig, [outpath '\' 'haar_orig' '.' ext]);

imwrite(h_H,  [outpath '\' 'haar_H' '.' ext]);
imwrite(h_H2, [outpath '\' 'haar_H2' '.' ext]);
imwrite(h_H3, [outpath '\' 'haar_H3' '.' ext]);

imwrite(h_V,  [outpath '\' 'haar_V' '.' ext]);
imwrite(h_V2, [outpath '\' 'haar_V2' '.' ext]);
imwrite(h_V3, [outpath '\' 'haar_V3' '.' ext]);

imwrite(h_D,  [outpath '\' 'haar_D'   '.' ext]);
imwrite(h_D2, [outpath '\' 'haar_D2'  '.' ext]);
imwrite(h_D3, [outpath '\' 'haar_D3'  '.' ext]);

%be sure to save the values WITHOUT SCALING that 
% was applied for it to be viewed
writedata(h_H, [outpath '\' '_data_haar_H' '.txt']);
writedata(h_V, [outpath '\' '_data_haar_V' '.txt']);
writedata(h_D, [outpath '\' '_data_haar_D' '.txt']);
writedata(h_orig, [outpath '\' '_data_haar_orig' '.txt']);

