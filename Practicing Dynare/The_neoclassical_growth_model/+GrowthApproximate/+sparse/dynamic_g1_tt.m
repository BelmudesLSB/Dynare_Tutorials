function [T_order, T] = dynamic_g1_tt(y, x, params, steady_state, T_order, T)
if T_order >= 1
    return
end
[T_order, T] = GrowthApproximate.sparse.dynamic_resid_tt(y, x, params, steady_state, T_order, T);
T_order = 1;
if size(T, 1) < 19
    T = [T; NaN(19 - size(T, 1), 1)];
end
T(17) = getPowerDeriv(T(3),1-params(5),1);
T(18) = getPowerDeriv(T(7),1-params(5),1);
T(19) = getPowerDeriv(y(2),params(4),1);
end
