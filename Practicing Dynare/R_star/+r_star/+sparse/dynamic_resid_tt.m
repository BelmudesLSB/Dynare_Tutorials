function [T_order, T] = dynamic_resid_tt(y, x, params, steady_state, T_order, T)
if T_order >= 0
    return
end
T_order = 0;
if size(T, 1) < 4
    T = [T; NaN(4 - size(T, 1), 1)];
end
T(1) = exp(params(11)/400);
T(2) = T(1)/(T(1)-params(1)*params(4))*T(1)/(T(1)-params(4));
T(3) = params(4)/T(1);
T(4) = T(2)^(-1);
end
