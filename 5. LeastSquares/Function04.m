function [ Y ] = Function04( C )
%UNTITLED2 此处显示有关此函数的摘要
%   此处显示详细说明
t=[1,3,4,5,6,8];
y=[2,6,4,2,-1,-3];
Y=C(1).*exp(-C(2).*t).*cos(C(3).*t+C(4))-y;
end

