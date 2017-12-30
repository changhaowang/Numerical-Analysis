function [ x ] = goldsec( f,interval,TOL )
%UNTITLED 此处显示有关此函数的摘要
%   此处显示详细说明
g=(sqrt(5)-1)/2;
a=interval(1);
b=interval(2);
x1=a+(1-g)*(b-a);
x2=a+g*(b-a);
while (b-a)>TOL
    if f(x1)>f(x2)
        a=x1;
        x1=x2;
        x2=a+g*(b-a);
    else
        b=x2;
        x2=x1;
        x1=a+(1-g)*(b-a);
    end
end
x=(b+a)/2;
end

