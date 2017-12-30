clear all
clc
X=[0.1,0.3,0.7,0.8];
Y=[0.3,0.8,0.6,0.1];
syms u
x(u)=0*u;
y(u)=0*u;
for i=1:4
        B(i)=combntns(3,i-1)*u^(i-1)*(1-u)^(4-i);
end
for i=1:4
    x(u)=x(u)+X(i)*B(i);
    y(u)=y(u)+Y(i)*B(i);
end
figure;

plot([X(1),X(2),X(3),X(4)],[Y(1),Y(2),Y(3),Y(4)]);
hold on
plot([X(4),X(1)],[Y(4),Y(1)]);
hold on
u=linspace(0,1);
plot(x(u),y(u));
axis([0 1 0 1]);
title('控制多边形')
% a=input('请输入想要求得的u=');
% A=sym2poly(P(a))