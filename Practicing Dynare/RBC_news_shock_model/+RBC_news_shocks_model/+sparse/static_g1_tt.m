function [T_order, T] = static_g1_tt(y, x, params, T_order, T)
if T_order >= 1
    return
end
[T_order, T] = RBC_news_shocks_model.sparse.static_resid_tt(y, x, params, T_order, T);
T_order = 1;
if size(T, 1) < 10
    T = [T; NaN(10 - size(T, 1), 1)];
end
T(9) = exp(y(2))*getPowerDeriv(exp(y(2)),(-params(3)),1);
T(10) = getPowerDeriv(T(3),params(5)-1,1);
end
