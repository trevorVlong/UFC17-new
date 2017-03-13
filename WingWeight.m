%Wing Mass calculator function of density, avg chord, and wingspan
function [W_wing,W_body] = WingWeight(rho, c, tau , AR,S, W_fuse)
    
    syms x
    
    b = sqrt(AR*S);
    
    g = 9.81; %m/s^2
    
    V_wing = 2*int(.6*c^2*tau,x,0,b/2); %cross sectional area
    
    W_wing = rho*g* V_wing; % rho*A*b*9.81; %integral (technically)
    
    W_body = W_wing+W_fuse; % W_fuse+W_wing; %finds total plane body mass
end    