function imagens = GetDataToStruct( imagens , fileName)


    %TODO get as param
    fileName = '..\Tema 1 - RN\ClassificaçãoFolhas.xlsx';
    
   
    [num,txt,raw] = xlsread(fileName);
    
    a = size(imagens);
    b = size(raw);
    n = a(2);
    m = b(1);
    
    for k=1 : n
        %first line is the names of the columms
       for i=2 : m
          if raw{i,1} == imagens(k).id 
              imagens(k).especie = raw{i,2};
              imagens(k).subEspecie = raw{i,3};
          end
        
    end
    
end

