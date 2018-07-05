function ImagemDataSet=normalizeImage(originalImage, scale) 

%Control Variables
    padding = 10; %padding to garanty that the border is never crossed

tam = size(originalImage);
originalX = tam(1,1);
originalY = tam(1,2);

%even do its rotated the image can have both scenarios
% x > y and x < y 
%this is because do rotation only applies to if it pass's a "limit"
if originalX > originalY
    ImagemDataSet = zeros(originalX + padding);
else
    ImagemDataSet = zeros(originalY + padding);
end

%Get the center of the "moldure"
tam = size(ImagemDataSet);
DataSetCenterX = floor(tam(1,1)/2);
DataSetCenterY = floor(tam(1,2)/2); %...%

%Copy the original image to the center of the "moldure"

im_x = 0;

inicialX = DataSetCenterX - floor(originalX/2);
inicialY = DataSetCenterY - floor(originalY/2);


endX = DataSetCenterX + floor(originalX/2)-1;
endY = DataSetCenterY + floor(originalY/2)-1;


for x = inicialX: endX
    im_x = im_x + 1;
    im_y = 0;
    for y = inicialY: endY
        im_y = im_y + 1;
        ImagemDataSet(x,y) = originalImage(im_x, im_y);
    end
end

ImagemDataSet = imresize(ImagemDataSet, [scale scale]);

end