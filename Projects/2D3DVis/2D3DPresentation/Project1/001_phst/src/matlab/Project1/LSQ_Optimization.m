% 
% ----------------------------------------------------------------------
%  
%  Optimization functions for the normals solver
%  To implement the lsq estimator, complete the following functions:
% 
%  Function: LSQ_Optimization
%  Sarting with an inital estimate, detemines per-pixal image confidence values.
%  Initialize the Solver, and then solve for the normals itteratively. Be sure to 
%  come up with the number of iterations you wouldl like to use.
%  
%   %how do you solve for the normals    
% 
% 
%  Function: Iterate
%  There are four primary actions you need to complete diring the estimate
%  1. Examine the images and determine a confidence value
%  2. Solve for the normals  
%  3. Save your estimated results 
% 
%  Function: CollectEstimates: Generate confidence values by examining the intensities
%            int the image. The errors are the deviation of the intensity values from
%            the lambertian shading model.
% 
%  Function LSQ: Create this function to accumulate a least squares optimizer to solve for
%                each normal.
% 
%  Function: Solve: Solves for the surface normals.
% 
% 
%  Function: WriteNormalMap: Write a visualizatio of the normals by maping the normal (nx, xy, nz) values
%                            to the image (r, g, b) values.
% 
% -----------------------------------------------------------------------------


% This is the main function for the least square operation. It continually estimates the normal
% values by building a least square accumulator.
%
% 
function [normals] = LSQ_Optimization(path, lights_positions, lights_brightness,fnames_radianceMaps, w, h)
    %INputs:
    %path - path names
    %lights_positions - lights positions in a matrix
    %lights_brightness - light brightness in a matrix
    %fnames_radianceMaps - file names? as strings?
    %w - width
    %h - h
    
    % initialize the optimization by producing the first estimate
    %%^how and what
    % determine the number of iterations you would like to complete for your optimize
    % ^lets do 6
    % you can simply pick the number of iterations or use the data in to select this number
  
    %HOW DO I IMPLEMENT LSQ?
    %lightbrightness = cos(theta) = normal vector dot surface vector
    %given lightbrightness, given the position ie surface vector, how do you solve for n?
    
    % load the first color image as a initial estimate
    I = imread(fnames_radianceMaps{1,1});
   
    
    % gamma correction 
    rChannel = I(:,:,1);
    gChannel = I(:,:,2);
    bChannel = I(:,:,3);
    
    newRChannel = rChannel.^(2.2);
    newGChannel = gChannel.^(2.2);
    newBChannel = bChannel.^(2.2);
    
    newGammaLessImage = cat(3, newRChannel, newGChannel, newBChannel);
    %should be the new gamma-less image 
   
    % now iteratively re-estimate
   [normals]  =  Iterate(fnames_radianceMaps, lights_positions, lights_brightness, newGammaLessImage);
    %i replace I with the new image
end
