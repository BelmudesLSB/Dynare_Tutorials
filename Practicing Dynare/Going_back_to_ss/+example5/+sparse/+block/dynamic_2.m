function [y, T, residual, g1] = dynamic_2(y, x, params, steady_state, sparse_rowval, sparse_colval, sparse_colptr, T)
residual=NaN(4, 1);
  T(1)=y(11)^(1+params(6));
  residual(1)=(y(8)*params(5)*T(1))-((1-params(3))*y(7));
  T(2)=exp(y(12));
  residual(2)=(y(9))-(T(2)*(y(7)-y(8))+(1-params(4))*y(3));
  T(3)=exp(y(18));
  residual(3)=(y(9))-(params(1)*y(8)*T(2)/(T(3)*y(14))*(params(3)*T(3)*y(13)+y(9)*(1-params(4))));
  T(4)=exp(y(10));
  T(5)=T(4)*y(3)^params(3);
  T(6)=y(11)^(1-params(3));
  residual(4)=(y(7))-(T(5)*T(6));
if nargout > 3
    g1_v = NaN(14, 1);
g1_v(1)=(-(1-params(4)));
g1_v(2)=(-(T(6)*T(4)*getPowerDeriv(y(3),params(3),1)));
g1_v(3)=y(8)*params(5)*getPowerDeriv(y(11),1+params(6),1);
g1_v(4)=(-(T(5)*getPowerDeriv(y(11),1-params(3),1)));
g1_v(5)=1;
g1_v(6)=1-params(1)*y(8)*T(2)/(T(3)*y(14))*(1-params(4));
g1_v(7)=params(5)*T(1);
g1_v(8)=T(2);
g1_v(9)=(-(params(1)*(params(3)*T(3)*y(13)+y(9)*(1-params(4)))*T(2)/(T(3)*y(14))));
g1_v(10)=(-(1-params(3)));
g1_v(11)=(-T(2));
g1_v(12)=1;
g1_v(13)=(-(params(1)*(params(3)*T(3)*y(13)+y(9)*(1-params(4)))*(-(y(8)*T(2)*T(3)))/(T(3)*y(14)*T(3)*y(14))));
g1_v(14)=(-(params(1)*y(8)*T(2)/(T(3)*y(14))*params(3)*T(3)));
    if ~isoctave && matlab_ver_less_than('9.8')
        sparse_rowval = double(sparse_rowval);
        sparse_colval = double(sparse_colval);
    end
    g1 = sparse(sparse_rowval, sparse_colval, g1_v, 4, 12);
end
end
