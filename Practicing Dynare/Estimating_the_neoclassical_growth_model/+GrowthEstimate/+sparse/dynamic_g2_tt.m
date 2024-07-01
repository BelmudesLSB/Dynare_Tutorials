function [T_order, T] = dynamic_g2_tt(y, x, params, steady_state, T_order, T)
if T_order >= 2
    return
end
[T_order, T] = GrowthEstimate.sparse.dynamic_g1_tt(y, x, params, steady_state, T_order, T);
T_order = 2;
if size(T, 1) < 37
    T = [T; NaN(37 - size(T, 1), 1)];
end
T(35) = getPowerDeriv(T(3),1-params(6),2);
T(36) = getPowerDeriv(T(7),1-params(6),2);
T(37) = getPowerDeriv(y(2),params(3),2);
end
