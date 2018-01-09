rx = randi([-10, 10], 100, 2);
for i = 1:100
    if rx(i , 1 ) + 2*rx(i , 2 ) - 2 > 0
        class_train(i) = 1;
    else
        class_train(i) = -1;
    end
end

class_q1 = class_train';
%% ---------- Problem 2.a -----------------

tic
[w, out_q1, e] = DR_Training(rx, class_q1, 0.05, 100,0.01);

figure
plot(e);
hold on;

figure
plot_2D(rx, out_q1, 'g', 'r')
legend('class = 1', 'class = -1')
toc;

% decreasing learning rate:
tic;
[w_2a, out_2a, e_2a] = Delta_training(rx, class_q1, 0.05, 100);

figure
plot(e_2a);
hold on;

figure
plot_2D(rx, out_2a, 'g', 'r')
legend('class = 1', 'class = -1')
toc;

%% ---------- Problem 2.b -----------------

% only one iteration:
[w_q2b, out_q2b, e_q2b] = DR_Batch_2(rx, class_q1, 0.5, 1, 0.05, 0.05);
threshold_error = sum(e_q2b);

% Batch
tic;
[w, out_q1, e] = DR_Training(rx, class_q1, 0.5, 100, 0.05);

figure
plot(e);
hold on;

figure
plot_2D(rx, out_q1, 'g', 'r')
legend('class = 1', 'class = -1')
toc;

% sending the one iteartion values into the new function as input    
[w_q2b_2, out_q2b_2, e_q2b_2] = DR_Batch_bias(rx, class_q1, 0.5, iterations, threshold_error,0.05);

figure
plot(e_q2b_2);
hold on;

figure
plot_2D(rx, out_q2b_2, 'g', 'r')
legend('class = 1', 'class = -1')
toc;
