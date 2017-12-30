clear all
clc
m=[16,32];
syms x
%%第一问
f1(x)=exp(x^2);
a1=0;
b1=1;
% Composite Trapezoid Rule
ha1=(b1-a1)./m;
Ga1=[0,0];
for i=1:(m(1)-1)
    na1=(b1-a1)/m(1);
    Ga1(1)=Ga1(1)+f1(a1+i*na1);
end
for i=1:(m(2)-1)
    na1=(b1-a1)/m(2);
    Ga1(2)=Ga1(2)+f1(a1+i*na1);
end
Fa1(1)=sym2poly(ha1(1)./2*(f1(a1)+f1(b1)+2*Ga1(1)));%%m=16
Fa1(2)=sym2poly(ha1(2)./2*(f1(a1)+f1(b1)+2*Ga1(2)));%%m=32
disp('使用Composite Trapezoid Rule exp(x^2)在0到1上m=16以及m=32的积分为');
disp(Fa1);
%Composite Simpson Rule
ha2=(b1-a1)./(2*m);
Ga2=[0,0];
for i=1:(m(1)-1)
    na2(1)=(b1-a1)/(2*m(1));
    Ga2(1)=Ga2(1)+4*f1(a1+(2*i-1)*na2(1))+2*f1(a1+2*i*na2(1));
end
Ga2(1)=Ga2(1)+4*f1(a1+(2*m(1)-1)*na2(1));
for i=1:(m(2)-1)
    na2(2)=(b1-a1)/(2*m(2));
    Ga2(2)=Ga2(2)+4*f1(a1+(2*i-1)*na2(2))+2*f1(a1+2*i*na2(2));
end
Ga2(2)=Ga2(2)+4*f1(a1+(2*m(2)-1)*na2(2));
Fa2(1)=sym2poly(ha2(1)./3*(f1(a1)+f1(b1)+Ga2(1)));%%m=16
Fa2(2)=sym2poly(ha2(2)./3*(f1(a1)+f1(b1)+Ga2(2)));%%m=32
disp('使用Composite Simpson Rule exp(x^2)在0到1上m=16以及m=32的积分为');
disp(Fa2);
%第一问quad以及quadl验算
F1quad=sym2poly(quad(f1,0,1));
F1=@(x) exp(x.^2);
F1quadl=quadl(F1,0,1);
disp('用quad验算的结果分别为');
disp(F1quad);
disp('用quadl验算的结果分别为');
disp(F1quadl);
%第二问
f2(x)=x/(2*exp(x)-exp(-x));
a2=0;
b2=1;
% Composite Trapezoid Rule
hb1=(b2-a2)./m;
Gb1=[0,0];
for i=1:(m(1)-1)
    nb1=(b2-a2)/m(1);
    Gb1(1)=Gb1(1)+f2(a2+i*nb1);
end
for i=1:(m(2)-1)
    nb1=(b2-a2)/m(2);
    Gb1(2)=Gb1(2)+f2(a1+i*nb1);
end
Fb1(1)=sym2poly(hb1(1)./2*(f2(a2)+f2(b2)+2*Gb1(1)));%%m=16
Fb1(2)=sym2poly(hb1(2)./2*(f2(a2)+f2(b2)+2*Gb1(2)));%%m=32
disp('使用Composite Trapezoid Rule x/(2*exp(x)-exp(-x))在0到1上m=16以及m=32的积分为');
disp(Fb1);
%Composite Simpson Rule
hb2=(b2-a2)./(2*m);
Gb2=[0,0];
for i=1:(m(1)-1)
    nb2(1)=(b2-a2)/(2*m(1));
    Gb2(1)=Gb2(1)+4*f2(a2+(2*i-1)*nb2(1))+2*f2(a2+2*i*nb2(1));
end
Gb2(1)=Gb2(1)+4*f2(a2+(2*m(1)-1)*nb2(1));
for i=1:(m(2)-1)
    nb2(2)=(b2-a2)/(2*m(2));
    Gb2(2)=Gb2(2)+4*f2(a2+(2*i-1)*nb2(2))+2*f2(b1+2*i*nb2(2));
end
Gb2(2)=Gb2(2)+4*f2(a2+(2*m(2)-1)*nb2(2));
Fb2(1)=sym2poly(hb2(1)./3*(f2(a2)+f2(b2)+Gb2(1)));%%m=16
Fb2(2)=sym2poly(hb2(2)./3*(f2(a2)+f2(b2)+Gb2(2)));%%m=32
disp('使用Composite Simpson Rule x/(2*exp(x)-exp(-x))在0到1上m=16以及m=32的积分为');
disp(Fb2);
%第二问quad以及quadl验算
F2quad=sym2poly(quad(f2,0,1));
F2=@(x) x./(2*exp(x)-exp(-x));
F2quadl=quadl(F2,0,1);
disp('用quad验算的结果分别为');
disp(F2quad);
disp('用quadl验算的结果分别为');
disp(F2quadl);