function [w, iterations, e, accuracy] = perceptron_train(x, y, eta, error, itearation, w_train)

[r, c]=size(x);
 w=w_train;
 iterations=0;
e=error;
while e >= error &&  iterations <=itearation
 iterations=iterations+1;
 wrong=0;
 flag=0;
 for i=1:r,
     if w(1, 1)+w(1, 2)*([x(i,:),1] + power([x(i,:),1],2)) + w(1, 3)*([x(i,:),2] + power([x(i,:),2],2))<0, 
         out=-1;
         if eq(y(i),-1);
             flag = flag + 1;
         end
     else
         out=1;
         if eq(y(i),1);
             flag = flag + 1;
         end
     end
%     if sum(w .* [x(i,:),1])<0, out=-1; else out=1; end
     dw=eta*(y(i)-out)*[x(i,:),1];
     w=w+dw;
 end 
for i=1:r,
    if y(i)*(w(1, 1)+w(1, 2)*([x(i,:),1] + power([x(i,:),1],2)) + w(1, 3)*([x(i,:),2] + power([x(i,:),2],2)))<0, wrong=wrong+1; end
%     if y(i)*(sum(w .* [x(i,:),1])) < 0, wrong=wrong+1; end
end
e=wrong/r;
end

accuracy = (flag/r)*100