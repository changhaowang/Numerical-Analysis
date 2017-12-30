clear all
clc
syms x
f(x)=exp(x)+2.^(-x)+2*cos(x)-6;
g(x)=diff(f(x));
x=1.5;
a=2;
while (abs(a-x)>10^(-6))
    x=a;
    a=x-sym2poly(f(x)./g(x));
end
format long
x=a;
disp('exp(x)+2.^(-x)+2*cos(x)-6==0µÄ½âÎª£º');
x
