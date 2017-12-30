function i= FindSubs(u,U)
  if u==U(end)
      i=length(U)-1;
  else
     for a=1:length(U)   
        if U(a)<=u && u<U(a+1)
            i=a-1;
        end
     end
  end
end

