function matriz=ConverterImagemParaMatrizBinaria(PATH,scale)
matriz=imread(PATH);
%rotate
%resize
blankimage = zeros(scale);

matriz = rotateThisImage(matriz);
imshow(matriz);
pause(2);
%matriz = imresize(matriz,[scale,scale]);
%imagem = ImageRotation(PATH);
%ta = size(imagem); 
%imshowpair(imagem,matriz,'montage');
 
% while ta(1,2) > scale
%     ta(1,1)= ta(1,1)/2;
%     ta(1,2)=ta(1,2)/2;
%     imagem = imresize(imagem,[ta(1,1),ta(1,2)]);
% end
% for x=1 : ta(1,1)
%     for y =1 : ta(1,2)
%        blankimage(x,y) = imagem(x,y);
%     end
% end
% image(blankimage);
% disp(blankimage);
% pause(2);

  
    

    

pause(2);
ta = size(matriz);
display(ta);

for i=1:ta(1,1) 
    for j=1:ta(1,2)    
        if(matriz(i,j)<125)     
            matriz(i,j)=0;  %0 -> PRETOer
        else
            matriz(i,j)=1;   % 1 -> BRANCO
        end
    end
end


end

