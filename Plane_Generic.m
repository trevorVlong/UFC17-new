



%Plane program
N = 1;
T = .7;
R = 12.5;
const = load('Master_Constant.mat');
    %uploads constants from mat files
    
%geometric values
    [AR, S, cavg] = ARSspace(const.c_t,const.c_r,const.b);
    
     AR = 11;
     S = .25;
        %outputs Aspect ratio, reference area, and average chord
    [Wwing,Wbody] = WingWeight(const.rho,const.c_function, const.tau,AR,S,const.W_fuse);
        %outputs the wing weight and the generic body weight of the plane
    Wwing = double(Wwing);
    Wbody = double(Wbody);
        %converts to floats
%payload
    
    [Wpay,CD,D] = Payload(const.CDA_0,const.c_d,S,const.C_L,AR,Wbody,const.e,T);
        %gives payload for given thrust and geomtric values
    Wpay = double(Wpay);
    
%tip deflection
    %[delta,M0,I0] = WingBend(const.E,const.tau,const.epsilon,const.c_t,const.c_r,AR,S,N,const.W_fuse,Wpay);
    [delta, M0, I0] = WingBend(const.E,const.tau,const.epsilon,const.c_t,const.c_r,AR,S,const.N,const.W_fuse,Wpay);
        %returns tip deflection, wing momemnt, and wing bending inertia
    DoB = delta/(sqrt(AR*S));
        %deflection over span
        
%bending constrained payload
    N_s = 1;
        %load factor for stead level flight
    [Wpay_bc,delta_bc,M0_bc] = defweight(I0,N_s,DoB,AR,S,const.lambda,const.W_fuse);
        %returns bending constrained payload, tip deflection, and bending
        %constrained moment
%Revolution Time
    Wplane = Wbody+Wpay;
    [trev,N,T] = RevTime(Wplane,AR,S,const.C_L,R,CD);
    
   
    