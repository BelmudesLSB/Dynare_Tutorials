function [y, T, residual, g1] = static_3(y, x, params, sparse_rowval, sparse_colval, sparse_colptr, T)
residual=NaN(4, 1);
  T(1)=exp(y(2));
  T(2)=T(1)^(-params(1));
  T(3)=exp(y(6));
  T(4)=exp(y(4));
  T(5)=1+params(3)*T(3)*T(4)^(params(3)-1)-params(2);
  residual(1)=(T(2))-(params(4)*T(2)*T(5));
  T(6)=exp(y(1));
  T(7)=exp(y(5));
  T(8)=exp(y(3));
  T(9)=T(7)*T(8)^params(3);
  T(10)=T(3)*T(4)^params(3);
  residual(2)=(T(4)+T(8)+T(6)+T(1)-T(8)*(1-params(2))-T(4)*(1-params(2)))-(T(9)+T(10));
  residual(3)=(y(1))-(y(2));
  T(11)=T(6)^(-params(1));
  T(12)=1+params(3)*T(7)*T(8)^(params(3)-1)-params(2);
  residual(4)=(T(11))-(T(11)*params(4)*T(12));
  T(13)=T(6)*getPowerDeriv(T(6),(-params(1)),1);
  T(14)=T(1)*getPowerDeriv(T(1),(-params(1)),1);
if nargout > 3
    g1_v = NaN(10, 1);
g1_v(1)=(-(params(4)*T(2)*params(3)*T(3)*T(4)*getPowerDeriv(T(4),params(3)-1,1)));
g1_v(2)=T(4)-T(4)*(1-params(2))-T(3)*T(4)*getPowerDeriv(T(4),params(3),1);
g1_v(3)=T(14)-T(5)*params(4)*T(14);
g1_v(4)=T(1);
g1_v(5)=(-1);
g1_v(6)=T(6);
g1_v(7)=1;
g1_v(8)=T(13)-T(12)*params(4)*T(13);
g1_v(9)=T(8)-T(8)*(1-params(2))-T(7)*T(8)*getPowerDeriv(T(8),params(3),1);
g1_v(10)=(-(T(11)*params(4)*params(3)*T(7)*T(8)*getPowerDeriv(T(8),params(3)-1,1)));
    if ~isoctave && matlab_ver_less_than('9.8')
        sparse_rowval = double(sparse_rowval);
        sparse_colval = double(sparse_colval);
    end
    g1 = sparse(sparse_rowval, sparse_colval, g1_v, 4, 4);
end
end
