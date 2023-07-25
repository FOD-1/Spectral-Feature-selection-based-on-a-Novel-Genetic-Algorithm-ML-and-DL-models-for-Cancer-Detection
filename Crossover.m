function pop = Crossover(mother, father, opts)
% This is a subprogram for the feature selection performation with genetic algorithm.
% Here the genes belonging to the individuals of the next generation are
% formed based on the crossover approach
% Three different crossover methods can be used:
%
% 'uniform'   : The offspring takes its gene from parent 
% (Mother and father) chromosomes after performing logic OR operation
% 'onepoint'  : According to the crossover point, the offspring chromome
% takes its gene of the left side form one parent and the right side from
% the other parent
% 'twopoint'  : Here the offspring gets it genes between the two crossover points
% from one parent and the other gene fro the other parent.


switch lower(opts.crossoverType)

    case 'uniform'
        pop = UniformCrossover(mother,father,opts);

    case 'onepoint'
        pop = OnePointCrossover(mother,father);
        
    case 'twopoint'
        pop = TwoPointCrossover(mother,father);
    
end %switch

% pop = logical(pop);

end % function