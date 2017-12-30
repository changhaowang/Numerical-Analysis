function [ w,t ] = RK4( a,b,w0,h,fun,s )
%UNTITLED7 此处显示有关此函数的摘要
%   此处显示详细说明
n=(b-a)/h;
w(:,1)=[w0;s];
t(1)=a;
for i=1:n
   t(i+1)=t(i)+h;
   k1=fun(t(i),w(1,i),w(2,i));
   k2=fun(t(i)+h/2,w(1,i)+h/2*k1(1),w(2,i)+h/2*k1(2));
   k3=fun(t(i)+h/2,w(1,i)+h/2*k2(1),w(2,i)+h/2*k2(2));
   k4=fun(t(i)+h,w(1,i)+h*k3(1),w(2,i)+h*k3(2));
   w(:,i+1)=w(:,i)+h/6*(k1+2*k2+2*k3+k4);
end

