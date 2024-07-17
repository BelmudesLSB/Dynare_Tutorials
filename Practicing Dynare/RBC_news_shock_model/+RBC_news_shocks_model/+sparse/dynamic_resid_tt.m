function [T_order, T] = dynamic_resid_tt(y, x, params, steady_state, T_order, T)
if T_order >= 0
    return
end
T_order = 0;
if size(T, 1) < 7
    T = [T; NaN(7 - size(T, 1), 1)];
end
T(1) = params(1)/params(7)*exp(y(34))^(-params(3));
T(2) = exp(y(19))/exp(y(36));
T(3) = params(5)*exp(y(37))*T(2)^(params(5)-1);
T(4) = T(3)+1-params(4);
T(5) = params(2)*exp(y(18))^params(3);
T(6) = exp(y(21))*exp(y(3))^params(5);
T(7) = exp(y(20))^(1-params(5));
end
