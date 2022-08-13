clc
clear
ii=5;
jj=6;
T=zeros(jj,ii)

T(:,:)=0;
T(:,1)=75;  %left
T(:,ii)=100 ;  %right
T(1,:)=300 ;  %upper
T(jj,:)=50 ;  %lower

lamda=1.4

num_itr=2;
for k=1:num_itr
    k
for i=jj-1:-1:2
    for j=2:ii-1
     
        T_new(i,j)=(T(i+1,j)+T(i-1,j)+T(i,j+1)+T(i,j-1))/4;
       
        
      T_new(i,j)=(lamda*T_new(i,j))+((1-lamda)*T(i,j));
      T(i,j)=T_new(i,j);
     % pause
    end
end

if(k==num_itr)
    T
    break
end

T

T_old=T
end
e=((T-T_old)./T).*100