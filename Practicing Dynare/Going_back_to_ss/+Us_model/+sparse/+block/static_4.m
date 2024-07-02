function [y, T, residual, g1] = static_4(y, x, params, sparse_rowval, sparse_colval, sparse_colptr, T)
residual=NaN(7, 1);
  residual(1)=(y(5))-(y(5)*params(6)+(1-params(6))*(y(3)+y(4)+params(7)*(y(2)-y(3))+y(8)*params(8))+params(12)*x(4));
  residual(2)=(y(1)-y(9))-(params(11)*x(1)+params(1)*(y(1)-y(9))+(1-params(4))*(1-params(4)*params(1))/params(4)*y(8));
  residual(3)=(y(8))-(y(8)*params(2)/(1+params(2))+y(8)*1/(1+params(2))-1/params(3)*(1-params(2))/(1+params(2))*(y(5)-y(1)-y(4))+params(15)*x(5));
  residual(4)=(y(9))-(y(1)*params(5)+(1-params(5))*y(3));
  residual(5)=(y(2))-((y(1)+y(1)+y(10)+y(11))/4);
  residual(6)=(y(11))-(y(10));
  residual(7)=(y(10))-(y(1));
if nargout > 3
    g1_v = NaN(19, 1);
g1_v(1)=1-params(6);
g1_v(2)=1/params(3)*(1-params(2))/(1+params(2));
g1_v(3)=(-((1-params(6))*params(8)));
g1_v(4)=(-((1-params(4))*(1-params(4)*params(1))/params(4)));
g1_v(5)=1-(params(2)/(1+params(2))+1/(1+params(2)));
g1_v(6)=1-params(1);
g1_v(7)=(-(1/params(3)*(1-params(2))/(1+params(2))));
g1_v(8)=(-params(5));
g1_v(9)=(-0.5);
g1_v(10)=(-1);
g1_v(11)=params(1)-1;
g1_v(12)=1;
g1_v(13)=(-((1-params(6))*params(7)));
g1_v(14)=1;
g1_v(15)=(-0.25);
g1_v(16)=1;
g1_v(17)=(-0.25);
g1_v(18)=(-1);
g1_v(19)=1;
    if ~isoctave && matlab_ver_less_than('9.8')
        sparse_rowval = double(sparse_rowval);
        sparse_colval = double(sparse_colval);
    end
    g1 = sparse(sparse_rowval, sparse_colval, g1_v, 7, 7);
end
end
