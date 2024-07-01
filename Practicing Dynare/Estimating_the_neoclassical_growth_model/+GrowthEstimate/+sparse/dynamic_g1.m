function [g1, T_order, T] = dynamic_g1(y, x, params, steady_state, sparse_rowval, sparse_colval, sparse_colptr, T_order, T)
if nargin < 9
    T_order = -1;
    T = NaN(34, 1);
end
[T_order, T] = GrowthEstimate.sparse.dynamic_g1_tt(y, x, params, steady_state, T_order, T);
g1_v = NaN(18, 1);
g1_v(1)=(-((1-y(7))*T(15)*T(13)*T(25)));
g1_v(2)=(-(1-params(2)+T(17)*exp(y(8))*T(25)));
g1_v(3)=(-params(4));
g1_v(4)=(y(5)*T(19)*T(20)-T(4))/(y(5)*y(5));
g1_v(5)=1;
g1_v(6)=1;
g1_v(7)=(-(T(9)*T(27)));
g1_v(8)=1;
g1_v(9)=T(20)*T(1)*T(28)/y(5);
g1_v(10)=(-((1-y(7))*T(13)*T(14)*T(29)-T(13)*T(14)*T(15)));
g1_v(11)=(-(exp(y(8))*T(14)*T(30)));
g1_v(12)=(-T(16));
g1_v(13)=(-(exp(y(8))*T(14)*T(17)));
g1_v(14)=1;
g1_v(15)=(-(T(12)*T(24)));
g1_v(16)=(-(T(12)*T(32)+T(9)*T(34)));
g1_v(17)=(-(T(9)*T(10)*T(11)));
g1_v(18)=(-params(7));
if ~isoctave && matlab_ver_less_than('9.8')
    sparse_rowval = double(sparse_rowval);
    sparse_colval = double(sparse_colval);
end
g1 = sparse(sparse_rowval, sparse_colval, g1_v, 4, 13);
end
