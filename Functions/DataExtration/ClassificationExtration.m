function [species subSpecies codeSpecies codeSubEspecies] = ClassificationExtration(fileName)

[num,txt,raw] = xlsread(fileName);
b = size(raw);
nr_linhas_excel = b(1);

all_species = txt(:,1);
all_subSpecies = txt(:,2);
species = unique(all_species);
subSpecies = unique(all_subSpecies);

nr_species = size(species);
nr_subSpecies = size(subSpecies);


nr_species = nr_species(1,1);

nr_subSpecies = nr_subSpecies(1,1);



%empty_code_specie = zeros(nr_species);
empty_code_specie = zeros(1,nr_species);
empty_code_subSpecies = zeros(1,nr_subSpecies);

    for j=1 : nr_species
     tempCodeSpecie = empty_code_specie;
     tempCodeSpecie(1,j) = 1;
     codeSpecies(j,:) = tempCodeSpecie;
      
    end

    for j=1 : nr_subSpecies
        tempCodesubSpecie = empty_code_subSpecies;
        tempCodesubSpecie(1,j) = 1;
        codeSubEspecies(j,:) = tempCodesubSpecie;
      
    end
            
end

