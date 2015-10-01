% ----------------------------------------------------------
%  This is the main function for your program - photoStereo.exe
%  It parses the input data and calls a set of functions 
%  for each part of the assignment. Read through the code, 
%  understand it well and fill in the missing components.
%  Be sure to comment your code!!!
% 
%  System Input: mode, pathtodata
% 
%    mode: 0, 1, or 2 
%           Geting started: image manipulation, mode 0
%           Geting started: image debugNormals, mode 1
%           Compute normals: mode 2
%    pathtodata
%           path to the input data
% 
% 
%  for example: 
% 
%  photoStereo.exe 0 ../../../data/normals_test
%  photoStereo.exe 1 ../../../data/debug_test
%  photoStereo.exe 2 ../../../data/pillow
% 
% 
% 
%  Sytem output for mode 0:
%       A normal map  ./results/normals.jpg
%       A combined normal and color map ./results/normColor.jpg
%  Sytem output for mode 1:
%       A normalmap ./results/debug_normals.jpg
%  Sytem output for mode 2:
%       A normalmap ./results/pillow_normals.jpg
% ---------------------------------------------------------
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function [] = phst(mode, path)

                          

% Geting started: image manipulation, mode 0
% Geting started: image debugNormals, mode

    if(mode == 0) 
        VisualizeNormals(path);
    else if(mode == 1) 
        DebugNormals(path);
    else if(mode == 2)
        ComputeNormals(path);
        else if((mode > 3) || (mode < 0))
            display(sprintf('Invalid input. Mode %d is invalid\n', mode));
            end  
        end
        end
    end
        
