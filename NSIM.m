function [yout,xout]=NSIM(obj,F,G,t,u,x0,Method)  

%    Method - method of integration
%             rk4s - 4-th degree Runge-Kutt's method
%             eiler - Eiler's method 
%             eilermod - modified Eiler's method
%
%    23.08.91

x=x0;
h=t(2)-t(1);
n=length(x0);
xout=x;
%yout=feval(G,x,u(:,1),t(1));
yout=feval(G,obj,x,u,t(1));
for j=1:length(t)-1,
  tt=t(j);
  %uu=u(:,j);
  xh=feval(Method,F,tt,h,x,u, obj);
  tt=tt+h;
  x=xh;
  xout=[xout x];
  yout=[yout feval(G,obj,x,u,tt)]; 
end
