function show_keypoints(image, descriptors)

    imshow(image);
    for i = 1 : size(descriptors, 1)
        locs = descriptors(i).loc;
        hold on;
        plot(locs(2), locs(1), 'go', 'MarkerSize', 3*locs(3));
        line([locs(2) locs(2)+locs(3)*(cos(locs(4)))], [locs(1) locs(1)+locs(3)*(sin(locs(4)))], 'Color', 'green');
    end

end