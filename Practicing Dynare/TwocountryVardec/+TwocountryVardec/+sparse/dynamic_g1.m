function [g1, T_order, T] = dynamic_g1(y, x, params, steady_state, sparse_rowval, sparse_colval, sparse_colptr, T_order, T)
if nargin < 9
    T_order = -1;
    T = NaN(20, 1);
end
[T_order, T] = TwocountryVardec.sparse.dynamic_g1_tt(y, x, params, steady_state, T_order, T);
g1_v = NaN(30, 1);
g1_v(1)=(-(exp(y(3))*(1-params(2))))-T(14);
g1_v(2)=(-T(14));
g1_v(3)=(-((1-params(2))*exp(y(4))))-T(18);
g1_v(4)=(-T(18));
g1_v(5)=(-params(5));
g1_v(6)=(-params(5));
g1_v(7)=1;
g1_v(8)=T(9);
g1_v(9)=exp(y(9));
g1_v(10)=(-1);
g1_v(11)=T(11);
g1_v(12)=exp(y(10));
g1_v(13)=(-(T(1)*T(16)));
g1_v(14)=exp(y(11));
g1_v(15)=(-(T(4)*T(20)));
g1_v(16)=exp(y(12));
g1_v(17)=(-T(7));
g1_v(18)=1;
g1_v(19)=(-T(7));
g1_v(20)=(-T(8));
g1_v(21)=1;
g1_v(22)=(-T(8));
g1_v(23)=exp(y(15));
g1_v(24)=exp(y(16));
g1_v(25)=(-(T(3)*params(4)*T(10)));
g1_v(26)=(-(T(6)*params(4)*T(12)));
g1_v(27)=(-(T(1)*T(2)));
g1_v(28)=(-(T(4)*T(5)));
g1_v(29)=(-1);
g1_v(30)=(-1);
if ~isoctave && matlab_ver_less_than('9.8')
    sparse_rowval = double(sparse_rowval);
    sparse_colval = double(sparse_colval);
end
g1 = sparse(sparse_rowval, sparse_colval, g1_v, 8, 26);
end
