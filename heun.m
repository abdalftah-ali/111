clc
clear all
dydt=@(t,y) y*sin(t)^3;
h=00.1;
t=0:h:3.1;
y0=1;
n=length(t);
y=zeros(size(t));
y(1)=y0;
fprintf('\n x        \t      y \t     k1 \t    dy/dt \t  ye');
for i=1:n-1
    yp=y(i)+dydt(t(i),y(i))*(t(i+1)-t(i));
    dydtp=dydt(t(i+1),yp);
   phi=(dydt(t(i),y(i))+dydtp)/2;
   y(i+1)=y(i)+phi*(t(i+1)-t(i));
           fprintf('\n %0.4f \t %0.4f \t %0.4f \t %0.4f \t %0.4f ',t(i),y(i),dydt(t(i),y(i)),phi,yp);

end

