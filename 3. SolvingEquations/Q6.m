clear all
clc
format long
p=5;
a=6;
while (abs(a-p)>10^(-6))
    p=a;
    a=(20*p+21/p^2)/21;
end
disp('方法一的结果为：')
disp(a);