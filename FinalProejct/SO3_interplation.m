function [ R ] = SO3_interplation( R0,w0,R1,w1,t )
%UNTITLED4 此处显示有关此函数的摘要
%   此处显示详细说明
a1=w0;
r1=log_matrix(R0.'*R1);
A=eye(3)-(1-cos(norm(r1)))/norm(r1)^2*skew_matrix(r1)+(norm(r1)-sin(norm(r1)))/norm(r1)^3*skew_matrix(r1)^3;
a3=inv(A)*w1+w0-2*r1;
a2=r1-w0-a3;
R=R0*exponetial_matrix(a3*t^3+a2*t^2+a1*t);
end

