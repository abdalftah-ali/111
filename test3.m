

clc
clear all
t_0=0;
t_f=9;
M=3;
N=6;


% define the mesh in space
dx = 0.05/(N-1);
x = 0:dx:0.05;
x = x';

% define the mesh in time
dt = (t_f-t_0)/M;
t = t_0:dt:t_f;

% define the ratio r
r = 0.4239 

for i=1:N
  u(i,1) = 25;
end 
err(:,1) = u(:,1) - exp(t_0-t(1))*cos(x);

% for internal points, have
%    u_new(j) = u_old(j) + r*(u_old(j+1)-2*u_old(j)+u_old(j-1))
% for the two end-points, have
%    u_new(1) = u_old(1) + r*(u_old(2)-2*u_old(1)+u_old(N-1))     
%    u_new(N) = u_old(N) + r*(u_old(2)-2*u_old(N)+u_old(N-1))     
% clearly the endpoints are redundant: u(1)= u(N) at all times.  I just
% kept them around for plotting convenience.  

for j=1:M
  u(1,j+1) = u(1,j) + r*(u(2,j)-2*u(1,j)+u(N-1,j));
  for i=2:N-1
    u(i,j+1) = u(i,j) + r*(u(i+1,j)-2*u(i,j)+u(i-1,j));
  end
  u(N,j+1) = u(N,j) + r*(u(2,j)-2*u(N,j)+u(N-1,j));
  err(:,j+1) = u(:,j+1) - exp(t_0-t(j+1))*cos(x);
end

