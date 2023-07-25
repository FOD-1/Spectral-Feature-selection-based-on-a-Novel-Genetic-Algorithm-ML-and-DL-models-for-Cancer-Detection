function [mother, father] = RouletteSelection(pop, Nab, fitnessValues)


Ngene = size(pop,2);
mother = zeros(Nab, Ngene);
father = zeros(Nab, Ngene);

for i=1:Nab
    
    % precise the mother 
    fv_Normalize = fitnessValues / sum(fitnessValues);
    fv_increasing = cumsum(fv_Normalize); %Cumulatif sum
    motherInd = 1 + sum(rand >= fv_increasing);
    mother(i,:) = pop(motherInd,:);
    
    %To precise the father chromosome, remove the mother from the
    %population
    pop(motherInd,:) = [];
    fitnessValues(motherInd) = [];
    
    % precise the father
    fv_Normalize = fitnessValues / sum(fitnessValues);
    fv_increasing = cumsum(fv_Normalize); %Cumulatif sum
    fatherInd = 1 + sum(rand >= fv_increasing);
    father(i,:) = pop(fatherInd,:);
    
end %for

end %function
    