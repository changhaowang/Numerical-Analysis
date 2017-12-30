clc;
clear all;
X1=imread('.\pic_4_1.jpg');
X1=double(X1)/256;    
figure;
imshow(X1);
title('pic_4_1.jpg');
X2=imread('pic_4_2.jpg');
X2=double(X2)/256;
figure;
imshow(X2);
title('pic_4_1.jpg');
%小波
[c1,s1]=wavedec2(X1,2,'sym4');  
sizec1=size(c1);
[c2,s2]=wavedec2(X2,2,'sym4');
c=c1+c2;     %计算平均值
c=0.5*c;
s=s1+s2;
s=0.5*s;
xx=waverec2(c,s,'sym4'); 
figure;
imshow(xx);
title('融合后图像');   