function [w, iterations, e] = perceptron(x, y, eta, error, iteration)[r, c]=size(x); w=rand(1,c+1); iterations=0;e=error;while e >= error &&  iterations <=iteration iterations=iterations+1; wrong=0; for i=1:r,     if w(1, 1)+w(1, 2)*([x(i,:),1] + power([x(i,:),1],2)) + w(1, 3)*([x(i,:),2] + power([x(i,:),2],2))<0, out=-1; else out=1; end     dw=eta*(y(i)-out)*[x(i,:),1];     w=w+dw; end for i=1:r,    if y(i)*(w(1, 1)+w(1, 2)*([x(i,:),1] + power([x(i,:),1],2)) + w(1, 3)*([x(i,:),2] + power([x(i,:),2],2)))<0, wrong=wrong+1; endende=wrong/r;end