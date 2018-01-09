function error = computeError(theta, X, Y)
    error1 = Y-X*theta;
    error = sum(abs(error1).^2);
end