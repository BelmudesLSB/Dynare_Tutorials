function [y, T, residual, g1] = dynamic_2(y, x, params, steady_state, sparse_rowval, sparse_colval, sparse_colptr, T)
residual=NaN(7, 1);
  residual(1)=(y(13))-((y(12)+y(1)+y(10)+y(11))/4);
  residual(2)=(y(16))-(params(6)*y(5)+(1-params(6))*(y(14)+y(15)+params(7)*(y(13)-y(14))+y(19)*params(8))+params(12)*x(4));
  residual(3)=(y(22))-(y(10));
  residual(4)=(y(21))-(y(1));
  residual(5)=(y(12)-y(20))-(params(11)*x(1)+params(1)*(y(23)-y(31))+(1-params(4))*(1-params(4)*params(1))/params(4)*y(19));
  residual(6)=(y(19))-(params(2)/(1+params(2))*y(8)+1/(1+params(2))*y(30)-1/params(3)*(1-params(2))/(1+params(2))*(y(16)-y(23)-y(15))+params(15)*x(5));
  residual(7)=(y(20))-(params(5)*y(1)+(1-params(5))*y(14));
if nargout > 3
    g1_v = NaN(25, 1);
g1_v(1)=(-params(6));
g1_v(2)=(-0.25);
g1_v(3)=(-0.25);
g1_v(4)=(-1);
g1_v(5)=(-0.25);
g1_v(6)=(-1);
g1_v(7)=(-params(5));
g1_v(8)=(-(params(2)/(1+params(2))));
g1_v(9)=1;
g1_v(10)=(-((1-params(6))*params(7)));
g1_v(11)=1;
g1_v(12)=1/params(3)*(1-params(2))/(1+params(2));
g1_v(13)=1;
g1_v(14)=1;
g1_v(15)=(-0.25);
g1_v(16)=1;
g1_v(17)=(-((1-params(6))*params(8)));
g1_v(18)=(-((1-params(4))*(1-params(4)*params(1))/params(4)));
g1_v(19)=1;
g1_v(20)=(-1);
g1_v(21)=1;
g1_v(22)=(-params(1));
g1_v(23)=(-(1/params(3)*(1-params(2))/(1+params(2))));
g1_v(24)=(-(1/(1+params(2))));
g1_v(25)=params(1);
    if ~isoctave && matlab_ver_less_than('9.8')
        sparse_rowval = double(sparse_rowval);
        sparse_colval = double(sparse_colval);
    end
    g1 = sparse(sparse_rowval, sparse_colval, g1_v, 7, 21);
end
end
