clear all
clc
syms x
a=0;
b=pi;
m=10;%计算函数10项展开
T=b-a;
w=2*pi/T;
a0=(2/T*int(x^2,x,0,T));
f=a0/2;
for n=1:m
    a(n)=2/T*int(x^2*cos(n*w*x),x,0,T);
    b(n)=2/T*int(x^2*sin(n*w*x),x,0,T);
    f=f+a(n)*cos(n*w*x)+b(n)*sin(n*w*x);
end
a=[a0,a];
disp('an的系数为：');
disp(a);
disp('bn的系数为：');
disp(b);
disp('x^2的前10项展开式为：');
pretty(simplify(f))