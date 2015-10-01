
function [v]=haarnorm(im, nr, nc)

len = nr * nc;
vec = reshape(im, len, 1);
maxvec = max(vec);
vec = vec ./ maxvec;
v = reshape(vec, nr, nc, 1);

            
            

