function [y, T, residual, g1] = dynamic_2(y, x, params, steady_state, sparse_rowval, sparse_colval, sparse_colptr, T)
residual=NaN(6, 1);
  T(1)=exp(y(18));
  T(2)=params(2)*T(1)^params(3);
  T(3)=exp(y(20));
  T(4)=exp(y(23));
  residual(1)=(T(2)/(1-T(3)))-(T(4));
  T(5)=exp(y(19));
  T(6)=exp(y(3));
  T(7)=exp(y(24));
  residual(2)=(params(7)*T(5))-((1-params(4))*T(6)+T(7));
  T(8)=exp(y(17));
  residual(3)=(T(4))-(T(8)*(1-params(5))/T(3));
  T(9)=exp(y(34));
  T(10)=params(1)/params(7)*T(9)^(-params(3));
  T(11)=params(5)*exp(y(37));
  T(12)=exp(y(36));
  T(13)=T(5)/T(12);
  T(14)=T(11)*T(13)^(params(5)-1)+1-params(4);
  residual(4)=(T(1)^(-params(3)))-(T(10)*T(14));
  residual(5)=(T(8))-(T(1)+T(7));
  T(15)=exp(y(21));
  T(16)=T(15)*T(6)^params(5);
  T(17)=T(3)^(1-params(5));
  residual(6)=(T(8))-(T(16)*T(17));
  T(18)=getPowerDeriv(T(13),params(5)-1,1);
if nargout > 3
    g1_v = NaN(19, 1);
g1_v(1)=(-((1-params(4))*T(6)));
g1_v(2)=(-(T(17)*T(15)*T(6)*getPowerDeriv(T(6),params(5),1)));
g1_v(3)=(-T(4));
g1_v(4)=T(4);
g1_v(5)=(-T(7));
g1_v(6)=(-T(7));
g1_v(7)=(-(T(8)*(1-params(5))/T(3)));
g1_v(8)=T(8);
g1_v(9)=T(8);
g1_v(10)=params(7)*T(5);
g1_v(11)=(-(T(10)*T(11)*T(13)*T(18)));
g1_v(12)=params(2)*T(1)*getPowerDeriv(T(1),params(3),1)/(1-T(3));
g1_v(13)=T(1)*getPowerDeriv(T(1),(-params(3)),1);
g1_v(14)=(-T(1));
g1_v(15)=(-(T(2)*(-T(3))))/((1-T(3))*(1-T(3)));
g1_v(16)=(-((-(T(3)*T(8)*(1-params(5))))/(T(3)*T(3))));
g1_v(17)=(-(T(16)*T(3)*getPowerDeriv(T(3),1-params(5),1)));
g1_v(18)=(-(T(14)*params(1)/params(7)*T(9)*getPowerDeriv(T(9),(-params(3)),1)));
g1_v(19)=(-(T(10)*T(11)*T(18)*(-(T(5)*T(12)))/(T(12)*T(12))));
    if ~isoctave && matlab_ver_less_than('9.8')
        sparse_rowval = double(sparse_rowval);
        sparse_colval = double(sparse_colval);
    end
    g1 = sparse(sparse_rowval, sparse_colval, g1_v, 6, 18);
end
end
