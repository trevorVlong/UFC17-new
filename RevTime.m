%finds minimum time for revolution in a circle 
function [trev, N, V] = RevTime(Wplane,Sref,C_L,R,Tmax)
    %uses total plane wight, reference area, lift coefficient, radius of turn, and max thrust
    
    rho = 1.225; %kg/m^3 
        %air density
    g = 9.81; %m/s^2
        %gravity constant
    
    
    denom = 1/2*rho*g*R*Sref*C_L ; 
        %denominator for N
    
    frac = (Wplane/denom)^2; 
        %fraction for N
        
    N = (1-frac)^(-1/2);
        %finds load factor N
        
    V = sqrt(g*R*sqrt(N^2-1)); %m/s
        %finds turning velocity
    trev = 2*pi*R/V; %s
        %revolution time
end