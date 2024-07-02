function [residual, T_order, T] = dynamic_resid(y, x, params, steady_state, T_order, T)
if nargin < 6
    T_order = -1;
    T = NaN(5, 1);
end
[T_order, T] = convergence_to_ss.sparse.dynamic_resid_tt(y, x, params, steady_state, T_order, T);
residual = NaN(6, 1);
    residual(1) = (y(8)*params(5)*T(1)) - ((1-params(3))*y(7));
    residual(2) = (y(9)) - (params(1)*T(2)*(params(3)*exp(y(18))*y(13)+y(9)*(1-params(4))));
    residual(3) = (y(7)) - (T(5));
    residual(4) = (y(9)) - (exp(y(12))*(y(7)-y(8))+(1-params(4))*y(3));
    residual(5) = (y(10)) - (params(2)*y(4)+params(7)*y(6)+x(1));
    residual(6) = (y(12)) - (y(4)*params(7)+params(2)*y(6)+x(2));
end
