function [ S,S0 ] = cub_my( X,Y,S1,S1n,x0 )
%UNTITLED3 此处显示有关此函数的摘要
%   此处显示详细说明
n=length(X);
A=zeros(n-2,n-2);
h(1)=X(2)-X(1);
u=zeros(1,n);
p=ones(1,n);
d=zeros(n-2,1);
syms x
for j=2:n-1
    h(j)=X(j+1)-X(j);
    u(j)=h(j-1)/(h(j-1)+h(j));
    p(j)=h(j)/(h(j-1)+h(j));
    d(j-1)=6*((Y(j+1)-Y(j))/h(j)-(Y(j)-Y(j-1))/h(j-1))/(h(j-1)+h(j));
end
%  d(1)=6/h(1)*((Y(2)-Y(1))/h(1)-S1(2));
A(1,1)=2;
A(1,2)=p(2);%%
A(n-2,n-2)=2;
A(n-2,n-3)=u(n-1);%%%   
for i=2:n-3
    A(i,i)=2;
    A(i,i+1)=p(i);
    A(i,i-1)=u(i);
end
M=inv(A)*d;
M=[S1(2);M;S1n(2)];
for j=1:n-1
   S(1,j)=M(j)*(X(j+1)-x)^3/(6*h(j))+M(j+1)*(x-X(j))^3/(6*h(j))+(Y(j)-M(j)*h(j)^2/6)*(X(j+1)-x)/h(j)+(Y(j+1)-M(j+1)*h(j)^2/6)*(x-X(j))/h(j);
end
for j=1:n-1
    if x0<X(1)
        S0=sym2poly(subs(S(1,1),x,x0));
        break;
    elseif x0>X(n)
        S0=sym2poly(subs(S(1,n-1),x,x0));
        break;
    elseif x0>X(j) & x0<=X(j+1)
        S0=sym2poly(subs(S(1,j),x,x0));
        break;
    end
end



