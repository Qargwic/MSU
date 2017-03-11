classdef Test

    properties
        a;
        p;
    end
    
    methods
        function obj = Test(p)
            obj.p = p;
        end
        
        function z = foo(obj, x, U)
            z = obj.p + x + U;
        end
    end
    
end

