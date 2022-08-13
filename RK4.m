%x   y   k1   k2   k3   k4    phi
clc
clear all
dydt=@(t,y) -0.6*y+10*exp(-(t-2)^2/(2*0.075^2));
h=0.5;
t=0:h:4.5;
y0=1;
n=length(t);
y=zeros(size(t));
y(1)=y0;
for i=1:n-1
k1=dydt(t(i),y(i));
k2=dydt(t(i)+h/2,y(i)+k1*h/2);
k3=dydt(t(i)+h/2,y(i)+k2*h/2);
k4=dydt(t(i)+h,y(i)+k3*h);
phi=1/6*(k1+2*k2+2*k3+k4);
y(i+1)=y(i)+phi*h;

fprintf('\n %0.4f \t %0.4f \t %0.4f \t %0.4f \t %0.4f \t %0.4f\t %0.4f  \t %0.4f',t(i),y(i),k1,k2,k3,k4,phi);



end