function lambda = best_lambda2(X_train, Y_train, X_test, Y_test)
    J_history = zeros(1000,1);
    J_min = 100000;
    theta_at_minJ = zeros(4,1);
    index=1;
    %%Using Normal Equation form
    for lambda = 0.01:0.01:3
        I = eye(4);
        I(1,1) = 0;
        theta = zeros(4,1);
        num_iters = 600;
        alpha = 0.5;
        [J,theta ]= cost_Reg2(X_train, Y_train, theta, alpha, num_iters,lambda);
        
        %validate on test data
        m = length(Y_test);
        h_x = (X_test*theta)-Y_test;
        J_component = h_x'*h_x;
        %regularized_term = (lambda)*(sum(theta(2:length(theta),1).^2));
        %J = (J_component + regularized_term)/(2*m);
        J = J_component/(2*m);
        
        J_history(index) = J;index=index+1;
        if J_min > J
            J_min = J;
            lambda_min = lambda;
            theta_at_minJ = theta;
        end
    end
    %%% Plot lambda vs J
    figure;
    hold on;
    lambdas = 0.01:0.01:3;
    plot(lambdas, J_history(1:300),'k+');
    plot(lambda_min, J_min,'ko','MarkerFaceColor','r','MarkerSize',7);
    xlabel('Lambda'); ylabel('Cost J');
    title('Finding Best Lambda')
    min(J_history);
    
    fprintf('Minimum J , theta, lambda \n');
    %%Min value of J occurs at lambda_min
    J_min
    theta_at_minJ
    lambda = lambda_min
    I=eye(4);
    I(1,1)=0;
    
end