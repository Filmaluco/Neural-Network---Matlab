function [especie subespecie] = nnOutputToSpecieCode (output, connection)
tam = size(connection);
[valor linha] = max(output);
especie = connection(linha,1);
especie = especie{1,1};
subespecie = connection(linha,2);
subespecie = subespecie{1,1};


end