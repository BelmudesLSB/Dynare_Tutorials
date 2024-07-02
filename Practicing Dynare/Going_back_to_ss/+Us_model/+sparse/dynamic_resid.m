function [residual, T_order, T] = dynamic_resid(y, x, params, steady_state, T_order, T)
if nargin < 6
    T_order = -1;
    T = NaN(1, 1);
end
[T_order, T] = Us_model.sparse.dynamic_resid_tt(y, x, params, steady_state, T_order, T);
residual = NaN(11, 1);
    residual(1) = (y(12)-y(20)) - (params(11)*x(1)+params(1)*(y(23)-y(31))+(1-params(4))*(1-params(4)*params(1))/params(4)*y(19));
    residual(2) = (y(20)) - (params(5)*y(1)+(1-params(5))*y(14));
    residual(3) = (y(19)) - (params(2)/(1+params(2))*y(8)+1/(1+params(2))*y(30)-T(1)*(y(16)-y(23)-y(15))+params(15)*x(5));
    residual(4) = (y(16)) - (params(6)*y(5)+(1-params(6))*(y(14)+y(15)+params(7)*(y(13)-y(14))+y(19)*params(8))+params(12)*x(4));
    residual(5) = (y(15)) - (params(9)*y(4)+params(14)*x(3));
    residual(6) = (y(14)) - (params(10)+y(18));
    residual(7) = (y(18)) - (params(16)*y(7)+params(13)*x(2));
    residual(8) = (y(13)) - ((y(12)+y(1)+y(10)+y(11))/4);
    residual(9) = (y(17)) - (y(16));
    residual(10) = (y(21)) - (y(1));
    residual(11) = (y(22)) - (y(10));
end
