%AR, S design Space solver
%solves for AR, S and other dependents

function [AR, S, cavg] = ARSspace(c_t,c_r, b)
    
    cavg = (c_t+c_r)/2; %solves for average chord length
    
    S = cavg*b; %gets planform area of wing
    
    AR = (b^2)/S; %gets aspect ratio of wing
end
    
    