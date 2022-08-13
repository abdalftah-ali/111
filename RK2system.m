%t     y      z
clear
clc
f=@(y,u,t)  u;
g=@(y,u,t) -0.6*u-8*y;
h=0.5;
t=0:h:5;
y(1)=4;
u(1)=0;
n=length(t);
 fprintf('\n %0.4f \t %0.4f \t %0.4f \t %0.4f \t %0.4f \t %0.4f\t  %0.4f \t %0.4f \t %0.4f \t %0.4f \t %0.4f  ',t(1),y(1),u(1));
for i=2:n
    k1(i)=h.*f(y(i-1),u(i-1),t(i-1));
    l1(i)=h.*g(y(i-1),u(i-1),t(i-1));
    k2(i)=h.*f(y(i-1)+k1(i)/2,u(i-1)+l1(i)/2,t(i-1)+h/2);
    l2(i)=h.*g(y(i-1)+k1(i)/2,u(i-1)+l1(i)/2,t(i-1)+h/2);
    k3(i)=h.*f(y(i-1)+k2(i)/2,u(i-1)+l2(i)/2,t(i-1)+h/2);
    l3(i)=h.*g(y(i-1)+k2(i)/2,u(i-1)+l2(i)/2,t(i-1)+h/2);
    k4(i)=h.*f(y(i-1)+k3(i),u(i-1)+l3(i),t(i-1)+h);
    l4(i)=h.*g(y(i-1)+k3(i),u(i-1)+l3(i),t(i-1)+h);
    y(i)=y(i-1)+(1/6)*(k1(i)+(2*k2(i))+(2*k3(i))+k4(i));
    u(i)=u(i-1)+(1/6)*(l1(i)+(2*l2(i))+(2*l3(i))+l4(i));
 fprintf('\n %0.4f \t %0.4f \t %0.4f \t %0.4f \t %0.4f \t %0.4f\t  %0.4f \t %0.4f \t %0.4f \t %0.4f \t %0.4f  ',t(i),y(i),u(i));


end