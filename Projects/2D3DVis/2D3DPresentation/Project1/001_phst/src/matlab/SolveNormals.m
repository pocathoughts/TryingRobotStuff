% Implement Solver
function [bTerminate, normals, lsqData, pColor] = SolveNormals (lsqData, normals, pColor)
    %lsqData - lsq stuff
    %normals - normal values
    %pColor - pColor
    %lsq data with rgb values  %other lsq are r g b chennel
    
    %Goal is to get a normal vector 
    %%EIGEN Vector VALUE GOES HERE AND USES INFO FROM LSQ
    %eigen value sorted smalllest to largest
    %this is wehre you do the eigne vecotrwith lsq data and color
    %eigen returns left and right column matrices and the diagonal
    %not entirely sure, think that values in diagonals are the normal
    %values we need
    
    %tried to understand eigen vector decomposition but with litte to no
    %luck. This is the spot that held me up the most but I think I knew how
    %to go about it, just not how to implement it
    

end