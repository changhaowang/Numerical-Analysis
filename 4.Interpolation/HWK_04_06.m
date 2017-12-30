clear all
clc
[H,H0]=her_my([0.3,0.32,0.35],[0.29552,0.31457,0.34290],[0.95534,0.94924,0.93937],0.34);
figure;
ezplot(H(1),[-1,0.32]);
hold on;
ezplot(H(2),[0.32,1]);
title('hermite method');
X=['f(0.34)=',num2str(H0)];
disp(X);