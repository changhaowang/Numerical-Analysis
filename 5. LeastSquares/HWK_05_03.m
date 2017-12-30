clear all
clc
D=[1;1];
C=[2;1];
X=[0.912;0.986;1.06;1.13;1.19;1.26;1.32;1.38];
Y=[13.7;15.9;18.5;21.3;23.5;27.2;32.7;36.0];
A=[X,Y];
while norm(D-C)>10^(-6)
    C=D;
    for i1=1:length(X)
        r(i1,1)=C(1)*X(i1)^C(2)-Y(i1);
    end
    for i2=1:length(X)
        Dr(i2,1)=X(i2)^C(2);
        Dr(i2,2)=C(1)*X(i2)^C(2)*log(X(i2));
    end
    A=Dr;
    v=-inv(A.'*A)*A.'*r;
    D=C+v;
end
disp(D);
figure;
for i=1:length(X)
    plot(X(i),Y(i),'x','Color','r');
    hold on
end
x=linspace(0.9,1.5,100);
y=C(1).*x.^C(2);
plot(x,y);
xlabel('x');
ylabel('y');
title('Newton-Gauss');
RMSE=norm(r)/(length(X))^0.5

%lsqnonlin—È÷§
c=lsqnonlin('Function03',[16,2])