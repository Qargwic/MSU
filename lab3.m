p = polinom(3);
p = p(1,:);
D = Dynamic(p);
P = Preference;
G = Graphic;
[xx, yy, t] = D.graph(P, [1 1.2]);
G.setGs(t, xx);
G.draw(1);