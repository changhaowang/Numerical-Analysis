clear all
clc
n=[9,19,39];
h=(3/2)./(n+1);
for j=1:3
    t(1)=0;
    t(2)=t(1)+h(j);
    w(1,1)=-1;
    w(n(j)+2,1)=3;
    b=zeros(n(j),1);
    for i=2:n(j)+1
        t(i+1)=t(i)+h(j);
        if i==2
            A(1,1)=pi^2-18/h(j)^2;
            A(1,2)=9/h(j)^2;
            b(1)=-9/h(j)^2*w(1);
        elseif i==n(j)+1
            A(i-1,i-2)=9/h(j)^2;
            A(i-1,i-1)=pi^2-18/h(j)^2;
            b(i-1)=-9/h(j)^2*w(n(j)+2);
        else
            A(i-1,i-2)=9/h(j)^2;
            A(i-1,i-1)=pi^2-18/h(j)^2;
            A(i-1,i)=9/h(j)^2;
        end
    end
    w(2:(n(j)+1),1)=A\b;
    figure;
    subplot(2,1,1);
    e1(j)=plot(t,w,'r','Marker','o');
    hold on;
    y=@(t) 3*sin(pi*t/3)-cos(pi*t/3);
    e2(j)=ezplot(y,[0,3/2]);
    legend([e1(j),e2(j)],'数值解','解析解');
    x=['n=',num2str(n(j)),'时']
    title(x);
    grid on;
    v=y(t.');
    error=abs(v-w);
    subplot(2,1,2);
    e3(j)=plot(t,error,'Marker','o');
    title([x,'误差绝对值曲线']);
    xlim([0,3/2]);
    grid on;
end