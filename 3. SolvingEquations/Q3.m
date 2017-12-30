clear all
clc
syms x s 
f(x)=x.^5+3*x.^4+4*x.^3+2*x.^2+3*x+6;
g(s)=subs(f(x),x,(s-1)./(s+1));
simplify(f(s)-g(s))
