
% loads parameters from a lighting file
% light positions, light intensity, and the name of the corresponding radiance map
function [lights_positions, lights_intensities, fnames_radianceMaps, w, h ]= LoadLights(path, fname)
    f = fopen(fname, 'r'); %what would fname be?
    if(f ~= -1)
        M = fscanf(f, '%d'); %reads in whatever is the first argument, converts to second arg
        w = M(1,1);     %d is a base ten signed integer, WHY DOES THAT MATER?
        h = M(2,1);   %what is this doing?
        num = M(3,1);
        lights_intensities = zeros(num, 1); %makes an array of numX1 zeroes
        lights_positions = zeros(num, 3);
        lights_intensities = double(lights_intensities); %cast intensities as doubles
        M = textscan(f,'%f %f %f %f %s ');
        lights_positions(1:num, 1) = M{1}; %y = {1, 'a', x}; #% cell array storing a number, a character, and 1x3 matrix
        lights_positions(1:num, 2) = M{2}; %A cell array is a data type with indexed data containers, can hold different types
        lights_positions(1:num, 3) = M{3};  
        lights_intensities(1:num, 1) = M{1, 4, :};
        fnames_radianceMaps = M{1, 5, :};
        fclose(f);
        
        for i=1:num
            fnames_radianceMaps{i} = [path  '/color/' fnames_radianceMaps{i,1}];
        end
    end
    
end
