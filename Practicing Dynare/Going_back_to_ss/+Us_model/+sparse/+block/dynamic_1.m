function [y, T] = dynamic_1(y, x, params, steady_state, sparse_rowval, sparse_colval, sparse_colptr, T)
  y(15)=params(9)*y(4)+params(14)*x(3);
  y(18)=params(16)*y(7)+params(13)*x(2);
  y(14)=params(10)+y(18);
end
