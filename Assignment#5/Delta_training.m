function [w, out_q1, e]=Delta_training(rx, class_q1, eta, iterations)

[row_q1, col_q1] = size(rx);
[row_class, ~] = size(class_q1);
rand_w = rand(1, col_q1+1);
delta_w = rand_w';
if row_q1 ~= row_class
    error('Number of data points are not equal to the number target Class');
else
    for j = 1: iterations
        w = delta_w;
        eta_k = rand(1, 1).^(j-1)*eta;% Multiplying with a number in between (0,1)
        for i = 1 : row_q1
            if w(1, 1)+rx(i,1)*w(2, 1)+rx(i,2)*w(3, 1) <0 , 
                out_q1(i) = -1;
            else
                out_q1(i) = 1;
            end;
            delta = class_q1(i) - out_q1(i);
            eta_k = rand(1, 1).^(j-1)*eta ;% Multiplying with a number in between (0,1)
            delta_w(1,1) = delta_w(1,1)+eta_k*delta;
            delta_w(2,1) = delta_w(2,1)+rx(i,1)*delta;
            delta_w(3,1) = delta_w(3,1)+rx(i,2)*delta;
            err(i) = (1/2)*(class_q1(i)- out_q1(i))^2;
        end
        e(j)=sum(err)/row_q1;
    end
end
end