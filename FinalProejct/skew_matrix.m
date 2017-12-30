function [ R ] = skew_matrix( r )
%UNTITLED 此处显示有关此函数的摘要
%calculate the skew Matrix
R=[0,-r(3),r(2);r(3),0,-r(1);-r(2),r(1),0];
end

