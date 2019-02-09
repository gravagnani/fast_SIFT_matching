function D = create_dataset_descriptors(inputFiles)
    
    
    j = 1;

    for input = inputFiles
               
        [image, descrips, locs] = sift(input);
        
        for i = 1 : size(descrips, 1)
            d = descriptor;
            d.val = descrips(i, :);
            d.loc = locs(i, :);
            D(j) = d;
            j = j + 1;
        end
        
    end
    
    D = transpose(D);
    
end