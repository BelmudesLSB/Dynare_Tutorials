function [y, T, residual, g1] = dynamic_2(y, x, params, steady_state, sparse_rowval, sparse_colval, sparse_colptr, T)
residual=NaN(4, 1);
  T(1)=exp(y(10));
  T(2)=exp(y(18));
  T(3)=params(4)*T(2)^(-params(1));
  T(4)=params(3)*exp(y(22));
  T(5)=exp(y(12));
  T(6)=1+T(4)*T(5)^(params(3)-1)-params(2);
  residual(1)=(T(1)^(-params(1)))-(T(3)*T(6));
  T(7)=exp(y(9));
  T(8)=exp(y(17));
  T(9)=params(4)*T(8)^(-params(1));
  T(10)=params(3)*exp(y(21));
  T(11)=exp(y(11));
  T(12)=1+T(10)*T(11)^(params(3)-1)-params(2);
  residual(2)=(T(7)^(-params(1)))-(T(9)*T(12));
  T(13)=exp(y(3));
  T(14)=exp(y(4));
  T(15)=exp(y(13));
  T(16)=T(15)*T(13)^params(3);
  T(17)=exp(y(14));
  T(18)=T(17)*T(14)^params(3);
  residual(3)=(T(5)+T(11)+T(7)+T(1)-T(13)*(1-params(2))-(1-params(2))*T(14))-(T(16)+T(18));
  residual(4)=(y(9))-(y(10));
if nargout > 3
    g1_v = NaN(14, 1);
g1_v(1)=(-((1-params(2))*T(14)))-T(17)*T(14)*getPowerDeriv(T(14),params(3),1);
g1_v(2)=(-(T(13)*(1-params(2))))-T(15)*T(13)*getPowerDeriv(T(13),params(3),1);
g1_v(3)=(-(T(3)*T(4)*T(5)*getPowerDeriv(T(5),params(3)-1,1)));
g1_v(4)=T(5);
g1_v(5)=(-(T(9)*T(10)*T(11)*getPowerDeriv(T(11),params(3)-1,1)));
g1_v(6)=T(11);
g1_v(7)=T(7)*getPowerDeriv(T(7),(-params(1)),1);
g1_v(8)=T(7);
g1_v(9)=1;
g1_v(10)=T(1)*getPowerDeriv(T(1),(-params(1)),1);
g1_v(11)=T(1);
g1_v(12)=(-1);
g1_v(13)=(-(T(12)*params(4)*T(8)*getPowerDeriv(T(8),(-params(1)),1)));
g1_v(14)=(-(T(6)*params(4)*T(2)*getPowerDeriv(T(2),(-params(1)),1)));
    if ~isoctave && matlab_ver_less_than('9.8')
        sparse_rowval = double(sparse_rowval);
        sparse_colval = double(sparse_colval);
    end
    g1 = sparse(sparse_rowval, sparse_colval, g1_v, 4, 12);
end
end
