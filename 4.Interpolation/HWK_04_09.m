clear all
clc
[Px,Py]=bez_my([0,0.25,0.75,1],[0.1,0.2797,0.6766,0.8],[0.3,0.5500,0.4125,0.1]);
syms u
X(u)=(1-u)^3*Px(1)+3*u*(1-u)^2*Px(2)+3*u^2*(1-u)*Px(3)+u^3*Px(4);
Y(u)=(1-u)^3*Py(1)+3*u*(1-u)^2*Py(2)+3*u^2*(1-u)*Py(3)+u^3*Py(4);
u=linspace(0,1,100);
plot(X(u),Y(u));
hold on;
plot([Px(1),Px(2),Px(3),Px(4)],[Py(1),Py(2),Py(3),Py(4)]);
hold on;
plot([Px(1),Px(2),Px(3),Px(4)],[Py(1),Py(2),Py(3),Py(4)],'o','color','r');
hold on;
plot([Px(1),Px(4)],[Py(1),Py(4)]);