function excelData = GetDataToStruct( imagens , fileName)


    %TODO get as param
    
    fileName = '..\Tema 1 - RN\ClassificaçãoFolhas.xlsx';
    
   
    excelData = xlsread(fileName, 'B:B')

    a = size(imagens);
    n = a(2)
    

    for k=1 : n
       
        
        
    end
    
end

