function pMatrix = make_Perm_Matrix(cols)
    %%%This function makes the Permutation matrix
    %%thank you wikipedia for the help

    identityM = eye(cols);
    pMatrix = zeros(cols, cols);
    
    %does odd or even matter if it goes first?
    evenNums = 2:2:cols;
    pMatrix(cols/2 + 1:cols,:) = identityM(evenNums, :);
    
    oddNums = 1:2:cols;
    pMatrix(1:cols/2, :) = identityM(oddNums, :);

end