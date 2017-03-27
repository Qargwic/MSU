classdef Preference < handle

    properties
        X0 = [1; 1];
        U = [1; 1];
        T0 = 0;
        h = 0.001;
        T = 1;
        Method = Methods.Eiler;
    end
    
    methods
        
    	function setU(obj, ind, uo, step, en)
    		u = uo:step:en;
    		if ind == 1
    			obj.U = [u ;ones(1, length(u))];
    		else
    			obj.U = [ones(1, length(u)); u];
    	end
        end
    end
    
end

