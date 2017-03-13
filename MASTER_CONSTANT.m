%list of all variables and values (constant table for Vanilla Analysis) for
%Vanilla Plane
syms x y z
%Note that some do require other functions to run working on getting those
%kinks out

g = 9.81; %gravitational constant
rho = 32; %kg/m^3
CDA_0 = .004; %m^2
e = 0.95; % unitless, efficiency number
p_foam = 32; %wing foam density kg/m^3
tau = 0.11; %Airfoil thickness ratio
epsilon = 0.03; %airfoil camber ratio
W_fuse = 2.7; %fuselage weight (mg) (N)


c_t = .1016; %root wing chord (m)
c_r = .2032; %tip wing chord (m)
lambda = c_t/c_r; %taper ratio

b = 1.524; %wing span (m)
c_function = c_r + (c_t-c_r)/(b/2)*x ; %average wing chord (m)  
%S = b*c_avg; %wing planform area (m^2)
%AR = AsRa(b,S); %wing aspect ratio

L = 0; %Lift (N)
D = 0; %Drag (N)
T = 0; %Thrust (N)
T_max = .7; %Maximum Thrust (N)
C_L = .8; %Lift coefficient
C_D = 0; %Drag coefficient
c_l0 = .8;
c_d8 = 1.0;
c_d2 = .02;
c_d1 = -.004;
c_d0 = .020;
c_d = c_d0+c_d1*(C_L-c_l0)+c_d2*(C_L-c_l0)^2+c_d8*(C_L-c_l0)^8; %wing profile drag coefficient
N = 1 ;%load factor (L/W);


%I = WingInertia(c,t,h,lambda); %wing root bending inertia 
E = 1.93e7; %wing Young's Modulus Pa
%M = Wing_Moment(lambda, N, W_fuse,W_pay,b); %wing root bending moment
%kappa = M/(E*I); %wing root bending curvature
%delta = 1/2*kappa*(b/2)^2; %wing tip deflection

R = 12.5; %turn radius m
V = sqrt(g*R*sqrt(N^2-1)); %V_inf m/s


t_rev = 2*pi*R/V; %time per revolution


save('Master_Constant.mat')

