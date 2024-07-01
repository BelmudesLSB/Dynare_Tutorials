function [y, T, residual, g1] = dynamic_2(y, x, params, steady_state, sparse_rowval, sparse_colval, sparse_colptr, T)
residual=NaN(3, 1);
  T(1)=exp(y(8));
  T(2)=y(2)^params(4);
  T(3)=y(7)^(1-params(4));
  residual(1)=(y(6))-(T(1)*T(2)*T(3)-y(5)+y(2)*(1-params(3)));
  T(4)=y(7)^(-params(4));
  residual(2)=(y(5))-((1-y(7))*(1-params(4))*params(2)/(1-params(2))*T(1)*T(2)*T(4));
  T(5)=y(5)^params(2);
  T(6)=(1-y(7))^(1-params(2));
  T(7)=T(5)*T(6);
  T(8)=T(7)^(1-params(5));
  T(9)=y(9)^params(2);
  T(10)=(1-y(11))^(1-params(2));
  T(11)=T(9)*T(10);
  T(12)=T(11)^(1-params(5));
  T(13)=params(1)*T(12)/y(9);
  T(14)=params(4)*exp(y(12));
  T(15)=T(14)*y(6)^(params(4)-1);
  T(16)=y(11)^(1-params(4));
  T(17)=1+T(15)*T(16)-params(3);
  residual(3)=(T(8)/y(5))-(T(13)*T(17));
  T(18)=getPowerDeriv(T(7),1-params(5),1);
  T(19)=getPowerDeriv(T(11),1-params(5),1);
  T(20)=getPowerDeriv(y(2),params(4),1);
if nargout > 3
    g1_v = NaN(12, 1);
g1_v(1)=(-(1-params(3)+T(3)*T(1)*T(20)));
g1_v(2)=(-((1-y(7))*T(4)*(1-params(4))*params(2)/(1-params(2))*T(1)*T(20)));
g1_v(3)=1;
g1_v(4)=(-(T(13)*T(16)*T(14)*getPowerDeriv(y(6),params(4)-1,1)));
g1_v(5)=(-(T(1)*T(2)*getPowerDeriv(y(7),1-params(4),1)));
g1_v(6)=(-((1-y(7))*(1-params(4))*params(2)/(1-params(2))*T(1)*T(2)*getPowerDeriv(y(7),(-params(4)),1)-(1-params(4))*params(2)/(1-params(2))*T(1)*T(2)*T(4)));
g1_v(7)=T(18)*T(5)*(-(getPowerDeriv(1-y(7),1-params(2),1)))/y(5);
g1_v(8)=1;
g1_v(9)=1;
g1_v(10)=(y(5)*T(6)*getPowerDeriv(y(5),params(2),1)*T(18)-T(8))/(y(5)*y(5));
g1_v(11)=(-(T(17)*params(1)*T(19)*T(9)*(-(getPowerDeriv(1-y(11),1-params(2),1)))/y(9)+T(13)*T(15)*getPowerDeriv(y(11),1-params(4),1)));
g1_v(12)=(-(T(17)*params(1)*(y(9)*T(10)*getPowerDeriv(y(9),params(2),1)*T(19)-T(12))/(y(9)*y(9))));
    if ~isoctave && matlab_ver_less_than('9.8')
        sparse_rowval = double(sparse_rowval);
        sparse_colval = double(sparse_colval);
    end
    g1 = sparse(sparse_rowval, sparse_colval, g1_v, 3, 9);
end
end
