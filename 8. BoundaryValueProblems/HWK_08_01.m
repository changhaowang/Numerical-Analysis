clear all
clc
%a）小题
syms  y1 y2 t s
f1(t,y1,y2)=[y2;y1+2/3*exp(t)];
w1(:,1)=[0;s];
a1=0;
b1=1;
h=0.1;%取步长为0.1
n1=(b1-a1)/h;
t1(1)=0;
for i=1:n1
    t1(i+1)=t1(i)+h;
    k1=f1(t1(i),w1(1,i),w1(2,i));
    k2=f1(t1(i)+h/2,w1(1,i)+h/2*k1(1),w1(2,i)+h/2*k1(2));
    k3=f1(t1(i)+h/2,w1(1,i)+h/2*k2(1),w1(2,i)+h/2*k2(2));
    k4=f1(t1(i)+h,w1(1,i)+h*k3(1),w1(2,i)+h*k3(2));
    w1(:,i+1)=w1(:,i)+h/6*(k1+2*k2+2*k3+k4);
end
%二分法求解F(s)==0;
fun1=@(x) subs(w1(1,n1+1)-1/3*exp(1),s,x);
xa0=[0 1.5];
xa1=Dichotomy(0,1,fun1);
disp(['第一问F(s)==0的解为：',num2str(xa1)]);
for i=1:n1+1
    w1(:,i)=subs(w1(:,i),s,xa1);
end
figure;
plot(t1,w1(1,:),'r','Marker','o');
title('第一小题函数图像:diff(y,2)==y+2/3*exp(t),y(0)==0,y(1)==1/3*exp(1)');
xlabel('t');
ylabel('y');
grid on;


%b小题
f2(t,y1,y2)=[y2;2*exp(-2*y1)*(1-t^2)];
a=0;
b=1;
w0=0;
s0=0;
h=0.1;
n=(b-a)/h;
while abs(b-a)>10^(-6)
    c=(a+b)/2;
    [ W1,T ] = RK4( a,b,w0,h,f2,c );
    [ W2,T ] = RK4( a,b,w0,h,f2,a );
    if (W1(1,end)-log(2))==0
        y=c;
        break;
    elseif (W1(1,end)-log(2))*(W2(1,end)-log(2))<0
        b=c;
    else
        a=c;
    end
    y=c;
end
[W,T]=RK4(0,1,w0,h,f2,y);
disp(['第二问F(s)==0的解为：',num2str(y)]);
figure;
plot(T,W(1,:),'r','Marker','o');
title('第二小题函数图像:diff(y,2)==2*exp(-2*y)*(1-t^2),y(0)==0,y(1)==log(2)');
xlabel('t');
ylabel('y');
grid on;