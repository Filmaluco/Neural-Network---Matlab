 function rotatedImage = ImageRotation(PATH)
% Read in the color demo image.
[rgbImage, colorMap] = imread(PATH);

grayImage = rgbImage(:, :, 1);

theta = 0:180;
[R,xp] = radon(grayImage,theta);

maxR = max(R(:));
disp('ColumOfxMax');
disp(columnOfMax);
[rowOfMax, columnOfMax] = find(R == maxR)
rotatedImage = imrotate(rgbImage, -columnOfMax);
rotatedImage = imrotate(rgbImage, -columnOfMax+90);

imshow(rotatedImage);

end