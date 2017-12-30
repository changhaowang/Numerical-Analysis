function [ Px,Py ] = bez_my( U,X,Y )
%UNTITLED5 此处显示有关此函数的摘要
%此处显示详细说明
if length(U)~=4 | length(X)~=4 | length(Y)~=4
    disp('error');
    return;
else
    Px(1)=X(1);
    Py(1)=Y(1);
    Px(4)=X(4);
    Py(4)=Y(4);
    for i=2:3
        Px(i)=X(i)+(X(i+1)-X(i-1))/4;
        Py(i)=Y(i)+(Y(i+1)-Y(i-1))/4;
    end
end

end

