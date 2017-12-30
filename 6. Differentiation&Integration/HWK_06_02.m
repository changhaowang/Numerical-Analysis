clear all
clc
syms x
h=[0.4,0.2,0.1];
x0=0;
f(x)=x+exp(x);
for i=1:3
    F(i,1)=(f(x+h(i))-f(x-h(i)))/(2*h(i));
    if i>=2
        F(i,2)=(2^2*F(i,1)-F(i-1,1))/(2^2-1);
    end
end
F(3,3)=(2^4*F(3,2)-F(2,2))/(2^4-1);
g(x)=F(3,3);
a=sym2poly(g(0));%%自编函数计算结果
X=-0.4:h(1):0.4;
f1=X+exp(X);
Y=diff(f1)/h(1);
b=Y(2);%%数值计算diff()结果
g(x)=diff(f);
c=g(0);%%符号计算diff()计算结果
disp('自编函数计算结果为：');
disp(a);
disp('数值计算函数diff()计算结果为：');
disp(b);
disp('符号计算函数diff()计算结果为：');
disp(c);