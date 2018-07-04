function imagens = StartData(data_file, path_to_files, scale)
addpath(genpath('./Functions'));

%override for test's
path_to_files = './Tema 1 - RN\Folhas_1';
scale = 500;
data_file = '.\Tema 1 - RN\ClassificaçãoFolhas.xlsx';
    

imagens = GetStructsFromDir(path_to_files, scale);
imagens = GetDataToStruct(imagens,data_file, scale);


end