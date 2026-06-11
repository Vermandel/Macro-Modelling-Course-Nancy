function [y, T] = static_8(y, x, params, sparse_rowval, sparse_colval, sparse_colptr, T)
  y(18)=1000*y(5)*y(15)/(y(4)+1e-8);
end
