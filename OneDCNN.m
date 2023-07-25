function ACC = OneDCNN(X, y, opts)

y = categorical(y);
numClass = length(categories(y));
numFeatures = size(X,2);

% set the layers
layers = [
    imageInputLayer([numFeatures 1 1])

    convolution2dLayer(9,9,'Padding','same')
    batchNormalizationLayer
    reluLayer

    convolution2dLayer(9,9,'Padding','same')
    batchNormalizationLayer
    reluLayer

    fullyConnectedLayer(25)
    batchNormalizationLayer
    reluLayer
    dropoutLayer(0.2)

    fullyConnectedLayer(numClass)
    softmaxLayer
    classificationLayer
    ];

% optimize options
options = trainingOptions('adam',...
    'MaxEpochs',100,...
    'Verbose',false,...
    'Shuffle','every-epoch');

% Train the modelacc = zeros(1,opts.numFolds);
for foldNumber = 1:opts.numFolds
    [X_train, yTrain, X_test, yTest] = createPartition(X, y, foldNumber, opts);

    % reshape the inputs
    XTrain = reshapeData(X_train);
    XTest = reshapeData(X_test);

    mdl = trainNetwork(XTrain,categorical(yTrain'),layers,options);
    yTest_mdl = classify(mdl,XTest);

    acc(foldNumber) = numel( find(yTest_mdl == yTest') ) / numel(yTest);
%     disp(acc)
    ACC = mean(acc);

end




