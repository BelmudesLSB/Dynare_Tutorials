function [g1, T_order, T] = dynamic_g1(y, x, params, steady_state, sparse_rowval, sparse_colval, sparse_colptr, T_order, T)
if nargin < 9
    T_order = -1;
    T = NaN(19, 1);
end
[T_order, T] = GrowthApproximate.sparse.dynamic_g1_tt(y, x, params, steady_state, T_order, T);
g1_v = NaN(18, 1);
g1_v(1)=(-((1-y(7))*T(14)*(1-params(4))*params(2)/(1-params(2))*exp(y(8))*T(19)));
g1_v(2)=(-(1-params(3)+T(16)*exp(y(8))*T(19)));
g1_v(3)=(-params(6));
g1_v(4)=(y(5)*T(2)*getPowerDeriv(y(5),params(2),1)*T(17)-T(4))/(y(5)*y(5));
g1_v(5)=1;
g1_v(6)=1;
g1_v(7)=(-(T(9)*T(11)*params(4)*exp(y(12))*getPowerDeriv(y(6),params(4)-1,1)));
g1_v(8)=1;
g1_v(9)=T(17)*T(1)*(-(getPowerDeriv(1-y(7),1-params(2),1)))/y(5);
g1_v(10)=(-((1-y(7))*(1-params(4))*params(2)/(1-params(2))*exp(y(8))*T(13)*getPowerDeriv(y(7),(-params(4)),1)-(1-params(4))*params(2)/(1-params(2))*exp(y(8))*T(13)*T(14)));
g1_v(11)=(-(exp(y(8))*T(13)*getPowerDeriv(y(7),1-params(4),1)));
g1_v(12)=(-T(15));
g1_v(13)=(-(exp(y(8))*T(13)*T(16)));
g1_v(14)=1;
g1_v(15)=(-(T(12)*params(1)*(y(9)*T(6)*getPowerDeriv(y(9),params(2),1)*T(18)-T(8))/(y(9)*y(9))));
g1_v(16)=(-(T(12)*params(1)*T(18)*T(5)*(-(getPowerDeriv(1-y(11),1-params(2),1)))/y(9)+T(9)*T(10)*getPowerDeriv(y(11),1-params(4),1)));
g1_v(17)=(-(T(9)*T(10)*T(11)));
g1_v(18)=(-params(7));
if ~isoctave && matlab_ver_less_than('9.8')
    sparse_rowval = double(sparse_rowval);
    sparse_colval = double(sparse_colval);
end
g1 = sparse(sparse_rowval, sparse_colval, g1_v, 4, 13);
end
