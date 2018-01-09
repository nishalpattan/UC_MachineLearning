function [w, out_q1, e]=DR_Batch_bias(rx, class_q1, eta, iterations, e_q2b, bias)

[row_q1, col_q1] = size(rx);
[row_class, ~] = size(class_q1);
rand_w = rand(1, col_q1+1);
delta_w = rand_w';
w_rand = rand(1, col_q1+1);
w = w_rand';
if row_q1 ~= row_class
    error('Number of data points are not equal to the number target Class');
else
    for j = 1: iterations
        for i = 1 : row_q1
            if bias*w(1, 1)+bias*rx(i,1)*w(2, 1)+bias*rx(i,2)*w(3, 1) <0 , 
                out_q1(i) = -1;
            else
                out_q1(i) = 1;
            end;
            delta = class_q1(i) - out_q1(i);
            
            delta_w(1,1) = delta_w(1,1)+eta*delta*bias;
            delta_w(2,1) = delta_w(2,1)+rx(i,1)*delta*bias;
            delta_w(3,1) = delta_w(3,1)+rx(i,2)*delta*bias;
            err(i) = (1/2)*(class_q1(i)- out_q1(i))^2;
            
        end
        weight(:,j) = delta_w;
        e(j)=sum(err)/row_q1;
        d = 0.9;
        D = 1.02;
        threshold = e_q2b;
        if j > 1
            if e(j) > e(j-1) && (e(j) - e(j-1)) > threshold
                w = weight(:,j-1);
                eta = eta*d;
            else e(j) < e(j-1)
                w = weight(:,j);
                eta = eta * D;
            end    
        end   
    end
end
end