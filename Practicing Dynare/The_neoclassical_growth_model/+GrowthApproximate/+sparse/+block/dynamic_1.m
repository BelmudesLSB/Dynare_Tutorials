function [y, T] = dynamic_1(y, x, params, steady_state, sparse_rowval, sparse_colval, sparse_colptr, T)
  y(8)=params(6)*y(4)+params(7)*x(1);
end
