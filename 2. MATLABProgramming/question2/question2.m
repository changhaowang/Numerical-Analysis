clear all 
clc
a=input('a=');
b=input('b=');
c=input('c=');
d=b^2-4*a*c;
if d<0
    disp('нч╫Б')
elseif d==0
    x=-2*a/b;
    a=['x=',num2str(x)];
    disp(a)
else
    x=[(-b+sqrt(d))/(2*a),(-b-sqrt(d))/(2*a)];
   b=['x1=',num2str(x(1)),'  x2=',num2str(x(2))];
    disp(b)
end
