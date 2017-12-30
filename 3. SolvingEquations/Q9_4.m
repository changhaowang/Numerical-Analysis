clear all
clc
x=3;
p=2;
% while (abs(x-p)>10^(-6))
%     x=p
%     p=tan(pi-x);
% end
% A=['x=tan(pi-x)方法'];
% disp(A);
% p
% % x=3;
% p=2;
while (abs(x-p)>10^(-6))
    x=p;
    p=pi-atan(x);
end
B=['x=pi-atan(x)方法'];
disp(B);
p
p=2;
fun=@(x) tan(pi-x)-x;
fzero(fun,p)