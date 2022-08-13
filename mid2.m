%t    y    dy/dt     tm       ym
clc
clear all
dydt=@(t,y) y*x^2-1.1*y;
h=0.5;
t=0:h:2;
y0=1;
n=length(t);
y=zeros(size(t));
y(1)=y0;
for i=1:n-1

h=t(i+1)-t(i);
ymp=y(i)+dydt(t(i),y(i))*h/2;
phi=dydt(t(i)+h/2,ymp);
y(i+1)=y(i)+phi*h;
        fprintf('\n %0.4f \t %0.4f \t %0.4f \t %0.4f\t %0.4f',t(i),y(i),dydt(t(i),y(i)),t(i)+h/2,ymp);

end
