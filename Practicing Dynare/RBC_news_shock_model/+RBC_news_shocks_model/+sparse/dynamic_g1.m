function [g1, T_order, T] = dynamic_g1(y, x, params, steady_state, sparse_rowval, sparse_colval, sparse_colptr, T_order, T)
if nargin < 9
    T_order = -1;
    T = NaN(8, 1);
end
[T_order, T] = RBC_news_shocks_model.sparse.dynamic_g1_tt(y, x, params, steady_state, T_order, T);
g1_v = NaN(44, 1);
g1_v(1)=(-((1-params(4))*exp(y(3))));
g1_v(2)=(-(T(7)*exp(y(21))*exp(y(3))*getPowerDeriv(exp(y(3)),params(5),1)));
g1_v(3)=(-((-(exp(y(3))*exp(y(17))*params(5)*4))/(exp(y(3))*exp(y(3)))));
g1_v(4)=(-params(6));
g1_v(5)=(-1);
g1_v(6)=(-1);
g1_v(7)=(-1);
g1_v(8)=(-1);
g1_v(9)=(-1);
g1_v(10)=(-1);
g1_v(11)=(-1);
g1_v(12)=(-1);
g1_v(13)=exp(y(17));
g1_v(14)=exp(y(17));
g1_v(15)=(-(exp(y(17))*(1-params(5))/exp(y(20))));
g1_v(16)=(-(exp(y(17))*params(5)*4/exp(y(3))));
g1_v(17)=exp(y(18))*getPowerDeriv(exp(y(18)),(-params(3)),1);
g1_v(18)=params(2)*exp(y(18))*getPowerDeriv(exp(y(18)),params(3),1)/(1-exp(y(20)));
g1_v(19)=(-exp(y(18)));
g1_v(20)=(-(T(1)*params(5)*exp(y(37))*T(2)*T(8)));
g1_v(21)=params(7)*exp(y(19));
g1_v(22)=(-(T(5)*(-exp(y(20)))))/((1-exp(y(20)))*(1-exp(y(20))));
g1_v(23)=(-(T(6)*exp(y(20))*getPowerDeriv(exp(y(20)),1-params(5),1)));
g1_v(24)=(-((-(exp(y(20))*exp(y(17))*(1-params(5))))/(exp(y(20))*exp(y(20)))));
g1_v(25)=(-(T(6)*T(7)));
g1_v(26)=1;
g1_v(27)=1;
g1_v(28)=(-exp(y(23)));
g1_v(29)=exp(y(23));
g1_v(30)=(-exp(y(24)));
g1_v(31)=(-exp(y(24)));
g1_v(32)=1;
g1_v(33)=1;
g1_v(34)=1;
g1_v(35)=1;
g1_v(36)=1;
g1_v(37)=1;
g1_v(38)=1;
g1_v(39)=1;
g1_v(40)=(-(T(4)*params(1)/params(7)*exp(y(34))*getPowerDeriv(exp(y(34)),(-params(3)),1)));
g1_v(41)=(-(T(1)*params(5)*exp(y(37))*T(8)*(-(exp(y(19))*exp(y(36))))/(exp(y(36))*exp(y(36)))));
g1_v(42)=(-(T(1)*T(3)));
g1_v(43)=(-1);
g1_v(44)=(-1);
if ~isoctave && matlab_ver_less_than('9.8')
    sparse_rowval = double(sparse_rowval);
    sparse_colval = double(sparse_colval);
end
g1 = sparse(sparse_rowval, sparse_colval, g1_v, 16, 50);
end
