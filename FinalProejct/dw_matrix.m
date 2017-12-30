function [ dw ] = dw_matrix( r,dr,ddr )
%UNTITLED6 此处显示有关此函数的摘要
%calculate the acceleration matrix
A=eye(3)-(1-cos(norm(r)))/norm(r)^2*skew_matrix(r)+(norm(r)-sin(norm(r)))/norm(r)^3*skew_matrix(r)^3;
C=(norm(r)-sin(norm(r)))/norm(r)^3*cross(dr,cross(r,dr))-(2*cos(norm(r))+norm(r)*sin(norm(r))-2)/norm(r)^4*r.'*dr*cross(r,dr)+(3*sin(norm(r))*norm(r)*cos(norm(r))-2*norm(r))/norm(r)^5*r.'*dr*corss(r,cross(r,dr));
dw=A*ddr+C;
end

