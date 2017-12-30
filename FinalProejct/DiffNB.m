function D = DiffNB(u,U,p,k,i)
      %求NURBS基函数导数
      if U(i+p+1)-U(i+1)==0
          C1=0;
      else
          C1=p/(U(i+p+1)-U(i+1));
      end
      if U(i+p+2)-U(i+2)==0
          C2=0;
      else
          C2=p/(U(i+p+2)-U(i+2));
      end
      if k==1
          D=C1*Bbase(i,p-1,u,U)-C2*Bbase(i+1,p-1,u,U);
      else
          D=C1*DiffNB(u,U,p-1,k-1,i)-C2*DiffNB(u,U,p-1,k-1,i+1);
      end
end

