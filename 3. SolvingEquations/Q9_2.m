clear all
clc
format long
syms x
f(x)=tan(pi-x)-x;
A=['solve函数的答案为：'];
disp(A);
solve(f(x)==0)
a=2;
B=['fzero,x=2的答案为：'];
disp(B);
fzero(f,a)