clear all
clc
n=8;%8,18
h=1./(n+1);
t(1)=0;
t(2)=h;
w(1,1)=exp(3);
w(n+2,1)=1;
for i=2:n+1
    t(i+1)=t(i)+h;
    if i==2
        A(1,1)=2*h+2/h;
        A(1,2)=3*h/6-1/h-1;
        b(1,1)=-(3*h/6-1/h+1)*w(1);
    elseif i==n+1
        A(n,n-1)=3*h/6-1/h+1;
        A(n,n)=2*h+2/h;
        b(n,1)=-(3*h/6-1/h-1)*w(n+2);
    else
        A(i-1,i-2)=3*h/6-1/h+1;
        A(i-1,i-1)=2*h+2/h;
        A(i-1,i)=3*h/6-1/h-1;
    end
end
w(2:n+1,1)=A\b;
figure
e1=plot(t,w,'r','Marker','o');
grid on;
hold on;
%真实解作图
y=@(x) exp(3-3*x);
e2=ezplot(y,[0,1]);
legend([e1,e2],'Finite Element Method','真实解');
title(['n=',num2str(n),'函数曲线']);
figure;
error=(y(t)-w.');
plot(t,error);
grid on;
title(['n=',num2str(n),'误差曲线']);
xlim([0,1]);

