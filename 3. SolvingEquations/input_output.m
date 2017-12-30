clear all
clc
A=input('请输入数据对[x1,y1,x2,y2......](一定要输入方括号！)=')
B=reshape(A,2,[]);
fid=fopen('data.txt','w');
fprintf(fid,'%d %d\n',B);
fclose(fid);