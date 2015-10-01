function [] =  haar2all(indir, outdir, ext)

mkdir(outdir, 's');

files = dir(indir);
[numfiles, X] = size(files);


% initialize a large list of all the discontinuities
for i = 1:numfiles
    msg = sprintf('i: %d\n', i);
    display(msg);
    fname = files(i, 1).name;
    if(files(i,1).isdir == 0) 
        [pathstr, name, extlocal] =  fileparts(fname);
        if ((strcmp(['.' ext], extlocal)))
            outpath = [outdir '\' name];
            if exist(outpath, 'dir')
                rmdir([outpath], 's');
            end
            mkdir(outpath, 's');
            filein =  [indir  filesep fname];
            fileout = [outpath filesep fname];       
            haar2_(indir, outpath, name, ext);
        end
    end
end

display('DONE - haar2_all');
