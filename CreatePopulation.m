function pop = CreatePopulation(opts)

% This function creates the population that consists of chromosomes whose
% length is equal to the number of features to be selected

pop = zeros(opts.Nindiv, opts.Ngene);
for ind = 1:opts.Nindiv
    z = randperm(opts.Ngene, opts.NFeatures);
    pop(ind, z) = 1;
end
