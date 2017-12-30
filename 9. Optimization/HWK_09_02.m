clear all
clc
%最速下降法
f=@(x) 100*(x(2)-x(1)^2)^2+(x(1)-1)^2;
fx=@(x) 200*(x(2)-x(1)^2)*(-2*x(1))+2*(x(1)-1);
fy=@(x) 200*(x(2)-x(1)^2);
x0=[2;2];
x1=x0;
TOL=10^(-5);
a=0.5;%设定a的初始值
d=-[fx(x0);fy(x0)];
while norm(d)>TOL
    a=fminbnd(@(a) f(x1+a*d),0,1);
    x1=x1+a*d;
    d=-[fx(x1);fy(x1)];
end
y_steepest=f(x1);
%牛顿法
fxx=@(x) 1200*x(1)^2+2-400*x(2);
fxy=@(x) -400*x(1);
fyx=@(x) -400*x(1);
fyy=@(x) 200;
a=0.5;%设定a的初始值
H=[fxx(x0),fxy(x0);fyx(x0),fyy(x0)];
x2=x0;
g=-[fx(x0);fy(x0)];
while norm(g)>TOL
    a=fminbnd(@(a) f(x2+a*g),0,1);
    x2=x2+a*inv(H)*g;
    H=[fxx(x2),fxy(x2);fyx(x2),fyy(x2)];
    g=-[fx(x2);fy(x2)];
end
y_newton=f(x2);
%拟牛顿法
a=0.5;
B=inv([fxx(x0),fxy(x0);fyx(x0),fyy(x0)]);%设置拟牛顿法初始B矩阵
x3(:,1)=[0;0];
x3(:,2)=x0;
g4=[fx(x0);fy(x0)];
while norm(g4)>TOL
    x3(:,1)=x3(:,2);
    g3=g4;
    d=-B*g3;
    a=fminbnd(@(a) f(x3(:,1)+a*d),0,1);
    x3(:,2)=x3(:,1)+a*d;
    s=x3(:,2)-x3(:,1);
    g4=[fx(x3(:,2));fy(x3(:,2))];
    y=g4-g3;
    B=B+s*s.'/(s.'*y)-B*y*y.'*B/(y.'*B*y);
end
y_quasi=f(x3(:,2));
%fminsearch验证
[x,fval,exitflag]=fminsearch(f,x0);
%结果显示
disp('steepest method求解出来的结果为：');
x1
y_steepest
disp('newton法求解出来的结果为：');
x2
y_newton
disp('quasi newton法求解出来的结果为：');
x3(:,2)
y_quasi
disp('自带函数fminsearch求解出来的结果为：');
x
fval