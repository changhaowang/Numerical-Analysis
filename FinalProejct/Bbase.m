% 计算B样条曲线基函数
function N= Bbase(i,k,u,U)
% i=0,1...n为序号,k为阶次, u为自变量, U为节点向量
%计算N(i,0)
if k==0
    if i==FindSubs(u,U)
       N=1;
    else
       N=0;
    end
else
    D1=U(i+k+1)-U(i+1);
    D2=U(i+k+2)-U(i+2);
    if D1==0
        C1=0;
    else
        C1=(u-U(i+1))/D1;
    end
    if D2==0
        C2=0;
    else
        C2=(U(i+k+2)-u)/D2;
    end
%递归算法求解
    N=C1*Bbase(i,k-1,u,U)+C2*Bbase(i+1,k-1,u,U);
end
end

