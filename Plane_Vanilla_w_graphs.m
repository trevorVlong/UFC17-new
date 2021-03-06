%Plane Vanilla 

%Payload
    str = load('Master_Constant.mat');
    C_L = str.C_L;
    
    c_l0 = .8;
    c_d8 = 1.0;
    c_d2 = .02;
    c_d1 = -.004;
    c_d0 = .020;

    c_d = c_d0+c_d1*(C_L-c_l0)+c_d2*(C_L-c_l0)^2+c_d8*(C_L-c_l0)^8;
    
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
    [W_pay, CdCl, CD] = Payload(str.CDA_0,c_d,S,str.C_L,AR, W_body,str.e,T);
        %finds payload weight, drag coeff, and drag in terms of AR and S, along with constrained
        %values
    W_pay = double(W_pay);
        %converts answer to decimal instead of fraction
    V_wmax = sqrt(2*T/(1.225*S*CD));
    
    ARlin = linspace(0, 20, 1000);
    Slin = linspace(0,1,1000);
            
            
    
    
    
    
%Tip Deflection
    [delta, M0, I0] = WingBend(str.E,str.tau,str.epsilon,str.c_t,str.c_r,AR,S,str.N,str.W_fuse,W_pay);  
        %gets Moment, Bending inertia, and deflection of wingtip
    
    d_span = double(delta/str.b); 
        %gets tip-deflection to wingspan ratio
    
%Constrained Solving

%Bending-Constrained d_span2 >= .1 C_L = .8

    d_spand = .1 ; 
    N = 1;
        %load factor
        %tip deflection ratio
    [Wpay_tc,delta1,M01] = defweight(I0,N,d_spand,AR, S ,str.lambda,str.W_fuse);
        %returns bending-constrained payload, tip deflection, and Moment
     WplaneBC = W_body +Wpay_tc;
     Tbc = N*CD/C_L*WplaneBC;
     V_bc = sqrt(2*Tbc/(1.225*S*CD));
     d_spanlin = [];
     Wpayvlin = [];
     T_vlin = [];
     for T_v = linspace(0,1,1000)
        Wpayv = Payload(str.CDA_0,c_d,S,str.C_L,AR, W_body,str.e,T_v);
        d_spanv = WingBend(str.E,str.tau,str.epsilon,str.c_t,str.c_r,AR,S,str.N,str.W_fuse,Wpayv)/sqrt(AR*S);
        d_spanlin = [d_spanlin d_spanv];
        Wpayvlin = [Wpayvlin Wpayv];
        T_vlin = [T_vlin T_v];
     end
     figure(1)
     plot(T_vlin,Wpayvlin)
     figure(2)
     plot(T_vlin,d_spanlin)
     
     plotConstrainedWpay(T_vlin,Wpayvlin,d_spanlin,.1)
     plot(linspace(1,1,100),linspace(:))
% bending constrained time to turn in a 12.5m circle (delta/b = .1, Wpay =
% 0 C_L = .8

    
    R = 12.5; %meters
        %payload weight for plane
    W_uplane = double(W_wing)+double(str.W_fuse);
    
        %Total plane weight
    [trev ,N ,T] = RevTime(W_uplane,AR,S,str.C_L,R,CD);
        %revolution time
   
    
    