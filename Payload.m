%gets payload weight and creates Cd/CL ratio
function [W_pay,CdCl,Drag] = Payload(CDA_0,cd, S, CL, AR, W_body, e,T)

    Drag = ((((CDA_0)/S)/(CL))+(cd)/(CL)+(CL)/(pi*AR*e));
    
    CdCl = T/Drag;
    
    W_pay = T/(Drag)-W_body;
end
    
        

