function [g1, T_order, T] = static_g1(y, x, params, sparse_rowval, sparse_colval, sparse_colptr, T_order, T)
if nargin < 8
    T_order = -1;
    T = NaN(4, 1);
end
[T_order, T] = r_star.sparse.static_g1_tt(y, x, params, T_order, T);
g1_v = NaN(40, 1);
g1_v(1)=(-1);
g1_v(2)=(-(T(2)*params(3)));
g1_v(3)=(-T(3));
g1_v(4)=(-1);
g1_v(5)=1-params(1);
g1_v(6)=(-1);
g1_v(7)=(-400);
g1_v(8)=(-T(4));
g1_v(9)=1;
g1_v(10)=1-params(5);
g1_v(11)=(-1);
g1_v(12)=(-((1-params(6))*params(7)));
g1_v(13)=1;
g1_v(14)=(-400);
g1_v(15)=T(4);
g1_v(16)=(-1);
g1_v(17)=1-params(6);
g1_v(18)=(-1);
g1_v(19)=1-params(14);
g1_v(20)=(-400);
g1_v(21)=(-1);
g1_v(22)=(-(T(2)*T(3)*(params(1)-1)));
g1_v(23)=1-params(13);
g1_v(24)=(-1);
g1_v(25)=(-(params(1)*T(3)/(1-params(1)*T(3))));
g1_v(26)=1-params(12);
g1_v(27)=1-params(1)*T(3)*(1-T(3));
g1_v(28)=(-(params(3)*params(2)));
g1_v(29)=1;
g1_v(30)=(-((1-params(6))*params(8)/4));
g1_v(31)=T(3);
g1_v(32)=1;
g1_v(33)=params(2)+T(2)*(1-T(3))-T(3)*params(1)*T(2)*(1-T(3));
g1_v(34)=(-T(4));
g1_v(35)=1;
g1_v(36)=(-1);
g1_v(37)=1;
g1_v(38)=1;
g1_v(39)=1;
g1_v(40)=1;
if ~isoctave && matlab_ver_less_than('9.8')
    sparse_rowval = double(sparse_rowval);
    sparse_colval = double(sparse_colval);
end
g1 = sparse(sparse_rowval, sparse_colval, g1_v, 16, 16);
end
