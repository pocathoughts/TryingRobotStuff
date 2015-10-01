userGuess = input('Please enter a value in the Fibonacci sequence: ');
n(1)=1;
n(2)=1;
k=3;
while userGuess>n(k-1);
    n(k) = n(k-2)+n(k-1);
    k=k+1;
end
if userGuess == n(k);
    fprintf('%d is a Fibonacci number!', userGuess);
elseif userGuess<0;
    fprintf('%d is a negative number and cant be in the Fibonacci sequence!', userGuess);
elseif userGuess == 0
    disp('0 is a Fibonacci number!')
elseif userGuess < n(k)
        fprintf('%d is not a Fibonacci number.\n The valid numbers around %d are %d and %d', userGuess, userGuess, n(k),n(k+1))
elseif userGuess > n(k)
        fprintf('%d is not a Fibonacci number.\n The valid numbers around %d are %d and %d', userGuess, userGuess, n(k-1),n(k))
end