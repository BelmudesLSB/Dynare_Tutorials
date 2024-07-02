function [T_order, T] = static_g1_tt(y, x, params, T_order, T)
if T_order >= 1
    return
end
[T_order, T] = TwocountryApprox.sparse.static_resid_tt(y, x, params, T_order, T);
T_order = 1;
if size(T, 1) < 12
    T = [T; NaN(12 - size(T, 1), 1)];
end
T(9) = exp(y(1))*getPowerDeriv(exp(y(1)),(-params(1)),1);
T(10) = exp(y(2))*getPowerDeriv(exp(y(2)),(-params(1)),1);
T(11) = exp(y(5))*exp(y(3))*getPowerDeriv(exp(y(3)),params(3),1);
T(12) = exp(y(6))*exp(y(4))*getPowerDeriv(exp(y(4)),params(3),1);
end
