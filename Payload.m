%Objective Function for Payload weight in terms of 
% loads planform area, Aspect Ratio, fuselage drag, lift coefficient, 2d drag?, efficiency, fuselage and
% wing weights, and max Thrust
    MASTER_CONSTANT;
    syms x
    
    
 %Payload Calculations
    c_avg = Cavg(b, c_function); %average chord length
    S = Splan(c_avg,b); %planform area
    AR = AsRa(b, S); %aspect ratio
    W_wing = Wingmass(rho,c_avg,tau,b); %wing weight (N)
    W_body = W_wing+W_fuse; %aircraft frame weight (N)
    
    W_pay = (T_max)/(((CDA_0)/S)/(C_L)+(c_d)/(C_L)+(C_L)/(pi*AR*e))-W_body;
    %Gets payload 
    W_pay = round(double(W_pay),4); %payload (N)
    
 %Tip Deflection
    t_r = tau*c_avg;
    h_r = epsilon*c_avg;
    M_0 = Wing_Moment(lambda,N,W_fuse,W_pay,b);
    I_0 = WingInertia(c_avg,t_r,h_r,lambda);
    kappa = M_0/(E*I_0);
    
    delta = 1/2*kappa*(b/2)^2;
    
    delta = double(delta);
    
    delrat= (delta)/b;
    
