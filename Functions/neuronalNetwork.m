function [net,tr] = neuronalNetwork(input, target)





% CRIAR E CONFIGURAR A REDE NEURONAL
% INDICAR: N? camadas escondidas e nos por camada escondida
% INDICAR: Funcao de treino: {'trainlm', 'trainbfg', traingd'}
% INDICAR: Funcoes de ativacao das camadas escondidas e de saida: {'purelin', 'logsig', 'tansig'}
% INDICAR: Divisao dos exemplos pelos conjuntos de treino, validacao e teste

net = feedforwardnet(10); % N Camadas / 1 de camda (?)
%net.layers{1}.size = 10; % N de neurónios (?)

net.layers{1}.transferFcn = 'tansig';  %Função de ativação da camada
%net.layers{2}.transferFcn = 'tansig';
net.layers{2}.transferFcn = 'purelin'; %Função de ativação da camada de saída (?)
net.trainFcn='trainlm';                %Função de treino

%----

% SEGMENTAÇÃO DO DATA SET
net.divideFcn = 'dividerand';  % Função de divisão
net.divideParam.trainRatio = 0.9 ; % Treino
net.divideParam.valRatio = 0.05; % Validação
net.divideParam.testRatio = 0.05; % Teste

%----

% TREINAR
[net,tr] = train(net,input,target);
end
