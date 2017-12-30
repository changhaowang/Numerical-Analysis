clear all
clc
[P,P0]=net_my([0,0.1,0.3,0.6,1.0],[-6,-5.89483,-5.65014,-5.17788,-4.28172],2);%求出插值多项式，并求出在2.0处的拟合值
figure;
ezplot(P,[0,1]);
title('newtwon method');