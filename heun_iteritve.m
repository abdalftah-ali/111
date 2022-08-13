clc
clear all
dydt=@(t,y) (1+4*t)*sqrt(y);
h=0.25;
t=0:h:1;
y0=1;
n=length(t);
y=zeros(size(t));
y(1)=y0;
ea=100;
reltol=0.00001;
for i=1:n-1
    yp_old=y(i)+dydt(t(i),y(i))*(t(i+1)-t(i));
    while ea>=reltol
        dydtp=dydt(t(i+1),yp_old);
        phi=(dydt(t(i),y(i))+dydtp)/2;
        yp=y(i)+phi*(t(i+1)-t(i));
        ea=abs((yp-yp_old)*yp)*100;
        yp_old=yp;
    end
    y(i+1)=yp;
    ea=100;
end