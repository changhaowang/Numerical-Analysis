clear all
clc
A=input('ÇëÊäÈë¾ØÕóA:');
B=input('ÇëÊäÈë¾ØÕóB:');
C=input('ÇëÊäÈë¾ØÕóC:');
M=A+B*C*B.';
M1=inv(M);
M2=inv(A)-inv(A)*B*(inv(C)+B.'*inv(A)*B)*B.'*inv(A);
error=norm(M2-M1)