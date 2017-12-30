function [ y ] = Factor( x )
%UNTITLED4 此处显示有关此函数的摘要
%   此处显示详细说明
y=1;
for n=x:-1:1
    y=y*n;
end

end

