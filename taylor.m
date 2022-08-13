%  t     y    dy/dt

clear all
clc
dydx=@(x,y) 1-2*y^2-x;
dy2dx2=@(x,y) -4*y+8*y^3+4*y*x-1;
h=0.01
x=0:h:0.03

y(1)=1
%x(1)
n=length(x)
            fprintf('\n %0.4f \t %0.4f \t %0.4f ',x(1),y(1),dydx(x(1),y(1)));

for i=2:n
    y(i)=y(i-1)+h.*dydx(x(i-1),y(i-1))+(h^2/2).*dy2dx2(x(i-1),y(i-1));

            fprintf('\n %0.4f \t %0.4f \t %0.4f ',x(i),y(i),dydx(x(i),y(i)));

end