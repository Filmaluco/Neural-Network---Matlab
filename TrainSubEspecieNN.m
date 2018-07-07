function [redeNeuronal data timers precision input target imagens] = TrainSubEspecieNN(data_file, path_to_files, scale)
addpath(genpath('./Functions'));
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
target = targetCodigoSubEspecie(imagens);
data_extration = toc(tstart); %timer

%Run Especie NN -----------------------------------------------------------
nstart = tic;
[redeNeuronal data pTotal pTeste] = subEspecieNeuralNetwork(input, target);
cnn_extration = toc(nstart);
%view(redeNeuronal);
%disp(data)
writeTest(2,10,'radbasn',data.trainFcn,strcat(data.divideFcn,' =(0.4,0.4,0.2)'),cnn_extration,'fitnet',pTotal,pTeste);
timers = {data_extration;cnn_extration};
precision = {pTotal; pTeste};

% %---------------------------------------------------


end