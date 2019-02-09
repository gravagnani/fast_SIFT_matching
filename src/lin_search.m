% D dataset
% Q query descriptor
% K nearest descriptors
function neighbors = lin_search(D, Q, K)

    % run bubble sort K times
    
    for i = 1 : K
        for j = size(D, 1) : -1 : i + 1
            if(norm(D(j).val - Q.val) < norm(D(j - 1).val - Q.val))
               % swap D(j) and D(j-1)
               temp = D(j);
               D(j) = D(j - 1);
               D(j - 1) = temp;
            end
        end
    end
    
    neighbors = [];
    for i = 1 : K
        neighbors = [neighbors; D(i)];
    end

end