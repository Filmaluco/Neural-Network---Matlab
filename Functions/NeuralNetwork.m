function [net,tr,accuracyTotal,accuracyTeste] = especieNeuralNetwork(NNparam,input, target)
% CRIAR E CONFIGURAR A REDE NEURONAL
% INDICAR: N? camadas escondidas e nos por camada escondida
% INDICAR: Funcao de treino: {'trainlm', 'trainbfg', traingd'}
% INDICAR: Funcoes de ativacao das camadas escondidas e de saida: {'purelin', 'logsig', 'tansig'}
% INDICAR: Divisao dos exemplos pelos conjuntos de treino, validacao e teste

switch NNparam.topologia
    case 'feedfowardnet' 
        net = feedforwardnet(NNparam.neuronios, NNparam.fTreino);    
    case 'patternnet' 
        net = patternnet(NNparam.neuronios, NNparam.fTreino);
    case 'cascadeforwardnet' 
        net = cascadeforwardnet(NNparam.neuronios, NNparam.fTreino);
    case 'fitnet' 
        net = fitnet(NNparam.neuronios, NNparam.fTreino);       
end



net.layers{2}.transferFcn = NNparam.fAtivacao;

net.divideFcn = 'divideblock';
net.divideParam.trainRatio = NNparam.trainRatio;
net.divideParam.valRatio = NNparam.valRatio;
net.divideParam.testRatio = NNparam.testRatio;

net.trainParam.max_fail = NNparam.max_fail;


% COMPLETAR A RESTANTE CONFIGURACAO


% TREINAR
[net,tr] = train(net, input, target);
%------------------------- DEBUG
%view(net); 
%------------------------- DEBUG
%disp(tr);  
% SIMULAR
out = sim(net, input);


%VISUALIZAR DESEMPENHO
%------------------------- DEBUG
%plotconfusion(target, out) % Matriz de confusao
%------------------------- DEBUG
%plotperf(tr)         % Grafico com o desempenho da rede nos 3 conjuntos           


%Calcula e mostra a percentagem de classificacoes corretas no total dos exemplos
r=0;

for i=1:size(out,2)               % Para cada classificacao  
  [a b] = max(out(:,i));          %b guarda a linha onde encontrou valor mais alto da saida obtida
  [c d] = max(target(:,i));       %d guarda a linha onde encontrou valor mais alto da saida desejada
  if b == d                       % se estao na mesma linha, a classificacao foi correta (incrementa 1)
      r = r+1;
  end
end

accuracyTotal = r/size(out,2)*100;
%------------------------- DEBUG
fprintf('Precisao total %f\n', accuracyTotal)


% SIMULAR A REDE APENAS NO CONJUNTO DE TESTE
TInput = input(:, tr.testInd);
TTargets = target(:, tr.testInd);

out = sim(net, TInput);


%Calcula e mostra a percentagem de classificacoes corretas no conjunto de teste
r=0;
for i=1:size(tr.testInd,2)        % Para cada classificacao  
  [a b] = max(out(:,i));          %b guarda a linha onde encontrou valor mais alto da saida obtida
  [c d] = max(TTargets(:,i));     %d guarda a linha onde encontrou valor mais alto da saida desejada
  if b == d                       % se estao na mesma linha, a classificacao foi correta (incrementa 1)
      r = r+1;
  end
end
accuracyTeste = r/size(tr.testInd,2)*100;
%------------------------- DEBUG
fprintf('Precisao teste %f\n', accuracyTeste)

end
