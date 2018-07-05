function [imagens input target redeNeuronal data] = StartData(data_file, path_to_files, scale)
addpath(genpath('./Functions'));
tstart = tic;
%override for test's
path_to_files = './Tema 1 - RN\Folhas_1';
scale = 100;
data_file = '.\Tema 1 - RN\ClassificaçãoFolhas.xlsx';
    

imagens = GetStructsFromDir(path_to_files, scale);
imagens = GetDataToStruct(imagens,data_file, scale);

input = imagensToVector(imagens);
target = codigoToVector(imagens);

data_extration = toc(tstart);
nstart = tic;
[redeNeuronal data] = neuronalNetwork(input, target);
cnn_extration = toc(nstart);
view(redeNeuronal);
disp(data)


fprintf('\nData extration time %d', data_extration);
fprintf('\nCNN extration time %d', cnn_extration);

end