%Wing bending --returns delta, M_0, and I_0

%inputs are Payload, Fuselage Weight, root and tip chords, load ratio and
%wingspan
function [delta, M_0, I_0] = WingBend(E,tau, epsilon, c_t,c_r, AR,S, N, Wfuse, Wpay)
b = sqrt(AR*S);

lambda = c_t/c_r; 
    %finds taper ratio

M_0 = (1/12)*(1+2*lambda)/(1+lambda) * N * (Wfuse + Wpay) * b; 
    %moment in N/m

I_0 = .036*c_r^4 * tau*(tau^2 + epsilon^2); 
    % Cross-sectional inertia

kappa_0 = (M_0)/(E * I_0); 
    %curvature

delta = (1/2)* kappa_0*(b/2)^2 ;
    %tip displacement delta (m)
    
end