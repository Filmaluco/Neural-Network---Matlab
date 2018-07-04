function matriz = rotateThisImage(matriz)

ta = size(matriz);
disp('1,1');
disp(ta(1,1));
disp('1,2');
disp(ta(1,2));
%TA(1,1) -> Largura
if ta(1,1)+(ta(1,1)*0.35) < ta(1,2)
    disp('Rodou!')
    matriz = imrotate(matriz,90);
end

