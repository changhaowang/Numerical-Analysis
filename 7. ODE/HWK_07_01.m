clear all
clc
%第一问
syms t y1 f1(t,y1)
f1(t,y1)=(2-t*y1)/(t^2+1);
w1(1)=1;
a1=0;
b1=1;
h=0.1;
t1(1)=0;
for i=1:10
    t1(i+1)=t1(i)+h;
    w1(i+1)=w1(i)+h*f1(t1(i),w1(i));
end
figure;
e1=plot(t1,w1,'Marker','o');
hold on;
%自带函数ODE45求解
dy=@(t,y1) (2-t*y1)/(t^2+1);
[a,b]=ode45(dy,[0,1],1);
e2=plot(a,b,'r');
hold on;
v1(1)=1;
for i=2:11
    v1(i)=b(4*(i-1)+1);
end
plot(t1,v1,'o','Color','r');
title('第一问：diff(y)==(2-t*y)/(t^2+1),y(0)==1');
legend([e1,e2],'Euler Method','自带函数ODE45');
%第二问
syms y2 f2(t,y2)
f2(t,y2)=y2/t-(y2/t)^2;
a2=1;
b2=2;
t2(1)=1;
w2(1)=1;
for i=1:10
    t2(i+1)=t2(i)+h;
    w2(i+1)=w2(i)+h*f2(t2(i),w2(i));
end
figure;
e3=plot(t2,w2,'Marker','o');
hold on;
%自带函数ODE45求解
dy2=@(t,y2) y2/t-(y2/t)^2;
[c,d]=ode45(dy2,[1,2],1);
e4=plot(c,d,'r');
hold on;
v2(1)=1;
for i=2:11;
    v2(i)=d(4*(i-1)+1);
end
plot(t2,v2,'o','Color','r');
xlim([1,2]);
title('第二问：diff(y)==y/t-(y/t)^2,y(1)==1');
legend([e3,e4],'Euler Method','自带函数ODE45');