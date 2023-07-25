function FitnessValues = objfunction(X, y, pop, opts)

ACC = [];
for ind = 1:opts.Nindiv
    acc = FitnessEvaluators(X(:,(pop(ind,:)==1)), y, opts);
    ACC = [ACC; acc];
end % for

FitnessValues = ACC;

end % function