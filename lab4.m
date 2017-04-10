clear;
x0 = {[1.54 0.3619]; [1.489 0.3836]; [1.438 0.4075]};%0,10,20
p = polinom(5); 
p = p(1,:); 
D = Dynamic(p);
L = Linear(p, x0{1});
P = Preference; 
G = Graphic;

t = 0:0.001:0.08;
[yy, xx] = L.graph(t,P);
P.X0 = [0;0];
[xx1, yy1, t1] = D.graph(P);
t1 = t1(1:length(t1)-9);
xx1 = xx1(:,10:length(xx1(1,:)));
yy1 = yy1(:,10:length(yy1(1,:)));
G.setG(t,xx(1,:)+2,'r', t1, xx1(1,:));
G.setG(t,xx(2,:)-0.35,'r', t1, xx1(2,:));
G.setG(t,yy(1,:)+210,'r', t1, yy1(1,:));
G.setG(t,yy(2,:)+0.02,'r', t1, yy1(2,:));
G.draw(1);