classdef Linear < Given 
    properties
        A;
        B;
        C;
        D;
    end
    methods
        function obj = Linear(p, x)
            obj.p = p;
            obj.A = obj.getA(x);
            obj.B = obj.getB(x);
            obj.C = obj.getC(x);
            obj.D = obj.getD(x);
        end
        
        function setMatrix(obj, x)
            obj.A = obj.getA(x);
            obj.B = obj.getB(x);
            obj.C = obj.getC(x);
            obj.D = obj.getD(x); 
        end  
        
        function lmd = dslyRoots(obj, M)
            lmd = roots(poly(eval(['obj.' M])));
            figure, 
                plot(real(lmd), imag(lmd), '*')
        end
        
        function [xx, yy, tt] = graph(obj, Pref)
            tt = Pref.T0:Pref.h:Pref.T;
            [yy, xx] = obj.lmsim(tt, Pref.X0, Pref.U);
        end
    end
    
    methods (Access = private)
        
        function [y,x]=lmsim(obj,t,x0,u)
            h=t(2)-t(1);
            [m,n] = size(obj.A);
            [m,nb] = size(obj.B);
            s = expm([[obj.A obj.B]*h; zeros(nb,n+nb)]);
            p = s(1:n,1:n);
            g = s(1:n,n+1:n+nb);
            x =(ltitr(p,g,u',x0'))';
            y = obj.C*x+obj.D*u;
        end
        
        function A = getA(obj, x)
            A = [-1/(obj.W*obj.Ph)*(obj.i_n*Given.dpol(obj.p,x(1))*(obj.R_ya+obj.R_v)+obj.Ce*x(2)*obj.w_n*obj.Ph) -obj.Ce*obj.w_n/obj.W*x(1);
            obj.Cm*obj.Ph*obj.i_n/(obj.J*obj.w_n)*Given.dpol([obj.p 0],x(1)) 0];
        end
        
        function B = getB(obj, x)
            B = [ obj.Uc_n/(obj.W*obj.Ph) 0;
                    0 obj.Mc_n/(obj.J*obj.w_n)];
        end
        
        function C = getC(obj, x)
            C = [Given.dpol(obj.p, x(1))*obj.i_n 0;
                   obj.Ph 0];
        end
        
        function D = getD(obj, x)
            D = [0 0; 0 0];
        end
    end
    
    
end

