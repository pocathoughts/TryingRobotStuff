function[Solution]=davidlopezcas_HW3(coeffs)
lc=length(coeffs)
if lc<2 || lc>4
    disp('Invalid polynomial! Please provide a valid polynomial up to order 3!');
    return
end 
polyOrder= lc-1;

disp('Given Polynomial: ')

for i=1:(lc-1)
    fprintf('%dx^%d + ',coeffs(i),polyOrder-(i-1));
end 
fprintf('%dx^%d \n',coeffs(lc),polyOrder-(lc-1));


disp('Polynomial Derivative: ')
de=zeros(1:polyOrder-1);
for i=1:polyOrder
    de(i)=coeffs(i).* polyOrder-(i-1);
    fprintf('%dx^%d + ',de(i),polyOrder-1-(i-1));
end



x_1=0;
tol = 1e-06;
Solution=0;
iter = 100;

disp('Found Solution: ')
for i=1:iter;
    x_2= x_1 -polyval(coeffs,x_1)./polyval(de,x_1);
    x_1=x_2;
    if abs(x_2 - x_1)/abs(x_1)< tol
        Solution=x_2;
        fprintf('%d',Solution);
        break
    end
end
    if Solution == 0
        disp('Maximum iterations reached, solution not found!');
    end
        