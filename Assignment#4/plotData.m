function plotData()
    %PLOTDATA Summary of this function goes here
    %   Detailed explanation goes here
    load fisheriris
    %iris=[meas species]
    iris = load_data();              
    setosa = iris((iris(:,5)==-1),:);        % data for setosa
    versicolor = iris((iris(:,5)==1),:);    % data for versicolor
    %virginica = iris((iris(:,5)==1),:);     % data for virginica
    obsv_n = size(iris, 1);                 % total number of observations


    Characteristics = {'sepal length','sepal width','petal length','petal width'};
    pairs = [1 2; 1 3; 1 4; 2 3; 2 4; 3 4];
    h = figure;
    title('Setosa vs Versicolor&Virginica')
    for j = 1:6,
        x = pairs(j, 1); 
        y = pairs(j, 2);   
        subplot(2,3,j);
        hold on
        plot([setosa(:,x)],...
             [setosa(:,y)], '.');
        plot([versicolor(:,x)],...
             [versicolor(:,y)], 'r+');
        xlabel(Characteristics{x},'FontSize',10); 
        ylabel(Characteristics{y},'FontSize',10);
        hold off
    end
    

end

