cass={[1 1];[1 0.8];[1 1.2];[0.8 1];[1.2 1];[0.8 0.8];[1.2 1.2]}; 
p = polinom(3); 
p = p(1,:); 
D = Dynamic(p); 
P = Preference; 
G = Graphic; 
P.X0=[0; 0]; 
for i=1:7 
    figure() 
    [xx, yy, t] = D.graph(P, cass{i}); 
    G.setGs(t,xx) 
    G.setG(t,yy(1,:)); 
    G.setG(xx(1,:),xx(2,:)) 
    G.setNs('Переходный процесс x1(t)',...
        'Переходный процесс x2(t)',...
        'Переходный процесс y(t)',...
        'Фазовый портрет x1(x2)') 
    G.draw(1); 
    G.clear; 
end