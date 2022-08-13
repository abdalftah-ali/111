clc
clear all 
fx =@(x,y) y-x-2*x^2-2*x*y-y^2
       fmax=0;
   for i=1:10000

x = -2 + 4 *randi([0 100])/100;
y = 1 + 2 * randi([0 100])/100;
fn=fx(x,y);

if(fn>fmax) 
fmax = fn;
maxx = x;
maxy = y;


end
   end
   fmax
   maxx
   maxy

 
