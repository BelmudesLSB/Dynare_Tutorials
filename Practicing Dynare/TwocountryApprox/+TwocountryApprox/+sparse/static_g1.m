function [g1, T_order, T] = static_g1(y, x, params, sparse_rowval, sparse_colval, sparse_colptr, T_order, T)
if nargin < 8
    T_order = -1;
    T = NaN(12, 1);
end
[T_order, T] = TwocountryApprox.sparse.static_g1_tt(y, x, params, T_order, T);
g1_v = NaN(22, 1);
g1_v(1)=1;
g1_v(2)=T(9)-T(3)*params(4)*T(9);
g1_v(3)=exp(y(1));
g1_v(4)=(-1);
g1_v(5)=T(10)-T(6)*params(4)*T(10);
g1_v(6)=exp(y(2));
g1_v(7)=(-(T(1)*params(4)*params(3)*exp(y(5))*exp(y(3))*getPowerDeriv(exp(y(3)),params(3)-1,1)));
g1_v(8)=exp(y(3))-exp(y(3))*(1-params(2))-T(11);
g1_v(9)=(-T(11));
g1_v(10)=(-(params(4)*T(4)*params(3)*exp(y(6))*exp(y(4))*getPowerDeriv(exp(y(4)),params(3)-1,1)));
g1_v(11)=exp(y(4))-exp(y(4))*(1-params(2))-T(12);
g1_v(12)=(-T(12));
g1_v(13)=(-(T(1)*params(4)*T(2)));
g1_v(14)=(-T(7));
g1_v(15)=1-params(5);
g1_v(16)=(-T(7));
g1_v(17)=(-(params(4)*T(4)*T(5)));
g1_v(18)=(-T(8));
g1_v(19)=1-params(5);
g1_v(20)=(-T(8));
g1_v(21)=exp(y(7));
g1_v(22)=exp(y(8));
if ~isoctave && matlab_ver_less_than('9.8')
    sparse_rowval = double(sparse_rowval);
    sparse_colval = double(sparse_colval);
end
g1 = sparse(sparse_rowval, sparse_colval, g1_v, 8, 8);
end
