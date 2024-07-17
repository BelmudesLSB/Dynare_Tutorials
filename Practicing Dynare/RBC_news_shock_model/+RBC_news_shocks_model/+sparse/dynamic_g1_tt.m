function [T_order, T] = dynamic_g1_tt(y, x, params, steady_state, T_order, T)
if T_order >= 1
    return
end
[T_order, T] = RBC_news_shocks_model.sparse.dynamic_resid_tt(y, x, params, steady_state, T_order, T);
T_order = 1;
if size(T, 1) < 8
    T = [T; NaN(8 - size(T, 1), 1)];
end
T(8) = getPowerDeriv(T(2),params(5)-1,1);
end
