clear all
clc
syms y t f(t,y)
f(t,y)=sin(y);
k=[1,2,3,4,5];
a=0;
b=4;
h=0.1.*2.^(-k);
n=(b-a)./h;
w(1)=100;
t(1)=a;
syms y(x)
y(x)=2*atan(exp(x-a)*tan(50))+2*pi*floor((100+pi)/(2*pi));%解析解函数

figure;
for j=1:5
    for i=1:n(j)
        t(i+1)=t(i)+h(j);
        w(i+1)=w(i)+(f(t(i),w(i))+f(t(i)+h(j),w(i)+h(j)*f(t(i),w(i))))*h(j)/2;
    end
    subplot(3,2,j);
    e1(j)=plot(t,w,'Marker','o','Color','r');
    hold on;
    e2(j)=ezplot(y,[0,4]);
    legend([e1(j),e2(j)],'数值解函数','解析解函数');
    k1=num2str(k(j));
    K=['k=',k1];
    title(K);
    hold on;
end