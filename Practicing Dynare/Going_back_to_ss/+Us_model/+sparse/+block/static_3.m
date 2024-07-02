function [y, T] = static_3(y, x, params, sparse_rowval, sparse_colval, sparse_colptr, T)
  y(3)=params(10)+y(7);
end
