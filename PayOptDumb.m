



%Plane program
N = 1;
T = .7;
R = 12.5;
const = load('Master_Constant.mat');

    C_L = const.C_L;
    
c_l0 = .8;
c_d8 = 1.0;
c_d2 = .02;
c_d1 = -.004;
c_d0 = .020;


    %uploads constants from mat files
%     
% ARtst = linspace(10.79,10.81,10);
% Stst = linspace(.1382, .139, 10);
% C_Ltst = linspace(1.09, 1.11, 10);
% Wpaymax = 0;
% ARmax = 0;
% C_Lmax = 0;
% Smax = 0;
% 
% 
% %geometric values
% for AR = ARtst
%   for S = Stst
%      for C_L = C_Ltst
%          
%     c_d = c_d0+c_d1*(C_L-c_l0)+c_d2*(C_L-c_l0)^2+c_d8*(C_L-c_l0)^8;
%         %gets drag coefficient
%     b = sqrt(AR*S);
%         %gets span
%     %[AR, S, cavg] = ARSspace(const.c_t,const.c_r,b);
%         
% 
%         %outputs Aspect ratio, reference area, and average chord
%     [Wwing,Wbody] = WingWeight(const.rho,const.c_function, const.tau,AR,S,const.W_fuse);
%         %outputs the wing weight and the generic body weight of the plane
%     Wwing = double(Wwing);
%     Wbody = double(Wbody);
%         %converts to floats
% %payload
%     
%     [Wpay,CdCl,CD] = Payload(const.CDA_0,c_d,S,C_L,AR,Wbody,const.e,T);
%         %gives payload for given thrust and geomtric values
%     Wpay = double(Wpay);
%     
% %tip deflection
%     %[delta,M0,I0] = WingBend(const.E,const.tau,const.epsilon,const.c_t,const.c_r,AR,S,N,const.W_fuse,Wpay);
%     [delta, M0, I0] = WingBend(const.E,const.tau,const.epsilon,const.c_t,const.c_r,AR,S,const.N,const.W_fuse,Wpay);
%         %returns tip deflection, wing momemnt, and wing bending inertia
%     DoB = delta/(sqrt(AR*S));
%         %deflection over span
%     if DoB >= .1
%         'equation broke constraints'
%         break
%     end
%     if Wpay > Wpaymax
%         Wpaymax = Wpay;
%         C_Lmax = C_L;
%         ARmax = AR;
%         Smax = S;
%     end
%      end
%      if DoB > .1 
%          break
%      end
%   end
% end
    


% 
% ARtst = linspace(13.3,13.4,10);
% Stst = linspace(.149, .15, 10);
% C_Ltst = linspace(1.12, 1.14, 10);
% Wpaymax = 0;
% ARmax = 0;
% C_Lmax = 0;
% Smax = 0;
% 
% 
% %geometric values
% for AR = ARtst
%   for S = Stst
%      for C_L = C_Ltst
%          
%     c_d = c_d0+c_d1*(C_L-c_l0)+c_d2*(C_L-c_l0)^2+c_d8*(C_L-c_l0)^8;
%         %gets drag coefficient
%     b = sqrt(AR*S);
%         %gets span
%     %[AR, S, cavg] = ARSspace(const.c_t,const.c_r,b);
%         
% 
%         %outputs Aspect ratio, reference area, and average chord
%     [Wwing,Wbody] = WingWeight(const.rho,const.c_function, const.tau,AR,S,const.W_fuse);
%         %outputs the wing weight and the generic body weight of the plane
%     Wwing = double(Wwing);
%     Wbody = double(Wbody);
%         %converts to floats
% %payload
%     
%     [Wpay,CdCl,CD] = Payload(const.CDA_0,c_d,S,C_L,AR,Wbody,const.e,T);
%         %gives payload for given thrust and geomtric values
%     Wpay = double(Wpay);
%     
% %tip deflection
%     %[delta,M0,I0] = WingBend(const.E,const.tau,const.epsilon,const.c_t,const.c_r,AR,S,N,const.W_fuse,Wpay);
%     [delta, M0, I0] = WingBend(const.E,const.tau,const.epsilon,const.c_t,const.c_r,AR,S,const.N,const.W_fuse,Wpay);
%         %returns tip deflection, wing momemnt, and wing bending inertia
%     DoB = delta/(sqrt(AR*S));
%         %deflection over span
%     Wpay
%     if DoB >= .15
%         'equation broke constraints'
%         break
%     end
%     if Wpay > Wpaymax
%         Wpaymax = Wpay;
%         C_Lmax = C_L;
%         ARmax = AR;
%         Smax = S;
%     end
%      end
%      if DoB > .15 
%          break
%      end
%   end
% end


DoB = .15;
    %constraint
ARtop = 20;
ARbot = 7;
    %Aspect ratio initial limits
Stop = 1;
Sbot = .05;
    %surface area initial limits
C_Ltop = 2;
C_Lbot = .5;
    %Lift coefficient initial limits


ARtst = linspace(ARbot,ARtop,10);
Stst = linspace(Sbot, Stop, 10);
C_Ltst = linspace(C_Lbot, C_Ltop, 10);


Wpaymax = 0;
ARmax = 0;
C_Lmax = 0;
Smax = 0;


%geometric values
for AR = ARtst
  for S = Stst
     for C_L = C_Ltst
         
    c_d = c_d0+c_d1*(C_L-c_l0)+c_d2*(C_L-c_l0)^2+c_d8*(C_L-c_l0)^8;
        %gets drag coefficient
    b = sqrt(AR*S);
        %gets span
    %[AR, S, cavg] = ARSspace(const.c_t,const.c_r,b);
        

        %outputs Aspect ratio, reference area, and average chord
    [Wwing,Wbody] = WingWeight(const.rho,const.c_function, const.tau,AR,S,const.W_fuse);
        %outputs the wing weight and the generic body weight of the plane
    Wwing = double(Wwing);
    Wbody = double(Wbody);
        %converts to floats
%payload
    
    [Wpay,CdCl,CD] = Payload(const.CDA_0,c_d,S,C_L,AR,Wbody,const.e,T);
        %gives payload for given thrust and geomtric values
    Wpay = double(Wpay);
    
%tip deflection
    %[delta,M0,I0] = WingBend(const.E,const.tau,const.epsilon,const.c_t,const.c_r,AR,S,N,const.W_fuse,Wpay);
    [delta, M0, I0] = WingBend(const.E,const.tau,const.epsilon,const.c_t,const.c_r,AR,S,const.N,const.W_fuse,Wpay);
        %returns tip deflection, wing momemnt, and wing bending inertia
    DoB = delta/(sqrt(AR*S));
        %deflection over span
    if DoB >= .05
        'equation broke constraints'
        break
    end
    Wpay
    if Wpay > Wpaymax
        Wpaymax = Wpay;
        C_Lmax = C_L;
        ARmax = AR;
        Smax = S;
    end
     end
     if DoB > .05 
         break
     end
  end
end