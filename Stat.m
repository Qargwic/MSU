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
                1/(J*w_n)*(Cm*Ph*i_n*(p(1)*x(1)*x(1)*x(1)*x(1)+p(3)*x(1)*x(1))-U(2)*Mc_n)];
        end
        
        function z = fun_G(obj, x, U)
            z = [-1/(obj.W*obj.Ph)*(obj.i_n*(obj.R_ya+obj.R_v)*(p(1)*3*x(1)^2+p(3))+obj.Ce*x(2)*obj.w_n*x(1)*obj.Ph) -obj.Ce*obj.w_n*obj.Ph/(obj.W*obj.Ph)*x(1);
                obj.Cm*obj.Ph*obj.i_n/(obj.J*obj.w_n)*(obj.p(1)*4*x(1)^3+obj.p(3)*2*x(1)) 0];
        end
        
        function [xx, uu] = graph(obj, Pref, count)
            xx = Pref.X0;
            for i:1:length(Pref.U(1,:));
              x = obj.nsim(Pref.T0, Pref.h, Pref.U, Pref.X0, Method);
              xx = [xx x];
            end
            u = Pref.U;

        end
   
    end
    
    methods(Access = private)
        function x = newton(obj, x0, u, e)
            t=0;
            y = obj.fun_F(x0, u);
            x = x0;
            while(norm(y) > e)
                x = obj.fun_G(x, u);
                x = x - inv(gr)*y;
                y = obj.fun_F(x, u); 
            end
        end
        
    end
    
end

