function [ Q,R ] = QR_Houref( A )
%UNTITLED3 此处显示有关此函数的摘要
%   此处显示详细说明
[m,n]=size(A);
HA=A;
H=eye(m);
for i=1:n
    x=HA(i:end,i);
    w=zeros(length(x),1);
    w(1)=norm(x);
    v=x-w;
    P=(v*v.')/(v.'*v);
    I=eye(length(x));
    H1=I-2*P;
    H2=eye(m);
    H2(i:end,i:end)=H1;
    HA=H2*HA;
    H=H2*H;
end
R=HA;
Q=inv(H);
end

