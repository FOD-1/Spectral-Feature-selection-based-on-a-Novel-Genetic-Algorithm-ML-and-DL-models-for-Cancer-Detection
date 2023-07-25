function pop = UniformCrossover(mother, father, opts)

Noffspring = size(mother,1);
pop = zeros(size(mother));

for i = 1:Noffspring
    offspring = or(mother(i,:),father(i,:));
    offspringOnes = find(offspring==1);
    noffspringOnes = numel(offspringOnes);
    MixedOffspring = offspringOnes( randperm(noffspringOnes) );
    offspring( MixedOffspring(1:end-opts.NFeatures) ) = 0;
    pop(i,:) = offspring;
end
end % function
