function [especie subespecie] = nnOutputToSpecieCode (output, listaSubEspecies, connection)
tam = size(connection);
[valor linha] = max(output);

subespecie = listaSubEspecies(linha);

for i = 1 : tam(1,1)
    str2  = connection(i,2);
    if strcmp(subespecie, str2{1,1}) == 1
      especie = connection(i,1);
    end
    
end

especie = especie{1,1};
%subespecie = subespecie{1,1};


end