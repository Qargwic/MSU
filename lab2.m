p = polinom(5);
S = Stat(p(1,:));
P = Preference;
G = Graphic;

P.setU(1, 0.75, 0.05, 1.25);
P.eps = 0.001;
[xx, uu] = S.graph(P);
G.setGs(uu(1,:), xx);

G.draw(1); 
G.clear;
figure()
    
P.eps = 0.1;
P.setU(2, 0.75, 0.05, 1.25);
[xx, uu] = S.graph(P);
G.setGs(uu(2,:), xx);
G.draw(1);