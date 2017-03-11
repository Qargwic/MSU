function [y,x]=lmsim(a,b,c,d,t,x0,u)
%
%    simulation of linear system 
%
%          dx(t)/dt=Ax(t)+Bu(t)
%              y(t)=Cx(t)+du(t)
%
%          x(0)=x0
%       
%          t -  vector-string of simulation time
%          x0 - vector-column of initial conditions
%          u - matrice of controls (number of columns is equal to length of vector t
%                                    number of strings is equal to number of outputs)
%
%
h=t(2)-t(1);
% matrix exponent
[m,n] = size(a);
[m,nb] = size(b);
s = expm([[a b]*h; zeros(nb,n+nb)]);
p = s(1:n,1:n);
g= s(1:n,n+1:n+nb);
%
% time process
%
x=(ltitr(p,g,u',x0'))';
y=c*x+d*u;
