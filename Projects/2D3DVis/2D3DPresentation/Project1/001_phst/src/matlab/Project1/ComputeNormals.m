% computes the normal maps using a linear least square optimization
% You must implement the LLOptimization function
function [] = ComputeNormals(path)
    fpath_color = [path '/color'];                          % path to color files
    fname_out = ['../../../results/pillow_normals.jpg'];           % path to normal files
    fname_lights = [path '/'  'lights/lights.data'];            % light orientation data

    w = 0;  % width image
    h = 0;  % height image

    % load the light data
    [lights_positions, lights_brightness, radianceFNames, w, h] = LoadLights(path, fname_lights);

    % run the optimization
    [normals] = LSQ_Optimization(path, lights_positions, lights_brightness, radianceFNames, w, h);

    % save the result file
    WriteNormalMap(fname_out, normals, w, h);
end 
