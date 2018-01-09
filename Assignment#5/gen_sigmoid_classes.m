function data=gen_sigmoid_classes(N)

u=rand(2,N);
x=(2*u-1)';
y=sin(pi*x(:,1));
data=[x(:,1), x(:,2), sign(x(:,2)-y)];

