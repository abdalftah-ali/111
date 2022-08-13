clc
clear
ii=5;
jj=6;
T=zeros(jj,ii)

T(:,:)=0
T(:,1)=75  %left
T(:,ii)=100   %right
T(1,:)=300  %upper
T(jj,:)=50   %lower
%T=T'


num_itr=2;
for k=1:num_itr
for i=jj-1:-1:2
    for j=2:ii-1
        i
        j
        disp('__________________________')
        T(i,j)=(T(i+1,j)+T(i-1,j)+T(i,j+1)+T(i,j-1))/4
        
    end
end
if(k==num_itr)
    break
end
T_old=T
end
e=((T-T_old)./T).*100