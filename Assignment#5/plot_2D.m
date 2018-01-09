function plot_2D(rx,class_q1, color1, color2)

    posindex=find(class_q1==1);
    negindex=find(class_q1==-1);
    hold on;
    scatter(rx(posindex,1), rx(posindex,2), color1);
    scatter(rx(negindex,1), rx(negindex,2), color2);
    plot([-10, 22],[6, -10], '-s')
    hold off;
end
