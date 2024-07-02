function [residual, T_order, T] = dynamic_resid(y, x, params, steady_state, T_order, T)
if nargin < 6
    T_order = -1;
    T = NaN(8, 1);
end
[T_order, T] = TwocountryEst.sparse.dynamic_resid_tt(y, x, params, steady_state, T_order, T);
residual = NaN(8, 1);
    residual(1) = (y(9)) - (y(10));
    residual(2) = (exp(y(9))^(-params(1))) - (T(1)*T(3));
    residual(3) = (exp(y(10))^(-params(1))) - (T(4)*T(6));
    residual(4) = (exp(y(12))+exp(y(11))+exp(y(9))+exp(y(10))-exp(y(3))*(1-params(2))-(1-params(2))*exp(y(4))) - (T(7)+T(8));
    residual(5) = (y(13)) - (params(5)*y(5)+x(1));
    residual(6) = (y(14)) - (params(5)*y(6)+x(2));
    residual(7) = (exp(y(15))) - (T(7));
    residual(8) = (exp(y(16))) - (T(8));
end
