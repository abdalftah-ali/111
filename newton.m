%neweton Method
clc
clear
x0=2;
f=@(x)-1.5*x^6-2*x^4+12*x;
fx=@(x)-9*x^5-8*x^3+12;
dfx=@(x) -45*x^4-24*x^2; 
    fprintf('\n  i \t\t\tx0 \t\t f(x0) \t\t df(x0)\t\t ddfx(x0) \tx1\t\t\t err ');
    m=0;

for i=0:10
    x1=x0-(fx(x0)/dfx(x0));
       fprintf('\n %0.5f \t%0.5f \t%0.5f  \t%0.5f \t%0.5f \t%0.5f  \t%0.5f',i,x0,f(x0),fx(x0),dfx(x0),x1,m);
        m=abs((x0-x1)/x1)*100;

      

    x0=x1;
    i;
    
end

