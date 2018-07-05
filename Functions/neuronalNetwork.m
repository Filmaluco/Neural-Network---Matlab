function [net,tr] = neuronalNetwork(input, target)

% CRIAR E CONFIGURAR A REDE NEURONAL
% INDICAR: N? camadas escondidas e nos por camada escondida
% INDICAR: Funcao de treino: {'trainlm', 'trainbfg', traingd'}
% INDICAR: Funcoes de ativacao das camadas escondidas e de saida: {'purelin', 'logsig', 'tansig'}
% INDICAR: Divisao dos exemplos pelos conjuntos de treino, validacao e teste

net = feedforwardnet(100,'trainrp');

net.layers{2}.transferFcn = 'tansig';

net.divideFcn = 'dividerand';
net.divideParam.trainRatio = 0.4;
net.divideParam.valRatio = 0.4;
net.divideParam.testRatio = 0.2;


% COMPLETAR A RESTANTE CONFIGURACAO


% TREINAR
[net,tr] = train(net, input, target);
%view(net);
%disp(tr)
% SIMULAR
out = sim(net, input);


%VISUALIZAR DESEMPENHO

plotconfusion(target, out) % Matriz de confusao

plotperf(tr)         % Grafico com o desempenho da rede nos 3 conjuntos           


%Calcula e mostra a percentagem de classificacoes corretas no total dos exemplos
r=0;
for i=1:size(out,2)               % Para cada classificacao  
  [a b] = max(out(:,i));          %b guarda a linha onde encontrou valor mais alto da saida obtida
  [c d] = max(target(:,i));  %d guarda a linha onde encontrou valor mais alto da saida desejada
  if b == d                       % se estao na mesma linha, a classificacao foi correta (incrementa 1)
      r = r+1;
  end
end

accuracy = r/size(out,2)*100;
fprintf('Precisao total %f\n', accuracy)


% SIMULAR A REDE APENAS NO CONJUNTO DE TESTE
TInput = input(:, tr.testInd);
TTargets = target(:, tr.testInd);

out = sim(net, TInput);


%Calcula e mostra a percentagem de classificacoes corretas no conjunto de teste
r=0;
for i=1:size(tr.testInd,2)               % Para cada classificacao  
  [a b] = max(out(:,i));          %b guarda a linha onde encontrou valor mais alto da saida obtida
  [c d] = max(TTargets(:,i));  %d guarda a linha onde encontrou valor mais alto da saida desejada
  if b == d                       % se estao na mesma linha, a classificacao foi correta (incrementa 1)
      r = r+1;
  end
end
accuracy = r/size(tr.testInd,2)*100;
fprintf('Precisao teste %f\n', accuracy)

end
