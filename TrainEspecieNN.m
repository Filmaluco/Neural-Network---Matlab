function [redeNeuronal data timers precision input target imagens] = TrainEspecieNN(data_file, path_to_files, scale)
addpath(genpath('./Functions'));

redeNeuronal = 1;
data= 1;
timers= 1;
input= 1;
target= 1;
imagens= 1;
precision= 1;
%override for test's
path_to_files = './Tema 1 - RN\Folhas_1';
scale = 175;
data_file = '.\Tema 1 - RN\ClassificaçãoFolhas.xlsx';
    
%Data Extration -----------------------------------------------------------
    %- Images
tstart = tic;%timer
imagens = LoadImages(path_to_files, scale);
imagens = UpdateImages(imagens,data_file, scale);
    %- Input and Output Generation
input = inputImages(imagens);
target = targetCodigoEspecie(imagens);
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