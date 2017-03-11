classdef Dynamic < Given
    properties
        maxTime = 1;
        maxSteps = 20;
        espl = 0.01;
    end
    methods
        function obj = Dynamic(p)
            obj.p = p;
        end
        
        function z = fun_F(obj, x, U, t)
            z = [1/(obj.W*obj.Ph)*(U(1)*obj.Uc_n-obj.i_n*(obj.R_ya+obj.R_v)*polyval(obj.p, x(1))-obj.Ce*x(2)*obj.w_n*x(1)*obj.Ph);
                1/(obj.J*obj.w_n)*(obj.Cm*obj.Ph*obj.i_n*polyval(obj.p, x(1))-U(2)*obj.Mc_n)];
        end
        
        function z = fun_G(obj, x, U, t)
            z = [ obj.i_n*polyval(obj.p, x(1));
                x(1)*obj.Ph ];
        end
        
        function [xx, yy, tt] = graph(obj, Method, U, t, tStep, x0)
            tt = 0:tStep:t;
            [xx, yy] = obj.nsim(tt, U, x0, Method);
        end
   
    end
    
    methods(Access = private)
        function [xout, yout] = nsim(obj, t, u, x0, Method)
            x = x0;
            h=t(2)-t(1);
            xout=x;
            yout = obj.fun_F(x, u, t(1));
            for j=1:length(t)-1,
              tt=t(j);
              switch(Method)
                  case Methods.Eiler 
                      xh = obj.eiler(tt,h,x,u);
              end
              
              tt=tt+h;
              x=xh;
              xout = [xout x];
              yout = [yout obj.fun_G(x, u, tt)]; 
            end
        end
        
        function xh = eiler(obj,t,h,x,u)
            th=t;
            xh=x;
            w=x;
            z = obj.fun_F(w,u,th);
            xh=xh+h*z;
        end
        
    end
    
end

