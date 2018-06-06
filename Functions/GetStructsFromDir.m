function imagens = GetStructsFromDir(PATH)

 myFolder = '../Tema 1 - RN\Folhas_1';
% myFolder = PATH

if ~isdir(myFolder)
  errorMessage = sprintf('Error: The following folder does not exist:\n%s', myFolder);
  uiwait(warndlg(errorMessage));
  return;
end
filePattern = fullfile(myFolder, '*.jpg');
jpegFiles = dir(filePattern);
for k = 1:length(jpegFiles)
  baseFileName = jpegFiles(k).name;
  split = strsplit(baseFileName,'.');
  id = str2num(split{1,1});
  pathToFile = fullfile(myFolder, baseFileName);
  
    imagens(k).id = id;
    imagens(k).especie = 'Not Defined';
    imagens(k).subEspecie = 'Not Defined';
    imagens(k).path = pathToFile;
    imagens(k).matriz = ConverterImagemParaMatrizBinaria(pathToFile);
    imagens(k).codigoEspecie = [0 0 0];
    imagens(k).codigoSubEspecie = [0 0 0];
 
 
end