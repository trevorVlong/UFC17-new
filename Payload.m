%gets payload weight and creates Cd/CL ratio
function [W_pay,CdCl,C_D] = Payload(CDA_0,cd, S, CL, AR, W_body, e,T)

    C_D = ((((CDA_0)/S)/(CL))+(cd)/(CL)+(CL)/(pi*AR*e));
    
    CdCl = T/C_D;
    
    W_pay = T/(C_D)-W_body;
end
    
        

