function [ x ] = newton( f,df,ddf,x0,TOL )
%UNTITLED2 此处显示有关此函数的摘要
%   此处显示详细说明
w(1)=x0;
w(2)=x0-2*TOL;
a=0.5;%设定a的初始值
while abs(w(2)-w(1))>TOL
    w(1)=x0;
    a=fminbnd(@(a) f(x0+a*df(x0)),0,1);
    x0=x0-a*df(x0)/ddf(x0);
    w(2)=x0;
end
x=x0;
end

