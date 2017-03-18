classdef Linear < Given
    %UNTITLED2 Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        
        
    end
    methods
        function A = getA(obj, x)
            A = [-1/(obj.W*obj.Ph)*(obj.i_n*Given.dpol(obj.p,x(1))*(obj.R_ya+obj.R_v)+obj.Ce*x(2)*obj.w_n*obj.Ph) -obj.Ce*obj.w_n/obj.W*x(1);
            obj.Cm*obj.Ph*obj.i_n/(obj.J*obj.w_n)*Given.dpol([obj.p 0],x(1)) 0];
        end
        
        function B = getB(obj, x)
            B = [ obj.Uc_n/(obj.W*obj.Ph)      0;
                    0     obj.Mc_n/(obj.J*obj.w_n)];
        end
        
        function C = getC(obj, x)
            C = [Given.dpol(obj.p, x)*obj.i_n 0;
                   obj.Ph 0];
        end
        
        function D = getD(obj, x)
            D = [0 0; 0 0];
        end
    end
    
    methods (Access = private)

    end
    
end

