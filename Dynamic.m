classdef Dynamic < Given
    properties
        maxTime = 1;
        maxSteps = 20;
        epsl = 0.01;
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
        
        function [xx, yy, tt] = graph(obj, Method, U, t0, h, x0)
            [xx, yy, tt] = obj.nsim(t0, h, U, x0, Method);
        end
   
    end
    
    methods(Access = private)
        function [xout, yout, t] = nsim(obj, t0, h, u, x0, Method)
            i = 0;
            x = x0;
            xout=x;
            yout = obj.fun_F(x, u, t0);
            last = [xout; yout];
            tt = t0;
            while true
              switch(Method)
                  case Methods.Eiler 
                      xh = obj.eiler(tt,h,x,u);
              end
              x = xh;
              tt = tt+h;
              y = obj.fun_G(x, u, tt);
                            
              xout = [xout x];
              yout = [yout y];

              if abs(sum(last - [x; y])) < obj.epsl
                  i = i + 1;
              else
                  i = 0;
              end
              if i >= obj.maxSteps || tt>obj.maxTime
                  t = t0:h:tt;
                  return
              end
              last = [x; y];
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

