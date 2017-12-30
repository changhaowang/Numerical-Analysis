function [ x ] = qusi_newton( f,x0,h,TOL )
%UNTITLED4 此处显示有关此函数的摘要
%   此处显示详细说明
w(1)=x0;
w(2)=x0-2*TOL;
while abs(w(2)-w(1))>TOL
    w(1)=x0;
    x0=x0-h*(f(x0+h)-f(x0-h))/(2*(f(x0+h)-2*f(x0)+f(x0-h)));
    w(2)=x0;
end
x=x0;
end

