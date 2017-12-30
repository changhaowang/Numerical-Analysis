clear all
clc
syms t
f=exp(t);
n=8;
time(1)=0;
for j=1:n
    time(j)=1/8*(j-1);
    F(j)=subs(f,t,time(j));
    w=exp(-i*2*pi/n);
    Fn(1:8,j)=[w^((j-1)*0);w^((j-1)*1);w^((j-1)*2);w^((j-1)*3);w^((j-1)*4);w^((j-1)*5);w^((j-1)*6);w^((j-1)*7)];
end
Y=1/(n^(0.5))*Fn*F.';
A=real(Y);
B=imag(Y);
x=A(1)/n^(0.5)+A(n/2+1)/n^(0.5)*cos(n*pi*(t));
for k=1:n/2-1
    x=x+2/n^0.5*(A(k+1)*cos(2*(k)*pi*t)-B(k+1)*sin(2*(k)*pi*t));
end
figure;
e1=ezplot(f,[0,7/8]);
set(e1,'Color','g','LineWidth',2.0);
hold on;
e2=plot(time,sym2poly(F),'o','Color','r');
hold on;
e3=ezplot(x,[time(1),time(8)]);
hold on;
xlim([0,7/8]);
ylim([0,3]);
grid on;
legend([e1,e2,e3],'实际曲线','插值点','三角插值曲线');
title('八阶三角插值函数');