clear
clc
T=zeros(4,6)

T(:,:)=20
T(:,1)=100
T(:,6)=25
%T=T'
lamda=0.4239
pause
for i=4:-1:2
    for j=2:5
        i
        j
        disp('__________________________')
        T(i-1,j)=T(i,j)+lamda*(T(i,j+1)-2*T(i,j)+T(i,j-1))
        
    end
end