function [ H,H0 ] = her_my( X,Y,Y1,x0 )
%UNTITLED 此处显示有关此函数的摘要
%   此处显示详细说明
syms x
n=length(X);
for i=1:n-1
    a(1,i)=(1+2*(x-X(i))/(X(i+1)-X(i)))*((x-X(i+1))/(X(i)-X(i+1)))^2;
    a(1,i+1)=(1+2*(x-X(i+1))/(X(i)-X(i+1)))*((x-X(i))/(X(i+1)-X(i)))^2;
    b(1,i)=(x-X(i))*((x-X(i+1))/(X(i)-X(i+1)))^2;
    b(1,i+1)=(x-X(i+1))*((x-X(i))/(X(i+1)-X(i)))^2;
    H(i)=a(1,i)*Y(i)+a(1,i+1)*Y(i+1)+b(1,i)*Y1(i)+b(1,i+1)*Y1(i+1);
end
for j=1:n-1
    if x0<X(1)
        H0=sym2poly(subs(H(1),x,x0));
        break;
    elseif x0>X(n)
        H0=sym2poly(subs(H(n-1),x,x0));
        break;
    elseif x0>X(j)& x0<=X(j+1)
        H0=sym2poly(subs(H(j),x,x0));
        break;
    end
end
end

