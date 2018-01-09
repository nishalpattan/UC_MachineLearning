N = 100;
input=gen_sigmoid_classes(N);

[w, iterations, e] = perceptron(input(:,[1, 2]), input(:,[3]), 0.05, 0.005, 10000);
n = (75/100)*N;
for i = 1: n
    train(i,:) = input(i,:);
end
for i = n+1: N
    test(i,:) = input(i,:);
end
test(1:n, :) = [];
[w_train, iterations_train, e] = perceptron(train(:,[1, 2]), train(:,[3]), 0.05, 0.005, 10000)

[w_test, iterations_test, e, accuracy] = perceptron_train(test(:,[1, 2]), test(:,[3]), 0.05, 0.005, 10000,w_train);
