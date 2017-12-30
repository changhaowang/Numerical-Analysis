clear all
clc
%第一问
format long;
x0=1;%选取初值
x(1)=0;
TOL=10^(-5);
x(2)=x0;
while abs(x(2)-x(1))>TOL
    x(1)=x(2);
    x(2)=atan(0);
end
disp('fixed-point iteration method求解结果为：');
x(1)
%第二问
a=0;
b=1;
f=@(t,y) 1+y^2;
h=0.1;
n=(b-a)/h;
w(1)=0;%这道题将初始值变为了0
t(1)=0;
for i=1:n
    t(i+1)=t(i)+h;
    k1=f(t(i),w(i));
    k2=f(t(i)+h/2,w(i)+h/2*k1);
    k3=f(t(i)+h/2,w(i)+h/2*k2);
    k4=f(t(i)+h,w(i)+h*k3);
    w(i+1)=w(i)+h/6*(k1+2*k2+2*k3+k4);
end
%绘图
figure;
e1=plot(t,w,'Marker','o');
hold on;
[T,Y]=ode45(f,[a,b],w(1));
e2=plot(T,Y,'r');
legend([e1,e2],'RK4作图','ODE45作图');
xlabel('t');
ylabel('y');
title('diff(y)==1+y^2;');
grid on;
%第三问求导数
x0=0;
f=@(x) tan(x+x0);
h=0.01;%设定步长为0.01
disp('t=0时，tan(x+x0)的导数为：');
df0=(f(0+h)-f(0-h))/(2*h)
disp('t=1,tan(x+x0)的导数为：');
df1=(f(1+h)-f(1-h))/(2*h)
%c第四问lamped cubic spline插值
dx(1)=t(2)-t(1);
dx(n)=t(n+1)-t(n);
dy(1)=w(2)-w(1);
dy(n)=w(n+1)-w(n);
for i=2:n    
    dx(i)=t(i+1)-t(i);
    dy(i)=w(i+1)-w(i);
    A(i-1,i-1)=dx(i-1);
    A(i-1,i)=2*(dx(i-1)+dx(i));
    A(i-1,i+1)=dx(i);
    b(i-1)=3*(dy(i)/dx(i)-dy(i-1)/dx(i-1));
end
A(10,1)=2*dx(1);
A(10,2)=dx(1);
b(10)=3*(dy(1)/dx(1)-df0);
A(11,10)=dx(n);
A(11,11)=2*dx(10);
b(11)=3*(df1-dy(10)/dx(10));
c=A\b.';
syms x;
figure;

for i=1:n
  b(i)=dy(i)/dx(i)-2/3*dx(i)*c(i)-dx(i)/3*c(i+1);
  d(i)=1/(3*dx(i))*(c(i+1)-c(i));
  S(i)=w(i)+b(i)*(x-t(i))+c(i)*(x-t(i))^2+d(i)*(x-t(i))^3;
  e(i)=ezplot(S(i),[t(i),t(i+1)]);
  set(e(i),'LineWidth',2);
  hold on;
  plot(t(i),w(i),'o');
  hold on;
end
e(n+1)=plot(t(n+1),w(n+1),'o');
set(e(n+1),'LineWidth',2);
hold on;
e3=ezplot(f,[0,1]);
set(e3,'Color','r');
grid on;
xlim([0,1]);
ylim([0,1.6]);
legend([e(n+1),e3],'clamped cubic spline','tan(x)');
%第五问 composite Simpson's Rule
m=32;
a=0;
b=1;
h=(b-a)/(2*m);
s(1)=tan(a);
s(2*m+1)=tan(b);
t(1)=0;
for i=1:2*m
    t(i+1)=t(i)+h;
end
M1=0;
M2=0;
for i=2:m
    M1=M1+f(t(2*i));
    M2=M2+f(t(2*i-1));
end
M1=M1+f(t(2));
Integration=h/3*(f(t(1))+f(t(end))+4*M1+2*M2);
%自带函数验证
Integration_quad=quad(f,0,1);
disp('m=32时，simpson方法求解结果为：');
Integration
disp('quad求解结果为：');
Integration_quad