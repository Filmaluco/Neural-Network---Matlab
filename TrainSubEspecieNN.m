function [redeNeuronal data timers precision input target imagens] = TrainSubEspecieNN(data_file, path_to_files, scale)
addpath(genpath('./Functions'));

%override for test's
path_to_files = './Tema 1 - RN\Folhas_1';
scale = 100;
data_file = '.\Tema 1 - RN\ClassificaçãoFolhas.xlsx';
    
%Data Extration -----------------------------------------------------------
    %- Images
tstart = tic;%timer
imagens = LoadImages(path_to_files, scale);
imagens = UpdateImages(imagens,data_file, scale);
    %- Input and Output Generation
input = inputImages(imagens);
target = targetCodigoSubEspecie(imagens);
data_extration = toc(tstart); %timer

%Run Especie NN -----------------------------------------------------------
nstart = tic;
[redeNeuronal data pTotal pTeste] = especieNeuralNetwork(input, target);
cnn_extration = toc(nstart);
%view(redeNeuronal);
%disp(data)

timers = {data_extration;cnn_extration};
precision = {pTotal; pTeste};

% %---------------------------------------------------

end