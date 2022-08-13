
function finite
p=@(t) -2;
q=@(t) -1;
r=@(t) t^2;
a=0;
b=1;
alpha=0.2;
beta=0.8;
n=3;
T = zeros(1,n+1);
Y = zeros(1,n-1);
Va = zeros(1,n-2);
Vb = zeros(1,n-1);
Vc = zeros(1,n-2);
Vd = zeros(1,n-1);
h=(b-a)/n;
for j=1:n-1,
 Vt(j)=a + h*j;
end
for j=1:n-1,
 Vb(j) = -h^2*feval(r,Vt(j));
end
Vb(1) = Vb(1) + (1 + h/2*feval(p,Vt(1)))*alpha;
Vb(n-1)= Vb(n-1)+(1 - h/2*feval(p,Vt(n-1)))*beta;
for j = 1:n-1,
 Vd(j) = 2 + h^2*feval(q,Vt(j));
 end
for j = 1 : n-2,
 Va(j) = -1 -h/2*feval(p,Vt(j+1));
end
for j = 1:n-2,
 Vc(j) = -1 +h/2*feval(p,Vt(j));
end
Y = trisys(Va,Vd,Vc,Vb);
T = [a,Vt,b];
Y = [alpha,Y,beta]
Y'
function Y=trisys(A,D,C,B)
n=length(B);
for k=2:n,
 mult=A(k-1)/D(k-1);
 D(k)=D(k)-mult*C(k-1);
 B(k)=B(k)-mult*B(k-1);
end
Y(n)=B(n)/D(n);
for k= (n-1):-1:1,
 Y(k)=(B(k)-C(k)*Y(k+1))/D(k);
end
end
end



