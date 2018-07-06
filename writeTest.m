function [excel,l] = writeTest( nCamadas,nNeurons,fActive,fTrain,Division,time,Tipology,gPrecision,pTeste )
margem = 4;
sheet = 1;
xlRange = 'B4:K25'; %Célula do Início e Célula do Fim
excel = xlsread('Testes.xlsx',sheet,xlRange); %Ler do ficheiro excell
tSize = size(excel); % X = tSize(1,1) // Y = tSize(1,2)
%line ={2,'5,5','tansig,tansig,purelin','trainlm', 'dividerand = \n {0.7,0.15,.0.15','tempo','tipologia',' ',98,100};
line={nCamadas,nNeurons,fActive,fTrain,Division,time,Tipology,' ',gPrecision,pTeste};
   %Algoritmo para saber onde vai escrever
   l = tSize(1,1) + margem;
   l = num2str(l);
   x = strcat('B',l);
   x = strcat(x,':');
   y = strcat('K',l);
   
   %Escrever na range "xlRange"
   xlRange=strcat(x,y);
   %fprintf('(%d,%d)',tSize(1,1),tSize(1,2));
   xlswrite('Testes.xlsx',line,xlRange);
   
end

