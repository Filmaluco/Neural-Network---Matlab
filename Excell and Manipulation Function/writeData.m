function [excel,l] = writeData( savedData )
margem = 5;
sheet = 1;
xlRange = 'B4:N36'; %Célula do Início e Célula do Fim
excel = xlsread('SubSpecieData.xlsx',sheet,xlRange); %Ler do ficheiro excell
tSize = size(excel); % X = tSize(1,1) // Y = tSize(1,2)
%line ={2,'5,5','tansig,tansig,purelin','trainlm', 'dividerand = \n {0.7,0.15,.0.15','tempo','tipologia',' ',98,100};

topologia = savedData.SimulationUsed.name;
hiddenLayers = savedData.SimulationUsed.numLayers;
neuronios = savedData.SimulationUsed.Layers{1,1}.size;
fAtiv = savedData.SimulationUsed.Layers{1,1}.transferFcn;
fTrain = savedData.SimulationUsed.trainFcn;
Divisao = [savedData.SimulationUsed.divideParam.trainRatio, savedData.SimulationUsed.divideParam.valRatio,  savedData.SimulationUsed.divideParam.testRatio];

Tempo = savedData.time;
DataSet = savedData.dataSetUsed;
nrFolhas = savedData.nrFolhas;
especiesCertas = (savedData.especiesCertas/nrFolhas)*100;
sub_especiesCertas = (savedData.subEspeciesCertas/nrFolhas)*100;


line={topologia, hiddenLayers, neuronios, fAtiv, fTrain, mat2str(Divisao), ' ', Tempo, ' ', DataSet{1,1}, nrFolhas, especiesCertas, sub_especiesCertas};
display(line);
   %Algoritmo para saber onde vai escrever
   l = tSize(1,1) + margem;
   l = num2str(l);
   x = strcat('B',l);
   x = strcat(x,':');
   y = strcat('N',l);
   
   %Escrever na range "xlRange"
   xlRange=strcat(x,y);
   %fprintf('(%d,%d)',tSize(1,1),tSize(1,2));
   xlswrite('SubSpecieData.xlsx',line,sheet,xlRange);
   
end

