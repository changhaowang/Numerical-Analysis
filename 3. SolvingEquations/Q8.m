clear all
clc
syms u v w
format short
f1(u,v,w)=2*u^2-4*u+v^2+3*w^2++6*w+2;
f2(u,v,w)=u^2+v^2-2*v+2*w^2-5;
f3(u,v,w)=3*u^2-12*u+v^2+3*w^2+8;
F(u,v,w)=[f1(u,v,w);f2(u,v,w);f3(u,v,w)];
J(u,v,w)=jacobian([f1(u,v,w),f2(u,v,w),f3(u,v,w)],[u,v,w]);
x=[0,0,0].';
a=[1,1,1].';
while abs(x(1)-a(1))>10^(-6)
      x=a;
      a=x-inv(J(x(1),x(2),x(3)))*F(x(1),x(2),x(3));
end
x=vpa(a)
     