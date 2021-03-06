%finds minimum time for revolution in a circle 
function [trev, N, T] = RevTime(Wplane,AR,S,C_L,R,C_D)
    %uses total plane wight, reference area, lift coefficient, radius of turn, and max thrust
    b = sqrt(AR*S);
    rho = 1.225; %kg/m^3 
        %air density
    g = 9.81; %m/s^2
        %gravity constant

    
    denom = 1/2*rho*g*R*S*C_L;  
        %denominator for N
    
    frac = (Wplane/denom)^2;
        %fraction for N
        
    N = (1-frac)^(-1/2);
        %finds load factor N
        
    V = sqrt(g*R*sqrt(N^2-1)); %m/s
        %finds turning velocity
        
    T = 1/2 * rho *V^2*S*C_D;
    trev = 2*pi*R/V; %s
        %revolution time
end