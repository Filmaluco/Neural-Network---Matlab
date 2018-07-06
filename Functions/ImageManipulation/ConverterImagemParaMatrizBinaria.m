function matriz=ConverterImagemParaMatrizBinaria(PATH,scale)
matriz=imread(PATH);
 
matriz = rotateThisImage(matriz);
matriz = normalizeImage(matriz, scale);
tam = size(matriz);

    for i=1:tam(1,1) 
        for j=1:tam(1,2)    
            if(matriz(i,j)<125)     
                matriz(i,j)=0;  %0 -> PRETO
            else
                matriz(i,j)=1;   % 1 -> BRANCO
            end
        end
    end

end

