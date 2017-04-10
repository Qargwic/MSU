classdef Stat < Given
    properties
        maxTime = 1;
        maxSteps = 20;
        epsl = 0.01;
    end
    methods
        function obj = Stat(p)
            obj.p = p;
        end
        
        function z = fun_F(obj, x, U)
            z = [1/(obj.W*obj.Ph)*(U(1)*obj.Uc_n-obj.i_n*(obj.R_ya+obj.R_v)*polyval(obj.p, x(1))-obj.Ce*x(2)*obj.w_n*x(1)*obj.Ph);
                1/(obj.J*obj.w_n)*(obj.Cm*obj.Ph*obj.i_n*polyval([obj.p 0], x(1))-U(2)*obj.Mc_n)];
        end
        
        function z = fun_G(obj, x, U)
            z = [-1/(obj.W*obj.Ph)*(obj.i_n*(obj.R_ya+obj.R_v)*Given.dpol(obj.p, x(1))+obj.Ce*x(2)*obj.w_n*x(1)*obj.Ph) -obj.Ce*obj.w_n*obj.Ph/(obj.W*obj.Ph)*x(1);
                obj.Cm*obj.Ph*obj.i_n/(obj.J*obj.w_n)*Given.dpol([obj.p 0], x(1)) 0];
        end
        
        function [xx, uu] = graph(obj, Pref)
            xx = [];
            x = Pref.X0;
            for i = 1:length(Pref.U(1,:));
              x = obj.newton(x, Pref.U(:,i), Pref.eps);
              xx = [xx x];
            end
            uu = Pref.U;

        end
   
    end
    
    methods(Access = private)
        function x = newton(obj, x0, u, e)
            t=0;
            y = obj.fun_F(x0, u);
            x = x0;
            while(norm(y) > e)
                gr = obj.fun_G(x, u);
                x = x - gr\y;
                y = obj.fun_F(x, u); 
            end
        end
        
    end
    
end

