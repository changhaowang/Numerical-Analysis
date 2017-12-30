clear all
clc
format long
syms x
A=[1,2,3,x;4,5,x,6;7,x,8,9;x,10,11,12];
m=0;
for i=-100:100
    B(i+101)=sym2poly(subs(det(A),x,i));
    if i==-100
        continue;
    elseif B(i+101)==0
        X=['根为：',num2str(i),' 以及....'];
        disp(X);
    elseif B(i+101)*B(i+100)<0
        m=m+1;
        a(m)=i-1;
        b(m)=i;
    else
        continue;
    end
end
for i=1:m
    while ((b(i)-a(i))/2>0.5*10^(-6))
        c(i)=(a(i)+b(i))/2;
        if subs(det(A),x,c(i))==0
            x(i)=c(i);
            break;
        end
        if subs(det(A),x,a(i))*subs(det(A),x,c(i))<0
            b(i)=c(i);
        else
            a(i)=c(i);
        end
    end
    xc(i)=(a(i)+b(i))/2;
end
disp(xc)
