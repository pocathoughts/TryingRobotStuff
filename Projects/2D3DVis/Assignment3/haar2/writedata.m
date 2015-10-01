function [] =  saveGrad(data, datafile)

[h, w] = size(data);
npixels = h*w;


fid1 = fopen(datafile, 'w');
if (fid1 < 0)  
    error(sprintf('could not open file %s', datafile));
end


fprintf(fid1, '%d\n %d\n', h, w);
for i = 1:w
    for j = 1:h
        fprintf(fid1, '%g\n', data(i, j));  
    end
end

fclose(fid1);