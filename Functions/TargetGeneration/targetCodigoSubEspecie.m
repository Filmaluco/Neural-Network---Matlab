function output = targetCodigoSubEspecie(imagens)

   nr_imagens = size(imagens);
    nr_imagens = nr_imagens(1,2);
   
    index = 0;
    for i = 1 : nr_imagens
        if  strcmp(imagens(i).especie,'Not Defined') ~= 1;
            index = index + 1;
            output(:,index) = imagens(i).codigoSubEspecie(:);   
        end
    end


end