function [residual, T_order, T] = static_resid(y, x, params, T_order, T)
if nargin < 5
    T_order = -1;
    T = NaN(8, 1);
end
[T_order, T] = TwocountryEst.sparse.static_resid_tt(y, x, params, T_order, T);
residual = NaN(8, 1);
    residual(1) = (y(1)) - (y(2));
    residual(2) = (T(1)) - (T(1)*params(4)*T(3));
    residual(3) = (T(4)) - (params(4)*T(4)*T(6));
    residual(4) = (exp(y(4))+exp(y(3))+exp(y(1))+exp(y(2))-exp(y(3))*(1-params(2))-exp(y(4))*(1-params(2))) - (T(7)+T(8));
    residual(5) = (y(5)) - (y(5)*params(5)+x(1));
    residual(6) = (y(6)) - (y(6)*params(5)+x(2));
    residual(7) = (exp(y(7))) - (T(7));
    residual(8) = (exp(y(8))) - (T(8));
end
