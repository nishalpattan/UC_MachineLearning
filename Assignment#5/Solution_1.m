rx = randi([-10, 10], 100, 2);
for i = 1:100
    if rx(i , 1 ) + 2*rx(i , 2 ) - 2 > 0
        class_train(i) = 1;
    else
        class_train(i) = -1;
    end
end
class_q1 = class_train';

%% ------ Problem 1.a ----------------

eta_1 = 0.1;
iterations_1 = 100 ;

[w, out_q1, e] = DR_Batch(rx, class_q1, eta_1, iterations_1);
plot(e)
title('Error Function E')
hold on;

%% ------ Problem 1.b ----------------
 
eta = 0.001;

iterations = [5 10 50 100];

for i = iterations
    [w, out_q1, e] = DR_Batch(rx, class_q1, eta, i);
    figure
    plot_2D(rx, out_q1, 'g', 'r')
    name = ['Iterations ',num2str(i)];
    title(name)
    legend('class = 1', 'class = -1')
end

%% ------ Problem 1.c ----------------

eta_array = [0.001 0.01 0.1 0.9999];

for i = eta_array
    [w, out_q1, e] = DR_Batch(rx, class_q1, i, 100);
    figure
    plot(e)
    name = ['With Learning Rate1 = ',num2str(i)];
    title(name)
end

%% ------ Problem 1.d ----------------

% Batch
tic
    [w, out_q1, e] = DR_Batch(rx, class_q1, 0.5, 100);
toc;

% Incremental
tic
    [w_d, out_q1_d, e_d] = DR_Incremental(rx, class_q1, 0.5, 100);
toc;
