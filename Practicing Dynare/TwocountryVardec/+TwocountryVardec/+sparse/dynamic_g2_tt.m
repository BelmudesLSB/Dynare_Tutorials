function [T_order, T] = dynamic_g2_tt(y, x, params, steady_state, T_order, T)
if T_order >= 2
    return
end
[T_order, T] = TwocountryVardec.sparse.dynamic_g1_tt(y, x, params, steady_state, T_order, T);
T_order = 2;
if size(T, 1) < 22
    T = [T; NaN(22 - size(T, 1), 1)];
end
T(21) = exp(y(13))*(T(13)+exp(y(3))*exp(y(3))*getPowerDeriv(exp(y(3)),params(3),2));
T(22) = exp(y(14))*(T(17)+exp(y(4))*exp(y(4))*getPowerDeriv(exp(y(4)),params(3),2));
end
