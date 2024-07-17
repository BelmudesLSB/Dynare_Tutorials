function [g1, T_order, T] = static_g1(y, x, params, sparse_rowval, sparse_colval, sparse_colptr, T_order, T)
if nargin < 8
    T_order = -1;
    T = NaN(10, 1);
end
[T_order, T] = RBC_news_shocks_model.sparse.static_g1_tt(y, x, params, T_order, T);
g1_v = NaN(39, 1);
g1_v(1)=exp(y(1));
g1_v(2)=exp(y(1));
g1_v(3)=(-(exp(y(1))*(1-params(5))/exp(y(4))));
g1_v(4)=(-(exp(y(1))*params(5)*4/exp(y(3))));
g1_v(5)=T(9)-T(5)*params(1)/params(7)*T(9);
g1_v(6)=params(2)*exp(y(2))*getPowerDeriv(exp(y(2)),params(3),1)/(1-exp(y(4)));
g1_v(7)=(-exp(y(2)));
g1_v(8)=(-(T(2)*params(5)*exp(y(5))*T(3)*T(10)));
g1_v(9)=params(7)*exp(y(3))-exp(y(3))*(1-params(4));
g1_v(10)=(-(T(8)*exp(y(5))*exp(y(3))*getPowerDeriv(exp(y(3)),params(5),1)));
g1_v(11)=(-((-(exp(y(3))*exp(y(1))*params(5)*4))/(exp(y(3))*exp(y(3)))));
g1_v(12)=(-(T(2)*params(5)*exp(y(5))*T(10)*(-(exp(y(3))*exp(y(4))))/(exp(y(4))*exp(y(4)))));
g1_v(13)=(-(T(6)*(-exp(y(4)))))/((1-exp(y(4)))*(1-exp(y(4))));
g1_v(14)=(-(T(7)*exp(y(4))*getPowerDeriv(exp(y(4)),1-params(5),1)));
g1_v(15)=(-((-(exp(y(4))*exp(y(1))*(1-params(5))))/(exp(y(4))*exp(y(4)))));
g1_v(16)=(-(T(2)*T(4)));
g1_v(17)=(-(T(7)*T(8)));
g1_v(18)=1-params(6);
g1_v(19)=1;
g1_v(20)=(-exp(y(7)));
g1_v(21)=exp(y(7));
g1_v(22)=(-exp(y(8)));
g1_v(23)=(-exp(y(8)));
g1_v(24)=1;
g1_v(25)=(-1);
g1_v(26)=1;
g1_v(27)=(-1);
g1_v(28)=1;
g1_v(29)=(-1);
g1_v(30)=1;
g1_v(31)=(-1);
g1_v(32)=1;
g1_v(33)=(-1);
g1_v(34)=1;
g1_v(35)=(-1);
g1_v(36)=1;
g1_v(37)=(-1);
g1_v(38)=(-1);
g1_v(39)=1;
if ~isoctave && matlab_ver_less_than('9.8')
    sparse_rowval = double(sparse_rowval);
    sparse_colval = double(sparse_colval);
end
g1 = sparse(sparse_rowval, sparse_colval, g1_v, 16, 16);
end
