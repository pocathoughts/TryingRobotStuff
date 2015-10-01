% // loads a list of points stored as floating point triplets
% // the first entry is the number of triplets in the file
function[] = LoadVectorLPt3Dist(fname, data)
    f = fopen(fname, 'r');
    if(f ~= -1) 
        fscanf(f, '%g', npts);
        data = (npts, 3);
        for(int i = 0; i < npts; ++i) {     
            fscanf(f, '%g %g %g', px, py, pz);
            data(i, :) = p;
        fclose(f);
        end
    end
end
