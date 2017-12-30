clear all
clc 
syms y t f(t,y)
f(t,y)=-y+t*y^(0.5);
a=2;
b=3;
w(1)=2;
t1(1)=2;
h=0.1;
n=(b-a)/h;
for i=1:n
    t1(i+1)=t1(i)+h;
    k1=f(t1(i),w(i));
    k2=f(t1(i)+h/2,w(i)+h*k1/2);
    k3=f(t1(i)+h/2,w(i)+h/2*k2);
    k4=f(t1(i)+h,w(i)+h*k3);
    w(i+1)=w(i)+h/6*(k1+2*k2+2*k3+k4);
end
figure;
e1=plot(t1,w,'Marker','o');
hold on;
%Matlab自带函数
dy=@(t,y) -y+t*y^(0.5);
[c,d]=ode45(dy,[2,3],2);
e2=plot(c,d,'r');
hold on;
set(e2,'Color','r');
v(1)=2;
for i=2:n+1
    v(i)=d(4*(i-1)+1);
end
plot(t1,v,'o','Color','r');
xlim([2,3]);
title('diff(y)==-y+t*y^0.5,y(2)==2');
legend([e1,e2],'Runge-Kutta4 Method','自带函数ode45');