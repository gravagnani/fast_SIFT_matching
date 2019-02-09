% D = list of descriptors
% K = branching factor
% S_l = max leaf size

function T = create_tree(D, K, S_l)
    
    T = tree;
    root = node;
    root.descriptor_set = D;
                    %set_descriptor_set(root, D);
    T.root = root;
                    %set_root(T, root);
    T.root = create_tree_supp(T.root, K, S_l);
    
                    %disp("finish");

end



function N = create_tree_supp(n, K, S_l)
    N = n;
    DS = n.descriptor_set;
    if size(DS, 1) < S_l
        % create leaf node with the points in D
        leaf = node;
        leaf.descriptor_set = DS;
        % add leaf node as child
        N.children = leaf;
        return;
    else
        % P ? select K points at random from D
        P = DS(randperm(size(DS, 1), K));
        % C ? cluster the points in D around nearest centers P
        % actually I add them directly to their own node
        for i = 1 : 1 : K
           C(i) = node;
           C(i).value = P(i);
        end
        
        for i = 1 : 1 : size(DS, 1)
            min = 1;
            for j = 2 : 1 : size(P, 1)
               if norm(DS(i).val - P(j).val) <  norm(DS(i).val - P(min).val)
                    min = j;
               end
            end
            C(min).descriptor_set = [C(min).descriptor_set; DS(i)];
        end
        % add the list of the nodes to the children list of the node        
        % and recursively apply the algorithm to the points in Ci
        for c = C
            N.children = [N.children; create_tree_supp(c, K, S_l)];
        end
        
    end
end