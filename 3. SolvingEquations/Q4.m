function [ S ] = Q4( k,x )
k=input('请输入整数k=')
x=input('请输入x=')
S=0; 
while k<0
    k=input('请重新输入整数k=')
    x=input('请重新输入x=')
end
for i=0:k
    S=S+x.^i./prod(1:i).*exp(-x)
end
end

