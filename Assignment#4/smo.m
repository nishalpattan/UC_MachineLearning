function Accuracy=smo(trainData,trainDataclasses,testData,testDataclasses,Epsilon)

    
    pCount = 0;
    nCount = 0;
    trainCount = size(trainData,1);
    testCount = size(testData,1);
    noOfAttributes = size(testData,2);
    for i = 1:trainCount
        if trainDataclasses(i) == 1
            pCount = pCount + 1;
        else
            nCount = nCount + 1;
        end
    end
    
  %% STEP 1: initialising alpha and setting b as 0 
    alpha = randi([0, 10], [trainCount, 1]);
    diff = dot(alpha, trainDataclasses);

    for i = 1:pCount
        alpha(i) = alpha(i) - (diff / pCount);
    end
    diff = dot(alpha, trainDataclasses);
    b = zeros(trainCount, 1);    
    
    
    %% STEP 2: Calculate the weight vector
    for loop = 1:80
        % calculate the weight vector
        w = zeros(1, noOfAttributes);
        for i = 1:trainCount
            w = w + alpha(i) * trainDataclasses(i) * trainData(i, :);
        end

     %% STEP 3: calculate KKT
        kkt = zeros(trainCount, 1);
        for i = 1:trainCount
            kkt(i) = alpha(i) * (trainDataclasses(i) * (dot(w, trainData(i, :)) + b(i)) - 1);
        end

      %% STEP 4:  kkt and errors
        [d, maximumKKT] = max(kkt);
        e = zeros(trainCount,1);
        for i = 1:trainCount    
            for j = 1:trainCount
                e(i) = e(i) +  alpha(j) * trainDataclasses(j) * (dot(j, maximumKKT) - dot(j, i)) + trainDataclasses(i) - trainDataclasses(maximumKKT);
            end
        end
        [d, maximumE] = max(abs(e));
       % Calculating K Value
       k = dot(maximumKKT, maximumKKT) + dot(maximumE, maximumE) - 2 * dot(maximumKKT, maximumE);
       
       
       %% STEP 5: Update AlphamaximumE 
       oldAlphamaximumE = alpha(maximumE);
       alpha(maximumE) = oldAlphamaximumE + (trainDataclasses(maximumE) * e(maximumE)) / k;
       
       
       
       %% STEP 6: Update AlphamaximumKKT
       oldAlphamaximumKKT = alpha(maximumKKT);
       alpha(maximumKKT) = oldAlphamaximumKKT + trainDataclasses(maximumE) * trainDataclasses(maximumKKT) * (oldAlphamaximumE - alpha(maximumE));
       
       
       %% STEP 7:Setting Alpha Values to zero if it is negative 
       if alpha(maximumE) < 0
            alpha(maximumE) = 0;
       end
       if alpha(maximumKKT) < 0
            alpha(maximumKKT) = 0;
       end
       %% STEP 8: Calculate Bias values
       for i = 1:trainCount
            if alpha(i) > 0
                b(i) = trainDataclasses(i) - dot(w, trainData(i, :));
            end
       end
        biasCount = 0;
        for i = 1:trainCount
            if alpha(i) ~= 0
                biasCount = biasCount + 1;
            end
        end
        totalBias = sum(b) / biasCount;
        % Calcualate weight vecotr again
        w = zeros(1, noOfAttributes);
        for i = 1:trainCount
            w = w + alpha(i) * trainDataclasses(i) * trainData(i, :);
        end
        %% STEP 9 : Calculating confusion matrix
        truepCount = 0;
        falsepCount = 0;
        truenCount = 0;
        falsenCount = 0;
        
        for i = 1:testCount
            output = sign(dot(w, testData(i, :)) + totalBias);
            if output == 1
               if output == testDataclasses(i)
                   truepCount = truepCount + 1;
               else
                   falsepCount = falsepCount + 1;
               end
            else
                if output == testDataclasses(i)
                    truenCount = truenCount + 1;
                else
                    falsenCount = falsenCount + 1;
                end
            end
        end
        
        
        Accuracy = (truepCount + truenCount) / (truepCount + truenCount + falsenCount + falsepCount);
        %% STEP 10: Stop the loop if the desired accuracy is reached
        if 1 - Accuracy  < Epsilon
            break
        end
    end
end