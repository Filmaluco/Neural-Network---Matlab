function output = targetCodigoSubEspecie(imagens)

    nr_imagens = size(imagens);
    nr_imagens = nr_imagens(1,2);
   
    
    for i = 1 : nr_imagens
       output(:,i) = imagens(i).codigoSubEspecie(:);    
    end

end