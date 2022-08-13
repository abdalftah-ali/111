%
% Example 7.2-3, Crank-Nicolson method with derivative boundary conditions
%
Tn=100*ones(1,5);
n=length(Tn);
n1=n-1;
Tn1=Tn;
b=2.25*ones(1,n);
b(1)=2.34;
c=-0.125*ones(1,n);
a=c;
c(1)=2*c(1);
a(n)=2*a(n);
r=ones(1,n);
t=0;
fprintf('t = %8.1f, T = %8.2f %8.2f %8.2f %8.2f %8.2f\n',t,Tn)
for k=1 : 10
  t=t+1;
  r(1)=1.66*Tn(1)+.25*Tn(2)+12.6;
for i=2:n1;
    r(i)=0.125*Tn(i-1)+1.75*Tn(i)+0.125*Tn(i+1);
end
r(5)=0.25*Tn(n1)+1.75*Tn(n);
beta=c;gam=c;y=c;
beta(1)=b(1);gam(1)=r(1)/beta(1);
for i=2:n
    beta(i)=b(i)-a(i)*c(i-1)/beta(i-1);
    gam(i)=(r(i)-a(i)*gam(i-1))/beta(i);
end
Tn1(n)=gam(n);
for j=1:n1
    Tn1(n-j)=gam(n-j)-c(n-j)*Tn1(n-j+1)/beta(n-j);
end
Tn=Tn1;
  fprintf('t = %8.1f, T = %8.2f %8.2f %8.2f %8.2f %8.2f\n',t,Tn)
end  
