clear all
clc
%第一问
f1=@(x1) 2*x1(1)^2-4*x1(1)*x1(2)+4*x1(2)^2-6*x1(1)-3*x1(2);
A1=[1,1;4,1];
b1=[3;9];
lb1=[0,0];
x10=[1,1];%初始值
[x1_fmincon,fval1_fmincon,exitflag1_fmincon]=fmincon(f1,x10,A1,b1,[],[],lb1)
[x1_ga,fval1_ga,exitflag1_ga]=ga(f1,2,A1,b1,[],[],lb1)
%第二问
f2=@(x2) exp(x2(1))*(4*x2(1)^2+4*x2(1)*x2(2)+2*x2(2)^2+2*x2(2)+1);
A2=[1,1;-1,0;0,1];
b2=[0,10,10];
x20=[-10,10];
[x2_fmincon,fval2_fmincon,exitflag2_fmincon]=fmincon(f2,x20,A2,b2,[],[],[],[],@mycon)
[x2_ga,fval2_ga,exitflag2_ga]=ga(f2,2,A2,b2,[],[],[],[],@mycon)
