%t   y    z    dy/dt     dz/dt       
clc
clear all 
f1=@(x,y,z) -2*y+5*exp(-x);
f2=@(x,y,z) -0.5*y*z^2;
h=0.1;
x=0:h:0.4;
y(1)=2;
z(1)=4;
n=length(x);
fprintf('\n %0.7f \t %0.7f \t %0.7f\t %0.7f \t %0.7f ',x(1),y(1),z(1),f1(x(1),y(1),z(1)),f2(x(1),y(1),z(1)));
for i=2:n
    y(i)=y(i-1)+h.*f1(x(i-1),y(i-1),z(i-1));
    z(i)=z(i-1)+h.*f2(x(i-1),y(i-1),z(i-1));
    fprintf('\n %0.7f \t %0.7f \t %0.7f \t %0.7f \t %0.7f ',x(i),y(i),z(i),f1(x(i),y(i),z(i)) ,f2(x(i),y(i),z(i)));

end