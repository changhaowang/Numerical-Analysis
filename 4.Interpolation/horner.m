function [ P0 ] = horner( n,A,x0 )
% 使用horner method解决多项式问题
syms x
B(1)=A(1);
for i=2:n+1
    B(i)=A(i)+B(i-1).*x0;
end
Q(x)=0*x
for i=1:n
    Q(x)=Q(x)+B(i).*x.^(n-i);
end
P(x)=(x-x0).*Q(x)+B(n+1);
P0=P(x0);
end