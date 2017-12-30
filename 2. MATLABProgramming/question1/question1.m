clear all
clc
fid=fopen('yanghui.txt','w');
A=zeros(20,39);
A(1,20)=1;
A(20,1)=1;
A(20,39)=1;
for i=2:20;
    for j=2:38;
        if i+j==21|j-i==19;
            A(i,j)=1;
        else A(i,j)=A(i-1,j-1)+A(i-1,j+1);
        end
    end
end
for i=1:20;
    for j=1:39
        if A(i,j)==0&j~=39;
            fprintf(fid,'     ');
        elseif A(i,j)~=0;
            fprintf(fid,'%5d',A(i,j));
        else
            fprintf(fid,' \n');
        end
    end
end
fclose(fid);
fid=fopen('yanghui.txt');
C=fscanf(fid,'%d',[1,inf]);
line_10=C(46:55);
fclose(fid);