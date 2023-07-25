function [XTrain, yTrain, XTest, yTest] = createPartition(X, y, foldNumber, opts)
% This function creates train and test partitions according to the given
% values of X, y and number of folds

numLabel = size(X,1);
cvPartitions = cvpartition(numLabel,'KFold',opts.numFolds);

pTrain = training(cvPartitions, foldNumber);
pTest = test(cvPartitions, foldNumber);

XTrain = X(pTrain,:);
yTrain = y(pTrain);

XTest = X(pTest,:);
yTest = y(pTest);

