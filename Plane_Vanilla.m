%Plane Vanilla 

%Payload
    str = load('Master_Constant.mat');
        %contains all constants from primary doc, can be changed
        
    [AR, S, cavg] = ARSspace(str.c_t,str.c_r,str.b);
        %finds Aspect Ratio, Planform area, and average chord length
        
    [W_wing,W_body] = WingWeight(str.rho, str.c_function, str.tau, AR,S , str.W_fuse);
        %finds Wing weight and Plane body weight
    %%%% Make a new function to create the parts for this
    W_payd = ((((str.CDA_0)/S)/(str.C_L))+(str.c_d)/(str.C_L)+(str.C_L)/(pi*AR*str.e));
    
    
    W_pay = str.T_max/(W_payd)-W_body;
        %finds payload weight in terms of AR and S
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
    [Wpay_tc1,delta1,M01] = defweight(I0,N,d_spand,AR, S ,str.lambda,str.W_fuse);
        %returns bending-constrained payload, tip deflection, and Moment
    d_spand2 = .05;
    [Wpay_tc2,delta2,M02] = defweight(I0,1,d_spand2,AR, S,str.lambda,str.W_fuse);
        %bending-constrained payload for delta/b_max = .05
    d_spand3 = .15;
    [Wpay_tc3,delta3,M03] = defweight(I0,1,d_spand3,AR,S,str.lambda,str.W_fuse);
        %bending-constrained payload for delta/b_max = .05
        
        
  % here is a stupid ass comment      
% bending constrained time to turn in a 12.5m circle (delta/b = .1, Wpay =
% 0 C_L = .8
 
    R = 12.5; %meters
    Wpay_tr = 0;
        %payload weight for plane
    W_plane = W_wing+W_body + Wpay_tr;
    
        %Total plane weight
    [trev ,N ,V] = RevTime(W_plane,S,str.C_L,R,str.T_max);
        %revolution time
    
    
    
    