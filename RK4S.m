function xh=rk4s(F,t,h,x,u)
%
%   one-step integration of nonlinear equations system
%   by 4-th degree Runge-Kutt's method
%   subfunction of NSIM
%   
%         x(t) = F(x,u,t)   , x(t0) = x0
%
%
%               xh=rk4s(F,t,h,x,u)
%
%
%    F - name of function which calculates right part of equations system
%         function y=F(x,u,t) have following input variables:
%	           x - system state vector (column);
%	           u - vector of controls (column),
%		       t - current time (number)
%        function calculates vector-column of gradients.
%    t - current time (number)
%    h - step of integration
%    u - current vector of controls (column)
%  
%
%    23.08.91
%
a=[0.5*h 0.5*h h h 0.5*h]';
th=t;
xh=x;
w=x;
for i=1:4,
z=feval(F,w,u,th);
th=t+a(i);
xh=xh+a(i+1)*z/3.0;
w=x+a(i)*z;
end

