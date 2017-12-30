function [ y ] = Dichotomy( a,b,fun )
%UNTITLED5 此处显示有关此函数的摘要
%   此处显示详细说明
while abs(b-a)>10^(-6)
    c=(a+b)/2;
    if fun(c)==0
        y=c;
        break;
    elseif fun(a)*fun(c)<0
        b=c;
    else
        a=c;
    end
    y=c;

end

