clear all
clc
format short
syms x
[P1,dim1]=lag_my([8.1,8.3],[16.94410,17.56492],8.4);
[P2,dim2]=lag_my([8.1,8.3,8.6],[16.94410,17.56492,18.50515],8.4);
[P3,dim3]=lag_my([8.1,8.3,8.6,8.7],[16.94410,17.56492,18.50515,18.82091],8.4);
a=sym2poly(dim1);
b=sym2poly(dim2);
c=sym2poly(dim3);
A=['一阶结果为',num2str(a)];
disp(A);
B=['二阶结果为',num2str(b)];
disp(B);
C=['三阶结果为',num2str(c)];
disp(C);
error(x)=P3-x*log(x);
figure;
ezplot(error,[6,10]);
title('误差函数')
