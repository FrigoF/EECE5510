% twosover - twos complement overflow function
% Example 8.14 - p 464 Blandford and Parr
% 
% F. Frigo  10-Nov-2020
% Marquette University
%
function s = twosover(x)
    for i = 1:length(x)
    if (x(i)>=1)
        x(i) = x(i) - 2;
    else
        if (x(i) < -1)
            x(i) = x(i) +2;
        end
    end
    s = x;
end