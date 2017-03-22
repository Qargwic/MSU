classdef Graphic < handle
  
    properties
        YY = cell(1,10);
        XX = cell(1,10);
        groups = [];
        names = cell(1,10);
        type = cell(1,10);
        stType = 'b';
        stName = '';
        count = 0;
        gr = 0;
    end
    
    methods
        
        function draw(obj, x)
            c = obj.count;
            l = ceil(c/x);
            a = 1;
            for i = 1:c
               subplot(l,x,i); 
               hold on
               grid on
               for j = 1:obj.groups(i)
                if ischar(obj.type{a})
                	plot(obj.XX{a}, obj.YY{a}, obj.type{a}); 
                else
                    plot(obj.XX{a}, obj.YY{a}, obj.stType);
                end
                a = a + 1;
               end
               if ischar(obj.names{i})
                   title(obj.names{i});
               end
            end
        end
        
        function setG(obj, varargin)
            obj.count = obj.count + 1;
            obj.groups(obj.count) = 0;
            nc = 0;
            j = obj.gr;
            
            st = 1;
            if ischar(varargin{1})
                st = 2;
                obj.names{obj.count} = varargin{1};
            end
            
            for i = st:nargin-1
                a = varargin{i};
                if ischar(a)
                    obj.type{j} = a;
                else
                    nc = nc + 1;
                    if mod(nc,2) == 0
                        obj.YY{j} = a;
                    else
                        j = j + 1;
                        obj.gr = obj.gr + 1;
                        obj.groups(obj.count) = obj.groups(obj.count) + 1;
                        obj.XX{j} = a;
                    end
                end
            end
        end
        
        function clear(obj)
            obj.YY = cell(1,10);
            obj.XX = cell(1,10);
            obj.groups = [];
            obj.names = cell(1,10);
            obj.type = cell(1,10);
            obj.count = 0;
            obj.gr = 0;
        end
        
    end
    
end

