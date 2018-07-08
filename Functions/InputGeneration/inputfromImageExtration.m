function output = inputfromImageExtration(imagens, scale)

    percentage = 0.1; %percentage of strongest points
    scale = floor(scale*percentage);

    nr_imagens = size(imagens);
    nr_imagens = nr_imagens(1,2);
   
    index = 0;
   min_points = 100;
    
    for i = 1 : nr_imagens
        if  strcmp(imagens(i).especie,'Not Defined') ~= 1;
            index = index + 1;
            
            points = detectHarrisFeatures(imagens(i).matriz);
            points = points.selectStrongest(scale).Location;
            
            size_points = size(points);
            size_points = size_points(1,1);
            
            if size_points < min_points
                min_points = size_points;
            end

        end
    end
    
   index = 0;
    
    for i = 1 : nr_imagens
        if  strcmp(imagens(i).especie,'Not Defined') ~= 1;
            index = index + 1;
            
            points = detectHarrisFeatures(imagens(i).matriz);
            points = points.selectStrongest(scale).Location;
            
            points = points(:);
            output(:,index) = points;


        end
    end
end