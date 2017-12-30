clear all
clc
syms x
[a,b]=cub_my([0,1,2,3],[exp(0),exp(1),exp(2),exp(3)],[0,1],[3,exp(3)],1.3)%得到曲线函数以及在1.3处的拟合值
S1(x)=a(1)-exp(x);
S2(x)=a(2)-exp(x);
S3(x)=a(3)-exp(x);
figure
ezplot(S1,[0,1]);
hold on
ezplot(S2,[1,2]);
hold on
ezplot(S3,[2,3]);
axis([-1,3,0,2]);
title('cubic spline interpolation误差')