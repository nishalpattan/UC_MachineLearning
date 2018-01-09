function J = computeCost(X, y, t,lambda)
    m = length(y);
    H=X* t  ;
    Output=H-y;
    Output=Output.^2;
    J=sum(Output)/(2*m);
end