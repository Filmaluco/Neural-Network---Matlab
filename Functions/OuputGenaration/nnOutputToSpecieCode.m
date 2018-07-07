function output = nnOutputToSpecieCode (output, species)
tam = size(species);
[valor linha] = max(output);
output = species(linha);



end