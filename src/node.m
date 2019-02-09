classdef node
    
    properties
       
        value = []
        descriptor_set = []
        children = []
        
    end
    
    
    methods
       
        function c = get_children(obj)
            c = obj.children;
        end
        
        function d = get_descriptor_set(obj)
            d = obj.descriptor_set;
        end
        
        function add_child(obj, ch)
            obj.children = [obj.children; ch];
        end
        
        function set_children_set(obj, ch)
            obj.children = ch;
        end
        
        function set_descriptor_set(obj, desc_set)
            obj.descriptor_set = desc_set;
        end
        
        function add_descriptor(obj, desc_set)
            obj.descriptor_set = [obj.descriptor_set; desc_set];
        end
        
    end
    
end