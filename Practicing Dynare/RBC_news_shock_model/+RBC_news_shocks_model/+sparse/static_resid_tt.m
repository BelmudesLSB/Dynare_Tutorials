function [T_order, T] = static_resid_tt(y, x, params, T_order, T)
if T_order >= 0
    return
end
T_order = 0;
if size(T, 1) < 8
    T = [T; NaN(8 - size(T, 1), 1)];
end
T(1) = exp(y(2))^(-params(3));
T(2) = T(1)*params(1)/params(7);
T(3) = exp(y(3))/exp(y(4));
T(4) = params(5)*exp(y(5))*T(3)^(params(5)-1);
T(5) = T(4)+1-params(4);
T(6) = params(2)*exp(y(2))^params(3);
T(7) = exp(y(5))*exp(y(3))^params(5);
T(8) = exp(y(4))^(1-params(5));
end
