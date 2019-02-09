classdef tree
    
    properties
        
        root = node;
        
    end
    
    methods
       
        function r = get_root(obj)
            r = obj.root;
        end
        
        function set_root(obj, r)
            root = r;
        end
        
    end
    
end