function [J, theta] = cost_Reg2(X, y, theta, alpha, num_iters,lambda)
%GRADIENTDESCENTMULTI Performs gradient descent to learn theta
%   theta = GRADIENTDESCENTMULTI(x, y, theta, alpha, num_iters) updates theta by
%   taking num_iters gradient steps with learning rate alpha

% Initialize some useful values
m = length(y); % number of training examples
J_history = zeros(num_iters, 1);

for iter = 1:num_iters
    
    h_x = (X*theta)-y;
    J_component = h_x'*h_x;
    %J = (h_x-y).^2;
    regularized_term = (lambda)*(sum(theta(2:length(theta),1).^2));
    
    J = (J_component + regularized_term)/(2*m);
    
    J_history(iter) = J;
    theta_0 = theta(1);
    sub = (alpha/m)*((X')*(X*theta - y));
    h_x = X*theta;
    
    theta(1) = 0;
    theta = (theta*(1-(alpha*lambda/m))) - (alpha/m)*((X')*(X*theta - y));
    
    %theta(1) = theta_0 - (alpha/m)*h_x(1,1);
    %theta(1) = theta_0 - sub(1,1);
end
    theta;
    J;
    iter = [1:num_iters];
    
    %plot(iter, J_history)
end
