function [cA, cH, cV, cD] = getHaarCoeffs(img)
%using the matlab function to get the coefficients of the different aspects
%of the decomposition
[cA,cH,cV,cD] = dwt2(img,'haar')
end