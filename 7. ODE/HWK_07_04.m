clear all
clc
%第一问
syms t u1 u2 u3 
syms f1(t,u1,u2,u3)
f1(t,[u1,u2,u3])=[3*u1+2*u2-u3-1-3*t-2*sin(t);u1-2*u2+3*u3+6-t+2*sin(t)+cos(t);2*u1+4*u3+8-2*t];
a1=0;
b1=2;
w1(:,1)=[5;-9;-5];
t1(1)=0;
h1=0.2;
n1=(b1-a1)/h1;
for i=1:n1
    t1(i+1)=t1(i)+h1;
    k1=f1(t1(i),w1(1,i),w1(2,i),w1(3,i));
    k2=f1(t1(i)+h1/2,(w1(1,i)+h1/2*k1(1)),(w1(2,i)+h1/2*k1(2)),(w1(2,i)+h1/2*k1(3)));
    k3=f1(t1(i)+h1/2,(w1(1,i)+h1/2*k2(1)),(w1(2,i)+h1/2*k2(2)),(w1(3,i)+h1/2*k2(3)));
    k4=f1(t1(i)+h1,(w1(1,i)+h1*k3(1)),(w1(2,i)+h1*k3(2)),(w1(3,i)+h1*k3(3)));
    w1(:,i+1)=w1(:,i)+h1/6*(k1+2*k2+2*k3+k4);
end
figure;
subplot(2,2,1);
e1=plot(t1,w1(1,:),'Marker','o');
xlabel('t');
ylabel('u1');
title('u1(t)图像');

subplot(2,2,2);
e2=plot(t1,w1(2,:),'Marker','o');
xlabel('t');
ylabel('u2');
title('u2(t)图像');

subplot(2,2,3);
e3=plot(t1,w1(3,:),'Marker','o');
xlabel('t');
ylabel('u3');
title('u3(t)图像');
%第二问
syms y1 y2 f2(t,y1,y2)
f2(t,[y1,y2])=[y2;(2*t*y2-2*y1+t^3*log(t))/t^2];
a2=1;
b2=2;
h2=0.1;
n2=(b2-a2)/h2;
w2(:,1)=[1;0];
t2(1)=1;
for i=1:n2
    t2(i+1)=t2(i)+h2;
    k1=f2(t2(i),w2(1,i),w2(2,i));
    k2=f2(t2(i)+h2/2,w2(1,i)+h2/2*k1(1),w2(2,i)+h2/2*k1(2));
    k3=f2(t2(i)+h2/2,w2(1,i)+h2/2*k2(1),w2(2,i)+h2/2*k2(2));
    k4=f2(t2(i)+h2,w2(1,i)+h2*k3(1),w2(2,i)+h2*k3(2));
    w2(:,i+1)=w2(:,i)+h2/6*(k1+2*k2+2*k3+k4);
end
figure;
subplot(2,1,1);
e4=plot(t2,w2(1,:),'Marker','o');
xlabel('t');
ylabel('y');
title('y(t)图像(这个是该题答案)');
xlim([1,2]);
subplot(2,1,2);
e5=plot(t2,w2(2,:),'Marker','o');
xlabel('t');
ylabel('y2');
title('y2(t)=diff(y(t))图像');
xlim([1,2]);
