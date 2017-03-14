%Plane Vanilla 

%Payload
    str = load('Master_Constant.mat');
        %contains all constants from primary doc, can be changed
        
    [AR, S, cavg] = ARSspace(str.c_t,str.c_r,str.b);
        %finds Aspect Ratio, Planform area, and average chord length
        
    [W_wing,W_body] = WingWeight(str.rho, str.c_function, str.tau, AR,S , str.W_fuse);
        %finds Wing weight and Plane body weight
    %%%% Make a new function to create the parts for this
    W_wing = double(W_wing);
    W_body = double(W_body);    
        %makes both these values doubles since they come out as fractions
        
        T = str.T_max;
    [W_pay, CdCl, CD] = Payload(str.CDA_0,str.c_d,S,str.C_L,AR, W_body,str.e,T);
        %finds payload weight, drag coeff, and drag in terms of AR and S, along with constrained
        %values
    W_pay = double(W_pay);
        %converts answer to decimal instead of fraction
    
    
%Tip Deflection

    [delta, M0, I0] = WingBend(str.E,str.tau,str.epsilon,str.c_t,str.c_r,AR,S,str.N,str.W_fuse,W_pay);  
        %gets Moment, Bending inertia, and deflection of wingtip

    d_span = double(delta/str.b); 
        %gets tip-deflection to wingspan ratio
    
%Constrained Back-solving

%Bending-Constrained d_span2 >= .1 C_L = .8

    d_spand = .1 ; 
    N = 1;
        %load factor
        %tip deflection ratio
    [Wpay_tc,delta1,M01] = defweight(I0,N,d_spand,AR, S ,str.lambda,str.W_fuse);
        %returns bending-constrained payload, tip deflection, and Moment
        
       
% bending constrained time to turn in a 12.5m circle (delta/b = .1, Wpay =
% 0 C_L = .8
    
    R = 12.5; %meters
        %payload weight for plane
    W_uplane = double(W_wing)+double(str.W_fuse);
    
        %Total plane weight
    [trev ,N ,T] = RevTime(W_uplane,AR,S,str.C_L,R,CD);
        %revolution time
    
    
    
    