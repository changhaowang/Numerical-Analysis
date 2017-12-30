function[P,P0] =net_my (X,Y,x0)  
n = length(X);  
syms x
for i=1:n
    C(1,i)=x*(1/x);
end

P(x)=Y(1)+0*x;
    A = zeros(n,n);
    A(:,1) = Y';
    for j = 2 : n
        for i = j : n
            A(i,j) = (A(i,j-1) - A(i-1,j-1))/(X(i)-X(i-j+1));
        end
        for a=1:(j-1)
            C(j)=C(j)*(x-X(a));
        end
        P(x)=P(x)+A(j,j)*C(j);
    end
    P0=P(x0);
    P=P(x);
end