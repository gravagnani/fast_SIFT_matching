function show_keypoints(image, descriptors)

    imshow(image);
    for i = 1 : size(descriptors, 1)
        locs = descriptors(i).loc;
        hold on;
        plot(locs(i, 2), locs(i, 1), 'go', 'MarkerSize', 2*locs(i, 3));
        line([locs(i, 2) locs(i, 2)+locs(i, 3)*(cos(locs(i, 4)))], [locs(i, 1) locs(i, 1)+locs(i, 3)*(sin(locs(i, 4)))], 'Color', 'green');
    end

end