function [ Y ] = romberg( f,A,n )
%UNTITLED3 此处显示有关此函数的摘要
%   此处显示详细说明
a=A(1);
b=A(2);
R(1,1)=(b-a)*(f(a)+f(b))/2;
h=zeros(1,n);
B=zeros(1,n);
for j=2:n
    h(j)=(b-a)/(2^(j-1));
    for i=1:2^(j-2)
        B(j)=B(j)+h(j)*f(a+(2*i-1)*h(j));
    end
    R(j,1)=0.5*R(j-1,1)+B(j);
    for k=2:j
        R(j,k)=(4^(k-1)*R(j,k-1)-R(j-1,k-1))/(4^(k-1)-1);
    end
end
Y=sym2poly(R);
end

