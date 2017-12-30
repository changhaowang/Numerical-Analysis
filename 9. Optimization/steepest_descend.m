function [ x,y ] = steepest_descend( f,dfx,dfy,x0,y0,a,TOL )
%UNTITLED 此处显示有关此函数的摘要
%   此处显示详细说明
d=[dfx(x0,y0);dfy(x0,y0)];
while norm(d)>TOL
        x0=x0+a*d(1);
        y0=y0+a*d(2);
        a=
        d=[dfx(x0,y0);dfy(x0,y0)];
end
x=x0;
y=y0;
end

