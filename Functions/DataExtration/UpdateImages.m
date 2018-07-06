function imagens = UpdateImages( imagens , fileName , scale)

    [num,txt,raw] = xlsread(fileName);
    
    a = size(imagens);
    b = size(raw);
    nr_imagens = a(2);
    nr_linhas_excel = b(1);
    
    all_species = txt(:,1);
    all_subSpecies = txt(:,2);
    species = unique(all_species);
    subSpecies = unique(all_subSpecies);
     
     nr_species = size(species);
     nr_subSpecies = size(subSpecies);
     
     nr_species = nr_species(1,1);
     nr_subSpecies = nr_subSpecies(1,1);
     
    
    for k=1 : nr_imagens
        %first line is the names of the columms
       for i=1 : nr_linhas_excel
           
           
          if raw{i,1} == imagens(k).id 
              imagens(k).especie = raw{i,2};
              imagens(k).subEspecie = raw{i,3};
              
              
          end
       end 
    end
    
     %only generate codes for the ones who need it, not for all of them
    
    for k=1 : nr_imagens
    t1{k} = imagens(k).especie;
    t2{k} = imagens(k).subEspecie;
    end
    
    species = unique(t1);
    subSpecies = unique(t2);
    
    nr_species = size(species);
    nr_subSpecies = size(subSpecies); 
    
    nr_species = nr_species(1,2);
    nr_subSpecies = nr_subSpecies(1,2);
    
    empty_code_specie = zeros(1,nr_species);
    empty_code_subSpecies = zeros(1,nr_subSpecies);
    
     for k=1 : nr_imagens
    
           tempCodeSpecie = empty_code_specie;
           tempCodesubSpecie = empty_code_subSpecies;
    
            for j=1 : nr_species
                 % disp('Especie nr '); disp(j); disp(':'); disp(species(j));
               if strcmp(imagens(k).especie, species(j)) == 1
                   tempCodeSpecie(1,j) = 1;
               end
              end
              
               for j=1 : nr_subSpecies
                      %disp('SubEspecie nr '); disp(j); disp(':'); disp(subSpecies(j));
                   if strcmp(imagens(k).subEspecie, subSpecies(j)) == 1
                     
                       tempCodesubSpecie(1,j) = 1;
                   end
               end
              
              
              
               imagens(k).codigoEspecie = tempCodeSpecie;
               imagens(k).codigoSubEspecie = tempCodesubSpecie;

    end

    
end

