function [residual, T_order, T] = dynamic_resid(y, x, params, steady_state, T_order, T)
if nargin < 6
    T_order = -1;
    T = NaN(17, 1);
end
[T_order, T] = GrowthEstimate.sparse.dynamic_resid_tt(y, x, params, steady_state, T_order, T);
residual = NaN(4, 1);
    residual(1) = (T(4)/y(5)) - (T(9)*T(12));
    residual(2) = (y(5)) - (T(16));
    residual(3) = (y(6)) - (exp(y(8))*T(14)*T(17)-y(5)+y(2)*(1-params(2)));
    residual(4) = (y(8)) - (params(4)*y(4)+params(7)*x(1));
end
