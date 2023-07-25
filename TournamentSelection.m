function [mother, father] = TournamentSelection(pop, Nab, fitnessValues)


[Nindiv, Ngene] = size(pop);
mother = zeros(Nab, Ngene);
father = zeros(Nab, Ngene);

for i=1:Nab
    
    % form the sub population
    Ngroupe = 2 + floor( rand * (Nab-1) ); % 2 <= Ngrup <= Nab
    groupeInd = randperm(Nindiv);
    groupeInd = groupeInd(1:Ngroupe);
    subPop = pop(groupeInd,:);
    subFitnessValue = fitnessValues(groupeInd);
    
    %Alt surunun en iyi iki bireyini belirle
    [subFitnessValue, ind] = sort(subFitnessValue, 'descend');
    mother(i,:) = subPop(ind(1),:);
    father(i,:) = subPop(ind(2),:);
        
end %for

% mother = logical(mother);
% father = logical(father);

end %function
    