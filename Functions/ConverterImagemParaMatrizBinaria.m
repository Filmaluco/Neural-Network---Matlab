function A=ConverterImagemParaMatrizBinaria(PATH)
A=imread(PATH);

ta = size(A);

for i=1:ta(1,1) 
    for j=1:ta(1,2)    
        if(A(i,j)<125)     
            A(i,j)=0;  %0 -> PRETOer
        else
            A(i,j)=1;   % 1 -> BRANCO
        end
    end
end


end

