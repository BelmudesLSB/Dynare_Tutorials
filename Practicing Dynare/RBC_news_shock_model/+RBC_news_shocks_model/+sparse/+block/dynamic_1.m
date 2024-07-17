function [y, T] = dynamic_1(y, x, params, steady_state, sparse_rowval, sparse_colval, sparse_colptr, T)
  y(25)=x(1);
  y(26)=y(9);
  y(27)=y(10);
  y(28)=y(11);
  y(29)=y(12);
  y(30)=y(13);
  y(31)=y(14);
  y(32)=y(15);
  y(21)=params(6)*y(5)+x(2)+y(16);
end
