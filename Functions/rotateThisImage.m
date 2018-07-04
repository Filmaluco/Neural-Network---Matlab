function matriz = rotateThisImage(matriz)

ta = size(matriz);
if ta(1,1)+(ta(1,1)*0.35) < ta(1,2)
    matriz = imrotate(matriz,90);
end

