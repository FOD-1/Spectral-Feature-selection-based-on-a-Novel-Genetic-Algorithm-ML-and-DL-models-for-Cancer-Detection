function [mother, father] = Selection(pop, Nab, fitnessValues, selectionType)
% This is a subprogram for the feature selection performation with genetic algorithm.
% Here the selection of parent chormosomes (mother and father) is performed 
% Two selection strategy can be used:
%
%'roulette'    : The probabilities of selection are assigned to each individual 
% of the previous generation based on their fitness values. 
% The mother is determined according to these probabilities. 
% The individual selected as the mother is removed from the population, 
% and the selection probabilities are recalculated. 
% After that, the father is determined.
%                
% 'tournament'  : A subgroup with a random number of individuals is determined 
% from among the chromosomes of the previous generation. 
% The two chromosomes with the highest fitness value of this subgroup 
% are determined as the mother and father.
%
 

switch lower(selectionType)
    case 'roulette'
        [mother, father] = RouletteSelection(pop, Nab, fitnessValues);
    case 'tournament'
        [mother, father] = TournamentSelection(pop, Nab, fitnessValues);
end %switch

end %function
