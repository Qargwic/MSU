function [p, SKO, epsl] = polinom(Given, deg)
    %Ph = [0 12 18 24 36 48 60 72 84]';
    Ph_n = [0 0.58 0.8 0.91 1.07 1.21 1.35 1.47 1.58]';
    Ph = Ph_n*Given.Ph;
    I = [0 20 30 40 60 80 100 120 140]';
    F = [0 1200 1800 2400 3600 4800 6000 7200 8400]';
    F_n = I/Given.i_n;
    
    Gn = [];
    G = [];
    for i = 1:2:deg+1
        Gn = [Gn Ph_n.^i];
        G = [G Ph.^i];
    end
    
    Cn = inv(Gn'*Gn)*Gn'*F_n;
    C = inv(G'*G)*G'*F;
    
    p = zeros(2,deg+1);
    for i = 1:length(Cn)
        p(1,i*2-1) = Cn(length(Cn)-i+1);
        p(2,i*2-1) = C(length(Cn)-i+1);
    end
    
    epsl(1,:) = F_n - polyval(p(1,:), Ph_n);
    epsl(2,:) = F - polyval(p(2,:), Ph);
    %zeros(2,length(Ph));
    
    SKO = sum(epsl.^2)/length(epsl(1,:));
    
end

