function [T_order, T] = dynamic_resid_tt(y, x, params, steady_state, T_order, T)
if T_order >= 0
    return
end
T_order = 0;
if size(T, 1) < 8
    T = [T; NaN(8 - size(T, 1), 1)];
end
T(1) = params(4)*exp(y(17))^(-params(1));
T(2) = params(3)*exp(y(21))*exp(y(11))^(params(3)-1);
T(3) = 1+T(2)-params(2);
T(4) = params(4)*exp(y(18))^(-params(1));
T(5) = params(3)*exp(y(22))*exp(y(12))^(params(3)-1);
T(6) = 1+T(5)-params(2);
T(7) = exp(y(13))*exp(y(3))^params(3);
T(8) = exp(y(14))*exp(y(4))^params(3);
end
