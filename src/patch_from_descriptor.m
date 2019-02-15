function patch = patch_from_descriptor(image, descriptor)

    x = descriptor.loc(2);
    y = descriptor.loc(1);
    scale = 3*descriptor.loc(3);
    orientation = descriptor.loc(4);
    
    % crop image
    j = imcrop(image, [x-2*scale y-2*scale 4*scale 4*scale]);
%     figure;
%     imshow(j);
    % rotate
    j = imrotate(j, -orientation * (180/pi));
%     figure;
%     imshow(j);
    % crop again
    patch = imcrop(j, [size(j,2)/2-scale size(j,1)/2-scale 2*scale 2*scale]);
%     figure;
%     imshow(patch);
    
end