function [solution] = HW3( coeffs )
% Give solution an invalid value to start
solution = NaN;

% Check that the function received the correct number of arguments for the polynomial
numOfCoeffs = length(coeffs);
if ( numOfCoeffs < 2 || numOfCoeffs > 4)
    disp('Invalid polynomial! Please provide a valid polynomial up to order 3!');
    return;
end

% Set the polynomial order
polynomialOrder = numOfCoeffs-1;

% We need to print the original polynomial to the command prompt
fprintf('Given Polynomial: ');
for ii = 1:polynomialOrder+1
    fprintf('%dx^%d',coeffs(ii),polynomialOrder-(ii-1));
    if (ii ~= polynomialOrder+1)
        fprintf(' + ');
    end
end
disp(' ');

% We also need to print its derivative to the command prompt
derivative = zeros(1,polynomialOrder-1);
fprintf('Polynomial derivative: ');
for ii = 1:polynomialOrder
    derivative(ii) = (coeffs(ii)*(polynomialOrder-(ii-1)));
    fprintf('%dx^%d',derivative(ii),polynomialOrder-1-(ii-1))
    if (ii ~= polynomialOrder)
        fprintf(' + ');
    end
end
disp(' ')

% Variable declerations for our program
guess = 0; nextGuess = 0; epsilon = 1e-6; tolerance = 1e-6;

% The main loop to calculate Newton's Method
for iterations = 1:100
    % Calculate y and y_prime based on the current guess, students can use
    % polyval if they want!
    y = polyval(coeffs,guess);
    y_prime = polyval(derivative,guess);
    % Extra check which students don't have to do...
    if (abs(y_prime) < epsilon)
        disp('Solution not found!');
        return;
    end
    % Newton's method
    nextGuess = guess - y/y_prime;
    % Did we find a solution?
    if (abs(nextGuess-guess)/abs(nextGuess) < tolerance)
        % Display the solution to the user
        fprintf('Found solution: %f \n',nextGuess);
        % Return the solution to the calling process
        solution = nextGuess;
        return;
    end
    % Update the guess and iteration count
    guess = nextGuess;
end
% We never found a solution!
disp('Maximum iterations reached, solution not found!');
end

