function Wing_Moment = Wing_Moment(c_r,c_t,N , W_fuse, W_pay, b)
%finds bending moment acting on wing
    W = W_fuse+W_pay;
    Wing_Moment = (1/12)*(1+2*lambda)/(1+lambda)*N*W*b;
end
