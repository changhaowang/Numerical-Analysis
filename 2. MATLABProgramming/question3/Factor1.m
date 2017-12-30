function [ y ] = Factor1( x )
%UNTITLED5 此处显示有关此函数的摘要
%   此处显示详细说明
if x<=1
    y=1;
else 
    y=Factor1(x-1)*x;
end

end

