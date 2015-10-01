function hMatrix = make_Haar_Matrix(cols)
    %%this function makes the Haar matrix to be combined
    %with the permutation matrix
    wave_kernel = [1 1; 1 -1];
    hMatrix = (1/sqrt(2)) .* kron(eye(cols/2), wave_kernel);
end