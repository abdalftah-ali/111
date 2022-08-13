clc 
clear all
syms h;
f=@(x,y) 2.25*x+1.75*y-1.5*x^2-2*y^2;
x0=1-0.75*h;
y0=1;
x=f(x0,y0);
simplify(x)