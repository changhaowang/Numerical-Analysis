clear all
clc
t=[1,3,4,5,6,8];
y=[2,6,4,2,-1,-3];
C=[1;1;1;10];
D=[16;0.5;-0.8;0.5];%通过不停的尝试得到的初值
a=5;%通过尝试得到较好的初值
 while norm(D-C)>10^(-6)
    C=D;
    for i1=1:length(t)
        r(i1,1)=C(1)*exp(-C(2)*t(i1))*cos(C(3)*t(i1)+C(4))-y(i1);
    end
    for i2=1:length(t)
        Dr(i2,1)=exp(-C(2)*t(i2))*cos(C(3)*t(i2)+C(4));
        Dr(i2,2)=-C(1)*t(i2)*exp(-C(2)*t(i2))*cos(C(3)*t(i2)+C(4));
        Dr(i2,3)=-C(1)*t(i2)*exp(-C(2)*t(i2))*sin(C(3)*t(i2)+C(4));
        Dr(i2,4)=-C(1)*exp(-C(2)*t(i2))*sin(C(3)*t(i2)+C(4));
    end
    A=Dr;
    v=-inv(A.'*A+a*diag(diag(A.'*A)))*A.'*r;
    D=C+v;
 end
disp(D);
RMSE=norm(r)/(length(t))^0.5
figure;
for i=1:length(t)
    plot(t(i),y(i),'x','Color','r');
    hold on
end
t=linspace(1,10,100);
y=C(1).*exp(-C(2).*t).*cos(C(3).*t+C(4));
plot(t,y);
xlabel('t');
ylabel('y');
title('Levenberg-Marquardt');

%用lsqnonlin验算结果
 c=lsqnonlin('Function04',[8,0.1,0,2])