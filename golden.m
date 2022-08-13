%xL f(xL)   x2    f(x2)   x1    f(x1)    xu     f(xu)    d  erro
% äÓÈÉ ÇáÎØÊ Çæá Þíãå 100 æÈÚÏåÇ ÇáÊÇäíå áÇ ÊÇÎÏ æäÇÎÏ Þíãå áí ÈÚÏåÇ 
clear all
clc
f=@(x) -1.5*x^6-2*x^4+12*x;
a=0;                            
b=2;                           
epsilon=0.000001;               
tau=double((sqrt(5)-1)/2);     
k=0;   
d=tau*(b-a);
x1=a+d;           
x2=b-d;
f_x1=f(x1);                   
f_x2=f(x2);
erro=100

while ((abs(b-a)>epsilon) && (k<3))

   fprintf('\n %0.4f \t %0.4f \t %0.4f \t %0.4f  \t %0.4f \t %0.4f \t %0.4f  \t %0.4f \t %0.4f \t %0.4f',a,f(a),x2,f(x2),x1,f(x1),b,f(b),d,erro);

    if(f_x1<f_x2)
         b=x1;
         x1=x2;   
         d=tau*(b-a);
        x2=b-d;        
        f_x1=f(x1);
        f_x2=f(x2);
        
        erro=100*(1-tau)*abs(b-a)/x2;
    else
        a=x2;
        x2=x1;
        d=tau*(b-a);
        x1=a+d;
        f_x1=f(x1);
        f_x2=f(x2);
            erro=100*(1-tau)*abs(b-a)/x1;
        
    end
  k=k+1; 
  
end
