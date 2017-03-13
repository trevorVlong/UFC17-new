%Payload backsolved by tip deflection

function [W_pay,delta,M0] = defweight(I, N, d_span, AR, S,lambda,Wfuse)

b = sqrt(AR*S);

str = load('Master_Constant.mat');

    delta = b*d_span;
        %solves for tip deflection from ratio
    kappa = 2*delta/((b/2)^2) ;
        %curvature from delta
    M0 = kappa*str.E*I;
        %Wing Moment from payload & fusealage
    W_pay = (12*M0*(1+lambda)/(1+2*lambda)*1/N)/b -Wfuse;
        %back solves for payload in terms of constrained deflection
        
        
end
