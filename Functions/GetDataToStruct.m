function imagens = GetDataToStruct( imagens , fileName)


    %TODO get as param
    fileName = '..\Tema 1 - RN\ClassificaçãoFolhas.xlsx';
    
   
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
     
     empty_code_specie = zeros(nr_species);
     empty_code_subSpecies = zeros(nr_subSpecies);

    
    for k=1 : nr_imagens
        %first line is the names of the columms
       for i=1 : nr_linhas_excel
           
           tempCodeSpecie = empty_code_specie;
           tempCodesubSpecie = empty_code_subSpecies;
           
          if raw{i,1} == imagens(k).id 
              imagens(k).especie = raw{i,2};
              imagens(k).subEspecie = raw{i,3};
              
              
              for j=1 : nr_species
               if strcmp(imagens(k).especie, species(j)) == 1
                   tempCodeSpecie(j) = 1;
               end
              end
              
               for j=1 : nr_subSpecies
               if strcmp(imagens(k).codigoSubEspecie, subSpecies(j)) == 1
                   tempCodeSpecie(j) = 1;
               end
              end
              
              
              
               imagens(k).codigoEspecie = tempCodeSpecie;
               imagens(k).codigoSubEspecie = tempCodesubSpecie;

              
          end
       end 
    end

