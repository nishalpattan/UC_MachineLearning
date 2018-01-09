function [J_history,theta] = gDMulti(X, y, theta, alpha, num_iters)

    m = length(y); % number of training examples
    J_history = zeros(num_iters, 1);

    for iter = 1:num_iters
        J = 0;
        J = (X*theta)-y;
        J = J'*J;
        J = J/(2*m);
        J_history(iter) = J;

        theta = (theta) - (alpha/m)*((X')*(X*theta - y));
    end
    
end
