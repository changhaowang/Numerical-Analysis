clear all
clc
A1=[3,-1,2;4,1,0;-3,2,1;1,2,5;-2,0,3];
A2=[4,2,3,0;-2,3,-1,1;1,3,-4,2;1,0,1,-1;3,1,3,-2];
b1=[10;10;-5;15;0];
b2=[10;0;2;0;5];
X1=Normal_Equation(A1,b1);
X2=Normal_Equation(A2,b2);
r1=b1-A1*X1;
r2=b2-A2*X2;
l1=length(r1);
l2=length(r2);
RMSE1=norm(r1)*l1^(-0.5);
RMSE2=norm(r2)*l2^(-0.5);
X1
RMSE1
X2
RMSE2

