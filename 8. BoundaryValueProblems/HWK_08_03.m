clear all
clc
n=9;%9,19,39
h=1./(n+1);
figure;
t(1)=0;
t(2)=h;
w(1,1)=1;
w(n+2,1)=-1;
w(:,2)=zeros(n+2,1);
while norm(w(:,1)-w(:,2))>10^(-10)
    w(:,2)=w(:,1);
    x(1)=-2/h^2;
    for i=2:n+1
        t(i+1)=t(i)+h;
        F(i-1,1)=1/h^2*w(i-1)-2/h^2*w(i)+1/h^2*w(i+1)-sin(-1/(2*h)*w(i-1)+1/(2*h)*w(i+1));
        if i<=n
            x(i)=-2/h^2;
            y(i-1)=1/h^2-1/(2*h)*cos(-1/(2*h)*w(i-1)+1/(2*h)*w(i+1));
            z(i-1)=1/h^2+1/(2*h)*cos(-1/(2*h)*w(i)+1/(2*h)*w(i+2));
        end
    end
    J=diag(x)+diag(y,1)+diag(z,-1);
    w(2:n+1,1)=w(2:n+1,2)-inv(J)*F
end

e1=plot(t,w(:,1),'r','Marker','o');
hold on;
%自带函数求解
twoode=@(x,y) [y(2);sin(y(2))];
twobc=@(ya,yb) [ya(1)-1;yb(1)+1];
solinit=bvpinit(linspace(0,1,5),[1 -2]);
sol=bvp4c(twoode,twobc,solinit);
x=linspace(0,1);
y=deval(sol,x);
e2=plot(x,y(1,:));
legend([e1,e2],'finite difference Method','自带函数bvp4c求解');
title(['n=',num2str(n),'时Nonlinear BVP']);
xlim([0,1]);
grid on;

