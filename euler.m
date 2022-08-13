%t   y   dy/dt
clc
clear all 
f=@(x,y) y*x^2-1.1*y;
h=0.5;
x=0:h:2;

y(1)=1;

n=length(x);
            fprintf('\n %0.4f \t %0.4f \t %0.4f ',x(1),y(1),f(x(1),y(1)));

for i=2:n
    y(i)=y(i-1)+h.*f(x(i-1),y(i-1));
            fprintf('\n %0.4f \t %0.4f \t %0.4f ',x(i),y(i),f(x(i),y(i)));

end