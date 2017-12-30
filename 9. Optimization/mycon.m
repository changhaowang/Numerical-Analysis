function [ g,ceq] = mycon( x )
%UNTITLED5 此处显示有关此函数的摘要
%   此处显示详细说明
g=[x(1)*x(2)-x(1)-x(2)+1.5;-x(1)*x(2)-10];
ceq=0;
end

