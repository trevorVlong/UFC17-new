function WingInertia = WingInertia(c,t_r,h_r,lambda)
    %finds moment of Inertia of wing cuttout section
    c_r = c*2/(lambda+1);
    tau = t_r/c_r; %thickness/chord ratio
    epsilon = h_r/c;
    
    WingInertia = 0.036*c_r^4*tau*(tau^2+epsilon^2);
end

        