clear all
clc
n=input('«Î ‰»În=');
A=input('«Î ‰»ÎA=');
X=linspace(-50,50);
for i=1:100
    Y(i)=horner(n,A,X(i));
end
figure
subplot(2,1,1)
plot(X,Y);
title('horner method')
Y2=polyval(A,X);
subplot(2,1,2)
plot(X,Y2);
title('polyval')
