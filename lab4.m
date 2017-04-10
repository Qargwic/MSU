clear;
x0 = {[1.54 0.3619]; [1.489 0.3836]; [1.438 0.4075]};%0,10,20
p = polinom(3); 
p = p(1,:); 
D = Dynamic(p);
L = Linear(p, x0{1});
P = Preference; 
G = Graphic;
P.T = 0.09;

%Изменение  воздействия на 20% и 30%
for i = 0.2:0.1:0.3;
    figure()
    P.X0 = [0; 0];
    P.U = [i; 0];
    [yy, xx, t] = L.graph(P);
    P.X0 = [0; 0];
    P.U = [1+i; 1];
    [xx1, yy1, t1] = D.graph(P);
    G.setG(t,xx(1,:)+ 1.54,'r', t1, xx1(1,:));
    G.setG(t,xx(2,:) + 0.3619,'r', t1, xx1(2,:));
    G.setNs('x1(t)', 'x2(t)');
    G.draw(1);
    G.clear;
end
%Изменение  x1 на 10%, 20% и 30%
for i = 0.1:0.1:0.3;
    figure()
    P.X0 = [i; 0];
    P.U = [0; 0];
    [yy, xx, t] = L.graph(P);
    P.X0 = [(i+1)*1.54; 0.3619];
    P.U = [1; 1];
    [xx1, yy1, t1] = D.graph(P);
    G.setG(t,xx(1,:)+ 1.54,'r', t1, xx1(1,:));
    G.setG(t,xx(2,:) + 0.3619,'r', t1, xx1(2,:));
    G.setNs('x1(t)', 'x2(t)');
    G.draw(1);
    G.clear;
end
%Изменение  x2 на 10%, 20% и 30%
for i = 0.1:0.1:0.3;
    figure()
    P.X0 = [0; i];
    P.U = [0; 0];
    [yy, xx, t] = L.graph(P);
    P.X0 = [1.54; (i+1)*0.3619];
    P.U = [1; 1];
    [xx1, yy1, t1] = D.graph(P);
    G.setG(t,xx(1,:)+ 1.54,'r', t1, xx1(1,:));
    G.setG(t,xx(2,:) + 0.3619,'r', t1, xx1(2,:));
    G.setNs('x1(t)', 'x2(t)');
    G.draw(1);
    G.clear;
end