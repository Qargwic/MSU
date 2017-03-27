classdef Graphic < handle
  
    properties
        YY = {};
        XX = {};
        groups = [];
        names = {};
        type = {};
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
        
        function setGs(obj, XX, YY)
            for i = 1:length(YY(:,1))
                obj.setG(XX(min(i, length(XX(:,1))),:), YY(i,:));
            end
        end
        
        function setNs(obj, varargin)
            for i = 1:min(nargin - 1, obj.count)
               obj.names{i} = varargin{i};
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
            obj.type{j} = [];%for fix error exceeds index
            obj.names{obj.count} = [];
        end
        
        function clear(obj)
            obj.YY = {};
            obj.XX = {};
            obj.groups = [];
            obj.names = {};
            obj.type = {};
            obj.count = 0;
            obj.gr = 0;
        end
        
    end
    
    methods (Static)
        
    end
    
end

