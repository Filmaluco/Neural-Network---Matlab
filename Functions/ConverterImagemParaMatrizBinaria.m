
path

imagefiles = dir('../Tema 1 - RN/Folhas_1/*.jpg');      
nfiles = length(imagefiles)    % Number of files found

for i=1:nfiles
   currentfilename = imagefiles(i).name;
   currentimage = imread(currentfilename);
   images{i} = currentimage;
end
