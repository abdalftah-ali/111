%t    y    z    dz/dt   dy/dt    avg slop       Yend
clc
clear all
dydt1=@(t,y,z) z;
dydt2=@(t,y,z) 0.5*t-y;
h=0.1;
t=0:h:0.6;
y0=2;
z(1)= 0;
n=length(t);
y=zeros(size(t));
y(1)=y0;
%fprintf('\n x        \t      y \t     k1 \t    dy/dt \t  ye');
for i=1:n-1
    yp1=y(i)+dydt1(t(i),y(i),z(i))*(t(i+1)-t(i));
     yp2=z(i)+dydt2(t(i),y(i),z(i))*(t(i+1)-t(i));
    dydtp1=dydt1(t(i+1),yp1,yp2);
    dydtp2=dydt2(t(i+1),yp1,yp2);
   phi1=(dydt1(t(i),y(i),z(i))+dydtp1)/2;
   phi2=(dydt2(t(i),y(i),z(i))+dydtp2)/2;
   y(i+1)=y(i)+phi1*(t(i+1)-t(i));
   z(i+1)=z(i)+phi2*(t(i+1)-t(i));
           fprintf('\n %0.4f \t %0.4f \t %0.4f \t %0.4f \t %0.4f  \t %0.4f \t %0.4f ',t(i),y(i),z(i),dydt2(t(i),y(i),z(i)),dydt1(t(i),y(i),z(i)),phi1,yp1);

end

