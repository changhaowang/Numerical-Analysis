clear all
clc
syms x
%format double
for i=1:12
    h(i,1)=10^(-i);
end
f(x)=sin(x)-cos(x);
g(x)=(f(x+h)-f(x-h))./(2.*h);
f1(x)=diff(f(x));    
A(:,1)=h;
A(:,2)=sym2poly(g(0));
A(:,3)=A(:,2)-sym2poly(f1(0));
fid=fopen('table.txt','w');
fprintf(fid,'%15s %15s %15s\n','h','f.(x)','error');
fprintf(fid,'%15.12f %15.12f %15.12f\n',A.');
fclose(fid);
figure;
x=h;
y=A(:,3);
plot(x,y);
%axis([10^(-6) 1 10^(-6) 10^(-3)]);%%此处设置坐标轴的范围
title('error-h的函数');
xlabel('h');
ylabel('error');
