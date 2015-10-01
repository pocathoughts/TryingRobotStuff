%returns the minimum of three color channels
function [v] =  minval(r, g, b)
    v = (min(min(r, g), b));
end

%this is supa easy porque