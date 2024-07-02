function [T_order, T] = dynamic_g1_tt(y, x, params, steady_state, T_order, T)
if T_order >= 1
    return
end
[T_order, T] = TwocountryApprox.sparse.dynamic_resid_tt(y, x, params, steady_state, T_order, T);
T_order = 1;
if size(T, 1) < 10
    T = [T; NaN(10 - size(T, 1), 1)];
end
T(9) = exp(y(13))*exp(y(3))*getPowerDeriv(exp(y(3)),params(3),1);
T(10) = exp(y(14))*exp(y(4))*getPowerDeriv(exp(y(4)),params(3),1);
end
