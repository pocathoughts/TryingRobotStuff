%returns the max of three color channels
function [v] =  maxval(r, g, b)
    v = (max(max(r, g), b));
end