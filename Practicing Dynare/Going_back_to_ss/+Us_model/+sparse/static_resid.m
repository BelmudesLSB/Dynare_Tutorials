function [residual, T_order, T] = static_resid(y, x, params, T_order, T)
if nargin < 5
    T_order = -1;
    T = NaN(1, 1);
end
[T_order, T] = Us_model.sparse.static_resid_tt(y, x, params, T_order, T);
residual = NaN(11, 1);
    residual(1) = (y(1)-y(9)) - (params(11)*x(1)+params(1)*(y(1)-y(9))+(1-params(4))*(1-params(4)*params(1))/params(4)*y(8));
    residual(2) = (y(9)) - (y(1)*params(5)+(1-params(5))*y(3));
    residual(3) = (y(8)) - (y(8)*params(2)/(1+params(2))+y(8)*1/(1+params(2))-T(1)*(y(5)-y(1)-y(4))+params(15)*x(5));
    residual(4) = (y(5)) - (y(5)*params(6)+(1-params(6))*(y(3)+y(4)+params(7)*(y(2)-y(3))+y(8)*params(8))+params(12)*x(4));
    residual(5) = (y(4)) - (y(4)*params(9)+params(14)*x(3));
    residual(6) = (y(3)) - (params(10)+y(7));
    residual(7) = (y(7)) - (y(7)*params(16)+params(13)*x(2));
    residual(8) = (y(2)) - ((y(1)+y(1)+y(10)+y(11))/4);
    residual(9) = (y(6)) - (y(5));
    residual(10) = (y(10)) - (y(1));
    residual(11) = (y(11)) - (y(10));
end
