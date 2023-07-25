clear,clc;
load Healty_Endometrial.mat;
opts.selectionType = 'tournament'; % you can select either ""roulette" or "tournament"
opts.crossoverType = 'uniform';
opts.Classifier = 'svm';
opts.maxIter = 10;
opts.Ngene = size(X,2); % Equal to the number of spectral features
opts.Nindiv = 10;
opts.numFolds = 5;
% opts.NFeatures = 8;
%%
ACC = [];
Bestfeatures = [];

for i = 1:3 %opts.numFeatures-1 % we can precise the number of features to be selected

    opts.NFeatures = i;
    [best, maxfv] = GeneticAlgorithmBasedFeatureSelection(X, y, opts);

    ACC= [ACC; maxfv];
    Bestfeatures = [Bestfeatures; best];

    %     writematrix(ACC,"Accuracies.csv");
    %     writematrix(ACC,"Accuracies.csv");

end
%%
% Select the best festures from the data
[~, maxAccInd] = max(ACC);
X_Best = X(:,(Bestfeatures(maxAccInd,:)==1));
writematrix(X_Best, "BestFeatures");