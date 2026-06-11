function [y, T] = static_6(y, x, params, sparse_rowval, sparse_colval, sparse_colptr, T)
  y(10)=1/params(9)*(1+y(3))^params(7);
  y(13)=(params(14)+params(34)*x(2))^(1/(params(22)-1));
  y(15)=params(14)+params(34)*x(2);
  y(5)=max(y(4)*params(23)/1000/params(22)*y(6),0);
end
