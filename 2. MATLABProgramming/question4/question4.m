clear all
clc
x=linspace(-5,5);
y=1.1.*sign(x).*(abs(x)>1.1)+x.*(abs(x)<=1.1);
plot(x,y);
xlabel('x','fontname','Times New Roman');
ylabel('y','fontname','Times New Roman');
title('Saturated nonlinear function','fontname','Times New Roman');
