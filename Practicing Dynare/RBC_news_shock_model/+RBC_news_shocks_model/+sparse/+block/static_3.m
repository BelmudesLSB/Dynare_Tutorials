function [y, T, residual, g1] = static_3(y, x, params, sparse_rowval, sparse_colval, sparse_colptr, T)
residual=NaN(6, 1);
  T(1)=exp(y(2));
  T(2)=exp(y(4));
  T(3)=params(2)*T(1)^params(3);
  T(4)=exp(y(7));
  residual(1)=(T(3)/(1-T(2)))-(T(4));
  T(5)=exp(y(3));
  T(6)=exp(y(8));
  residual(2)=(params(7)*T(5))-(T(5)*(1-params(4))+T(6));
  T(7)=exp(y(1));
  residual(3)=(T(7))-(T(1)+T(6));
  T(8)=exp(y(5));
  T(9)=T(8)*T(5)^params(5);
  T(10)=T(2)^(1-params(5));
  residual(4)=(T(7))-(T(9)*T(10));
  residual(5)=(T(4))-(T(7)*(1-params(5))/T(2));
  T(11)=T(1)^(-params(3));
  T(12)=params(5)*T(8)*(T(5)/T(2))^(params(5)-1)+1-params(4);
  residual(6)=(T(11))-(T(11)*params(1)/params(7)*T(12));
  T(13)=T(1)*getPowerDeriv(T(1),(-params(3)),1);
  T(14)=getPowerDeriv(T(5)/T(2),params(5)-1,1);
if nargout > 3
    g1_v = NaN(17, 1);
g1_v(1)=(-T(4));
g1_v(2)=T(4);
g1_v(3)=(-T(6));
g1_v(4)=(-T(6));
g1_v(5)=params(2)*T(1)*getPowerDeriv(T(1),params(3),1)/(1-T(2));
g1_v(6)=(-T(1));
g1_v(7)=T(13)-T(12)*params(1)/params(7)*T(13);
g1_v(8)=params(7)*T(5)-T(5)*(1-params(4));
g1_v(9)=(-(T(10)*T(8)*T(5)*getPowerDeriv(T(5),params(5),1)));
g1_v(10)=(-(T(11)*params(1)/params(7)*params(5)*T(8)*T(5)/T(2)*T(14)));
g1_v(11)=T(7);
g1_v(12)=T(7);
g1_v(13)=(-(T(7)*(1-params(5))/T(2)));
g1_v(14)=(-(T(3)*(-T(2))))/((1-T(2))*(1-T(2)));
g1_v(15)=(-(T(9)*T(2)*getPowerDeriv(T(2),1-params(5),1)));
g1_v(16)=(-((-(T(2)*T(7)*(1-params(5))))/(T(2)*T(2))));
g1_v(17)=(-(T(11)*params(1)/params(7)*params(5)*T(8)*T(14)*(-(T(5)*T(2)))/(T(2)*T(2))));
    if ~isoctave && matlab_ver_less_than('9.8')
        sparse_rowval = double(sparse_rowval);
        sparse_colval = double(sparse_colval);
    end
    g1 = sparse(sparse_rowval, sparse_colval, g1_v, 6, 6);
end
end
