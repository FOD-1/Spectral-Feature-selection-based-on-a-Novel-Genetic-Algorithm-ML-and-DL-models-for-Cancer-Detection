function ACC = FitnessEvaluators(X, y, opts)

% This function first generates train and test set according to the given
% fold number. After that the accuarcy values is calculated using different
% ML and DL models.

acc = zeros(1, opts.numFolds);
for foldNumber = 1:opts.numFolds

    [XTrain, yTrain, XTest, yTest] = createPartition(X, y, foldNumber, opts);

    switch lower(opts.Classifier)

        case 'knn'
            mdl = fitcknn(XTrain, yTrain, 'NumNeighbors',3);
            yTest_mdl = predict(mdl, XTest);
            acc(foldNumber) = numel( find(yTest_mdl == yTest') ) / numel(yTest);
%             disp(acc)
            ACC = mean(acc);

        case 'svm'
            mdl = fitcsvm(XTrain, yTrain,"Standardize",true);
            yTest_mdl = predict(mdl, XTest);
            ACC = numel( find(yTest_mdl == yTest') ) / numel(yTest);
            acc(foldNumber) = numel( find(yTest_mdl == yTest') ) / numel(yTest);
%             disp(acc)

        case 'nb'
            mdl = fitcnb(XTrain, yTrain);
            yTest_mdl = predict(mdl, XTest);
            acc(foldNumber) = numel( find(yTest_mdl == yTest') ) / numel(yTest);
%             disp(acc)
            ACC = numel( find(yTest_mdl == yTest') ) / numel(yTest);

        case 'tree'
            mdl = fitctree(XTrain, yTrain);
            yTest_mdl = predict(mdl, XTest);
            acc(foldNumber) = numel( find(yTest_mdl == yTest') ) / numel(yTest);
%             disp(acc)
            ACC = numel( find(yTest_mdl == yTest') ) / numel(yTest);

        case '1dcnn'
            ACC = OneDCNN(X, y, opts);
          
        otherwise
            error('FitnessEvaluators --> Unknown Classifier!');

    end % Switch
end

