function Normals = CalculateInitialNormals(LightIntens, LightPos) %(I, L)

num_Intensities = length(LightIntens);
num_Positions = length(LightPos);

if(num_Intensities ~= num_Positions)
    disp('something went wrong');
    return;
end


%here is where all matrix math happens
%take transpose of intensities
transpIntensities  = LightIntens.';
%take transpose of light positions
transpLightPos = LightPos.'; 
%multiply position transpose with the light positions
one  = transpLightPos*LightPos;
%multiplies light position transpose with the intensities
two  = transpLightPos*transpIntensities;
bigMatrix  = inv(one)*two; %holds albedo and normal vectos we are solving for
Albedo  = norm(bigMatrix); albedo
Normals  = bigMatrix/Albedo; % N is rormals


end 