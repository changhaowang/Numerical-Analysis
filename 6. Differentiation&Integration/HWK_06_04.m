clear all
clc
syms x
%第一问
fa(x)=sin(x^2);
A1=[0,pi^0.5];
n1=2;
R1=romberg(fa,A1,n1);
while abs(R1(end,end)-R1(end-1,end-1))>0.5*10^(-8)
    n1=n1+1;
    R1=romberg(fa,A1,n1);
end
disp('第一问计算结果为：');
disp(R1);
%第二问
fb(x)=log(cos(x)+sin(x));
A2=[0,pi/2];
n2=2;
R2=romberg(fb,A2,n2);
while abs(R2(end,end)-R2(end-1,end-1)>0.5*10^(-8))
    n2=n2+1;
    R2=romberg(fb,A2,n2);
end
disp('第二问结果为：');
disp(R2);