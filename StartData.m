function imagens = StartData(data_file, path_to_files, scale)
addpath(genpath('./Functions'));

%override for test's
path_to_files = './Tema 1 - RN\Folhas_1';
scale = 250;
data_file = '.\Tema 1 - RN\Classifica��oFolhas.xlsx';
    

imagens = GetStructsFromDir(path_to_files);
imagens = GetDataToStruct(imagens,data_file);


end